<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../top.jsp" %>
<html>
<head>
    <title>系统账户余额</title>
    <%--<base href="<%=basePath%>">--%>
    <%--<!-- jsp文件头和头部 -->--%>
</head>
<body>
<div class="container-fluid" id="main-container">
    <div id="page-content" class="clearfix">
        <div class="row-fluid">
            <div class="row-fluid">
                <!-- 检索  -->
                <form id="from1" action="sysBalance" method="post" onsubmit="return check();">
                    <table>
                        <tr>
                            <td>
                                <span class="input-icon">
                                     <select id="subject" name="subject">
                                        <option value="${defaultSub}">${subjectName}</option>
                                          <c:forEach items="${subjects}" var="info">
                                              <option value='${info.toString()}'>${info.getMessage()}</option>
                                          </c:forEach>
                                     </select>
                                </span>
                            </td>
                            <td style="vertical-align:top;">
                                <button class="btn btn-mini btn-light" onclick="search();" title="检索">
                                    查询
                                </button>
                            </td>
                        </tr>
                    </table>
                </form>
                <!-- 检索  -->
                <table id="table_report" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="center">序号</th>
                        <th class="center">科目</th>
                        <th class="center">状态</th>
                        <th class="center">类型</th>
                        <th class="center">余额</th>
                        <th class="center">创建时间</th>
                        <th class="center">更新时间</th>
                        <th class="center">变动明细</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- 开始循环 -->
                    <c:choose>
                        <c:when test="${not empty sysAccounts}">
                          <c:forEach items="${sysAccounts}" var="account" varStatus="index">
                            <tr>
                                <td>${index.count}</td>
                                <td>${account.subject}</td>
                                <td>${account.status}</td>
                                <td>${account.accountType}</td>
                                <td>${account.balance}</td>
                                <td>${account.createTime}</td>
                                <td>${account.updateTime}</td>
                                <td><a class='btn btn-mini btn-primary' title="查看明细"
                                       href="toRecordDetail?accountID=${account.accountID}">
                                    <i class='icon-edit'>查看</i>
                                </a></td>
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

<!-- js -->
<script src="/static/js/jquery-2.1.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>
