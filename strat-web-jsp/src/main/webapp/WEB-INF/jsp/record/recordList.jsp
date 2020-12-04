<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags"%>
<!DOCTYPE HTML>
<html>
<head>
    <!-- jsp文件头和头部 -->
    <%@ include file="../top.jsp" %>
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap-datetimepicker.min.css"/>
</head>
<body>
<div class="container-fluid" id="main-container">
    <div id="page-content" class="clearfix">
        <div class="row-fluid">
            <div class="row-fluid">
                <!-- 检索  -->
                <form action="recordDetail" method="post" name="Form" id="Form">
                    <input id="accountID" name="accountID" type="hidden" value="${accountID}"/>
                    <table>
                        <tr>
                            <td>
                                <span class="input-icon">
                                    <select id="changeType" name="changeType">
                                        <c:if test="${not empty changeType}">
                                            <option value="${changeType}">${changeName}</option>
                                        </c:if>
                                        <option value="">---请选择出入金---</option>
                                        <option value="in">入金</option>
                                        <option value="out">出金</option>
                                     </select>
                                </span>
                            </td>
                            <td>
                                <input class="span10 date-picker" name="beginTime" id="beginTime" value="${beginTime}" type="text"
                                       style="width:130px;" placeholder="开始日期"/>
                            </td>
                            <td>
                                <input class="span10 date-picker" name="endTime" id="endTime" value="${endTime}" type="text"
                                       style="width:130px;" placeholder="结束日期"/>
                            </td>
                            <td style="vertical-align:top;">
                                <button class="btn btn-mini btn-light" type="submit" title="检索">
                                    查询
                                </button>
                            </td>
                        </tr>
                        <div class="row-fluid">
                            <div class="span12 pull-left">
                                <h4 class="pull-left" style="margin-right: 10px;">
                                    入金金额 : <span class="red">￥${page.inAmount}</span>
                                </h4>
                                <h4 class="pull-left">
                                    出金金额 : <span class="red">￥${page.outAmount}</span>
                                </h4>
                            </div>
                        </div>
                    </table>
                    <!-- 检索  -->
                    <table id="table_report" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                         <%--   <th class="center">
                                <label><input type="checkbox" id="zcheckbox"/><span class="lbl"></span></label>
                            </th>--%>
                            <th class="center">序号</th>
                            <th scope="col">时间</th>
                            <th scope="col">名称</th>
                            <th scope="col">流水号</th>
                            <th scope="col">收入</th>
                            <th scope="col">支出</th>
                            <th scope="col">账户余额</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- 开始循环 -->
                        <c:choose>
                            <c:when test="${not empty page.list}">
                                <c:forEach items="${page.list}" var="record" varStatus="vs">
                                    <tr>
                                        <%--<td class='center' style="width: 30px;">
                                            <label>
                                                <input type='checkbox' name='ids' value="" id="" alt=""/>
                                                <span class="lbl"></span>
                                            </label>
                                        </td>--%>
                                        <td class='center' style="width: 30px;">${vs.index+1}</td>
                                        <td>${record.date}&nbsp;<span>${record.time}</span></td>
                                        <td>${record.buinessName}</td>
                                        <td class="dingdan-num">交易号：${record.systemNo}</td>
                                        <c:if test="${record.add}">
                                            <td class="money">+${record.operateAmount}</td>
                                            <td class="money"></td>
                                        </c:if>
                                        <c:if test="${!record.add}">
                                            <td class="money"></td>
                                            <td class="money">-${record.operateAmount}</td>
                                        </c:if>
                                        <td class="money">${record.afterBalance}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr class="main_info">
                                    <td colspan="100" class="center">没有相关数据</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>

                    <div class="page-header position-relative">
                        <table style="width:100%;">
                            <tr>
                                <%--<td style="vertical-align:top;">
                                    <a onclick="addModeOfPayment();" class="btn btn-small btn-success">新增</a>
                                </td>--%>
                                <td style="vertical-align:top;">
                                    <page:page page="${page}"></page:page>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
            <!-- PAGE CONTENT ENDS HERE -->
        </div>
        <!--/row-->
    </div>
    <!--/#page-content-->
</div>
<!--/.fluid-container#main-container-->

<!-- page specific plugin scripts -->
<script type="text/javascript" src="/static/js/fuelux.wizard.js"></script>
<script type="text/javascript" src="/static/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/static/js/bootbox.min.js"></script>
<script type="text/javascript" src="/static/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript" src="/static/js/moment.js"></script>
<script type="text/javascript" src="/static/js/date.js"></script>
<script type="text/javascript" src="/static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="/static/js/chosen.jquery.min.js"></script>

<script type="text/javascript" src="/static/js/plugins/attention/zDialog/zDrag.js"></script>
<script type="text/javascript" src="/static/js/plugins/attention/zDialog/zDialog.js"></script>

<!-- ace scripts -->
<script type="text/javascript" src="/static/js/ace-elements.min.js"></script>
<script type="text/javascript" src="/static/js/ace.min.js"></script>

<script type="text/javascript" src="/static/js/common/fn_jquery.js"></script>
<script type="text/javascript" src="/static/js/jquery.json.js"></script>
<script type="text/javascript" src="/static/plugins/zoomimage/js/jquery.js"></script>
<script src="/static/js/jquery-2.1.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/bootstrap-datetimepicker.min.js"></script>
<script src="/static/js/bootstrap-datetimepicker.zh-CN.js"></script>
<!--提示框-->
<script type="text/javascript">
    $("#beginTime").datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1,
        format:'yyyy-mm-dd hh:ii'
    });

    $("#endTime").datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1,
        format:'yyyy-mm-dd hh:ii'
    });
    function addModeOfPayment(){
        <%--var diag = new Dialog();--%>
        <%--diag.Drag = true;--%>
        <%--diag.Title = "添加商户";--%>
        <%--diag.URL = '${site.ctx}/cs/goAddMerchant.html';--%>
        <%--diag.Width = 350;--%>
        <%--diag.Height = 300;--%>
        <%--IMAGESPATH = "${site.ctx}" + IMAGESPATH;--%>
        <%--diag.CancelEvent = function() {--%>
            <%--self.location=self.location;--%>
            <%--diag.close();--%>
        <%--};--%>
        <%--diag.show();--%>
    }
    //导出excel
    function toExcel() {
        <%--window.location.href = '${site.ctx}/advice/excel.do';--%>
    }
</script>

</body>
</html>
