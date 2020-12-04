<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../top.jsp" %>
<html>
<head>
    <title>收入结转</title>
    <%--<base href="<%=basePath%>">--%>
    <%--<!-- jsp文件头和头部 -->--%>
</head>
<body>
<div class="container-fluid" id="main-container">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>收入结转
                <small><i class="icon-double-angle-right"></i> 网关手续费收入结转</small>
            </h1>
        </div>
        <!--/page-header-->

        <div class="row-fluid">
            <!-- PAGE CONTENT BEGINS HERE -->
            <form class="form-horizontal" action="/finance/incomeSettle" method="post" onsubmit="return check();">

                <div class="control-group">
                    <label class="control-label" for="amount">结转至商户号:</label>

                    <div class="controls">
                        <input type="text" id="merNo" name="merNo" value="40140"/>
                    </div>
                </div>


                <div class="control-group">
                    <label class="control-label" for="amount">结转金额:</label>

                    <div class="controls">
                        <input type="text" id="amount" name="amount" placeholder="结转金额"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="amount">备注:</label>

                    <div class="controls">
                        <input type="text" id="remark" name="remark" placeholder="备注"/>
                    </div>
                </div>

                <div class="form-actions">
                    <button class="btn btn-info" type="submit"><i class="icon-ok"></i> 提交</button>
                </div>
            </form>
            <!--/row-->
        </div>
    </div>
    <!--/#page-content-->
</div>


<!-- js -->
<script src="/static/js/jquery-2.1.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function check() {
        var amount = $("#amount").val();
        var av=/^[0-9]*(\.[0-9]{1,2})?$/;
        if(amount =='' || !av.test(amount))
        {
            alert("请输入正确的金额格式");
            return false;
        }
        return true;
    }

</script>
</body>
</html>
