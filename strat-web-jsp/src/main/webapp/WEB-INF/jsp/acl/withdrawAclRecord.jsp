<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
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
                <form action="/finance/acl/showWithdrawAcl" method="post" name="Form" id="Form">
                    <table>
                        <tr>
                            <td>
                                <span class="input-icon">
                                    <input id="merNo" name="merNo" type="text" value="${merNo}"
                                           placeholder="请输入商户号"/>
                                </span>
                            </td>
                            <td style="vertical-align:top;">
                                <button class="btn btn-mini btn-light" type="submit" title="检索">
                                    查询
                                </button>
                            </td>
                        </tr>
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
                            <th scope="col">商户号</th>
                            <th scope="col">结算至提现账户比例</th>
                            <th scope="col">状态</th>
                            <th scope="col">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- 开始循环 -->
                        <c:choose>
                            <c:when test="${not empty page.list}">
                                <c:forEach items="${page.list}" var="record" varStatus="vs">
                                    <tr>
                                        <td class='center' style="width: 30px;">${vs.index+1}</td>
                                        <td>${record.date}</td>
                                        <td>${record.merNo}</td>
                                        <td class="money">${record.rate}</td>
                                        <td>${record.state}</td>
                                        <td style="width: 60px;" class="center">
                                            <div class='hidden-phone visible-desktop btn-group'>
                                                <a class='btn btn-mini btn-primary' title="编辑"
                                                   href="javascript:void(0);"
                                                   onclick="editController(${record.merNo})">
                                                    编辑
                                                </a>
                                            </div>
                                        </td>
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
                                <td style="vertical-align:top;">
                                    <a onclick="addController();" class="btn btn-small btn-success">新增</a>
                                </td>
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

<script type="text/javascript" src="/static/plugins/attention/zDialog/zDrag.js"></script>
<script type="text/javascript" src="/static/plugins/attention/zDialog/zDialog.js"></script>

<!-- ace scripts -->
<script type="text/javascript" src="/static/js/ace-elements.min.js"></script>
<script type="text/javascript" src="/static/js/ace.min.js"></script>

<script type="text/javascript" src="/static/js/common/fn_jquery.js"></script>
<script type="text/javascript" src="/static/js/jquery.json.js"></script>
<script type="text/javascript" src="/static/plugins/zoomimage/js/jquery.js"></script>
<script src="/static/js/jquery-2.1.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<!--提示框-->
<script type="text/javascript">
    function addController() {
        var diag = new Dialog();
        diag.Drag = true;
        diag.Title = "新增提现控制设置";
        diag.URL = '/finance/acl/toAddWithdrawAcl';
        diag.Width = 650;
        diag.Height = 600;
        diag.CancelEvent = function() {
            $("#Form").submit();
            diag.close();
        };
        diag.show();
    }

    function editController(id) {
        if (id == null | id == "") {
            alert("商户号不能为空");
            return;
        }
        var diag = new Dialog();
        diag.Drag = true;
        diag.Title = "提现控制信息修改";
        diag.URL = '/finance/acl/toEditWithdrawAcl?merNo=' + id;
        diag.Width = 650;
        diag.Height = 600;
        diag.CancelEvent = function () {
            $("#Form").submit();
            diag.close();
        };
        diag.show();
    }
</script>

</body>
</html>
