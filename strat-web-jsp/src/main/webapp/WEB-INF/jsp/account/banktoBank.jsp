<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../top.jsp" %>
<html>
<head>
    <title>头寸调拨</title>
    <%--<base href="<%=basePath%>">--%>
    <%--<!-- jsp文件头和头部 -->--%>
</head>
<body>
<div class="container-fluid" id="main-container">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>头寸调拨操作
                <small><i class="icon-double-angle-right"></i> 银行备付金之间跨转</small>
            </h1>
        </div>
        <!--/page-header-->

        <div class="row-fluid">
            <!-- PAGE CONTENT BEGINS HERE -->
            <form class="form-horizontal" action="bankToBank" method="post" onsubmit="return check();">

                <div class="control-group">
                    <label class="control-label" for="inBankName">入金银行:&nbsp;&nbsp;&nbsp;&nbsp;</label>

                    <select id="inBankName" name="inBankName">
                        <option value=""></option>
                        <c:forEach items="${bankInfo}" var="info">
                            <option value='${info.bankCode}'>${info.bankName}</option>
                        </c:forEach>

                    </select>
                </div>

                <div class="control-group">
                    <label class="control-label" for="outBankName">出金金银行:&nbsp;&nbsp;&nbsp;&nbsp;</label>

                    <select id="outBankName" name="outBankName">
                        <option value=""></option>
                        <c:forEach items="${bankInfo}" var="info">
                            <option value='${info.bankCode}'>${info.bankName}</option>
                        </c:forEach>

                    </select>
                </div>
                <div class="control-group">
                    <label class="control-label" for="operAmount">转账金额:</label>

                    <div class="controls">
                        <input type="text" id="operAmount" name="operAmount" placeholder="转账金额"/>
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

        var inbankName = $("#inBankName").val();
        if (inbankName == '' || inbankName == null) {
            alert("请选择入金备付金银行");
            return false;
        }

        var outbankName = $("#outBankName").val();
        if (outbankName == '' || outbankName == null) {
            alert("请选择出金备付金银行");
            return false;
        }

        var amount = $("#operAmount").val();
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
