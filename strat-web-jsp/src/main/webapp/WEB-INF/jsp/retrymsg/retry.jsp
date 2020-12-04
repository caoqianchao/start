<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重新请求发送消息</title>
    <%--<base href="<%=basePath%>">--%>
    <%--<!-- jsp文件头和头部 -->--%>
    <%@ include file="../top.jsp" %>
</head>
<body>
<div class="container-fluid" id="main-container">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>重新请求发送消息
                <small><i class="icon-double-angle-right"></i> 接口重新发送</small>
            </h1>
        </div>
        <!--/page-header-->

        <div class="row-fluid">
            <!-- PAGE CONTENT BEGINS HERE -->
            <form class="form-horizontal" action="https://cashiermg.yemadai.com/pay/compensate" method="post" >

                <div class="control-group">
                    <label class="control-label" for="merNo">商户号:</label>

                    <div class="controls">
                        <input type="text" id="merNo" name="merNo" placeholder="商户号"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="startTime">开始时间(yyyyMMddHHmmss):</label>

                    <div class="controls">
                        <input type="text" id="startTime" name="startTime" placeholder="开始时间"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="endTime">结束时间(yyyyMMddHHmmss):</label>

                    <div class="controls">
                        <input type="text" id="endTime" name="endTime" placeholder="结束时间"/>
                    </div>
                </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit"><i class="icon-ok"></i> 提交</button>
                </div>
            </form>
        </div>
        <!--/#page-content-->
    </div>
</div>

</body>
</html>
