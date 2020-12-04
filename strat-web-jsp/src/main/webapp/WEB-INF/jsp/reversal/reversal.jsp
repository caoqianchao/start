<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../top.jsp" %>
<html>
<head>
    <title>业务冲正</title>
    <%--<base href="<%=basePath%>">--%>
    <%--<!-- jsp文件头和头部 -->--%>
</head>
<body>
<div class="container-fluid" id="main-container">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>业务冲正
                <small><i class="icon-double-angle-right"></i> 将异常成功业务的账户变动回退</small>
            </h1>
        </div>
        <!--/page-header-->

        <div class="row-fluid">
            <!-- PAGE CONTENT BEGINS HERE -->
            <form class="form-horizontal" action="doReveral" method="post" onsubmit="return check();">

                <div class="control-group">
                    <label class="control-label" for="busTypeName">业务类型:&nbsp;&nbsp;&nbsp;&nbsp;</label>

                    <select id="busTypeName" name="busTypeName">
                        <option value="">----请选择业务类型----</option>
                        <option value="BankSettlement">银行结算业务操作</option>
                        <option value="CompanyCost">公司支出业务操作</option>
                        <option value="GatewayOperation">网关业务操作</option>
                        <option value="MerchantRefund">商户退款业务操作</option>
                        <option value="Recharge">充值业务操作</option>
                        <option value="Transfer">转账业务操作</option>
                        <option value="Withdraw">出金业务操作</option>
                    </select>
                </div>

                <div class="control-group">
                    <label class="control-label" for="busSystemNo">业务系统流水:</label>

                    <div class="controls">
                        <input type="text" id="busSystemNo" name="busSystemNo" placeholder="冲正业务流水"/>
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

        var busTypeName = $("#busTypeName").val();
        if (busTypeName == '' || busTypeName == null) {
            alert("请选择冲正的业务类型");
            return false;
        }

        var busSystemNo = $("#busSystemNo").val();
        if (busSystemNo == '' || busSystemNo == null) {
            alert("请输入要冲正的业务系统流水");
            return false;
        }
        if (window.confirm('请确认该笔业务没有做过后续的操作,请不要随意回退业务!')) {
            return true;
        }
        return false;
    }

</script>
</body>
</html>
