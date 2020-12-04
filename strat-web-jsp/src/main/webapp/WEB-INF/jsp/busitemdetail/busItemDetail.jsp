<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags"%>
<!DOCTYPE HTML>
<html>
<head>
    <!-- jsp文件头和头部 -->
    <%@ include file="../top.jsp" %>
</head>
<body>
<div class="container-fluid" id="main-container">
    <div id="page-content" class="clearfix">
        <div class="row-fluid">
            <div class="row-fluid">
                <h1>会计分录
                    <small><i class="icon-double-angle-right"></i> 业务操作对应的会计分录</small>
                </h1>
                <!-- 检索  -->
                    <table id="table_report" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                         <%--   <th class="center">
                                <label><input type="checkbox" id="zcheckbox"/><span class="lbl"></span></label>
                            </th>--%>
                            <th class="center">序号</th>
                            <th scope="col">时间</th>
                            <th scope="col">请求流水</th>
                            <th scope="col">系统流水</th>
                            <th scope="col">借方发生额</th>
                            <th scope="col">贷方发生额</th>
                            <th scope="col">名称</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- 开始循环 -->
                        <c:choose>
                            <c:when test="${not empty itemList}">
                                <c:forEach items="${itemList}" var="record" varStatus="vs">
                                    <tr>
                                        <%--<td class='center' style="width: 30px;">
                                            <label>
                                                <input type='checkbox' name='ids' value="" id="" alt=""/>
                                                <span class="lbl"></span>
                                            </label>
                                        </td>--%>
                                        <td class='center' style="width: 30px;">${vs.index+1}</td>
                                        <td>${record.date}&nbsp;<span>${record.time}</span></td>
                                        <td>${record.requestNo}</td>
                                        <td class="dingdan-num">${record.systemNo}</td>
                                        <td class="money">${record.debitAmount}</td>
                                        <td class="money">${record.creditAmount}</td>
                                        <td>${record.name}</td>
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
                <h1>账户变动明细
                    <small><i class="icon-double-angle-right"></i> 会计分录对应的账户变动</small>
                </h1>

                <table id="table_report2" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <%--   <th class="center">
                               <label><input type="checkbox" id="zcheckbox"/><span class="lbl"></span></label>
                           </th>--%>
                            <th class="center">序号</th>
                            <th scope="col">时间</th>
                            <th scope="col">名称</th>
                            <th scope="col">流水号</th>
                            <th scope="col">操作类型</th>
                            <th scope="col">收入</th>
                            <th scope="col">支出</th>
                            <th scope="col">账户余额</th>
                            <th scope="col">账户名称</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- 开始循环 -->
                    <c:choose>
                        <c:when test="${not empty changeList}">
                            <c:forEach items="${changeList}" var="record" varStatus="vs">
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
                                    <td>${record.operType}</td>
                                    <c:if test="${record.add}">
                                        <td class="money">+${record.operateAmount}</td>
                                        <td class="money"></td>
                                    </c:if>
                                    <c:if test="${!record.add}">
                                        <td class="money"></td>
                                        <td class="money">-${record.operateAmount}</td>
                                    </c:if>
                                    <td class="money">${record.afterBalance}</td>
                                    <td class="money">${record.accountTypeName}</td>
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

</body>
</html>
