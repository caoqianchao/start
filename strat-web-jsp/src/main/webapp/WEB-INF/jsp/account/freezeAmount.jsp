<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../top.jsp" %>
<html>
<head>
    <title>冻结账号金额</title>
    <%--<base href="<%=basePath%>">--%>
    <%--<!-- jsp文件头和头部 -->--%>
</head>
<body>
<div class="container-fluid" id="main-container">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>冻结
                <small><i class="icon-double-angle-right"></i> 从余额冻结至冻结金额</small>
            </h1>
        </div>
        <!--/page-header-->

        <div class="row-fluid">
            <!-- PAGE CONTENT BEGINS HERE -->
            <form class="form-horizontal" action="freezeMerchantAmount" method="post" onsubmit="return check();">

                <div class="control-group">
                    <label class="control-label">商户号:</label>

                    <div class="controls">
                        <input id="merNo" name="merNo" type="text" placeholder="输入商户号"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="orderNo">冻结的订单号:</label>

                    <div class="controls">
                        <input type="text" id="orderNo" name="orderNo" placeholder="输入订单号"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="orderNo">备注:</label>

                    <div class="controls">
                        <input type="text" id="remark" name="remark" placeholder="输入备注"/>
                    </div>
                </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit"><i class="icon-ok"></i> 提交</button>
                </div>
            </form>
            <!--/row-->

            <form class="form-horizontal" action="freezeAmountByAmount" method="post" onsubmit="return check2();" id="from">

                <div class="control-group">
                    <label class="control-label">商户号:</label>

                    <div class="controls">
                        <input id="merNo2" name="merNo" type="text" placeholder="输入商户号"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="amount">冻结金额:</label>

                    <div class="controls">
                        <input type="text" id="amount" name="amount" placeholder="输入金额"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="orderNo">备注:</label>

                    <div class="controls">
                        <input type="text" id="remark" name="remark" placeholder="输入备注"/>
                    </div>
                </div>
                <div class="form-actions">
                    <td><button class="btn btn-info" type="submit"><i class="icon-ok"></i> 提交</button></td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <td style="vertical-align: top;"><a
                            class="btn btn-mini btn-light" onclick="xlsxImportTask()"
                            title="导入EXCEL"> <i class="nav-search-icon  icon-cloud-upload"></i>
                    </a></td>
                </div>
            </form>
        </div>
    </div>
    <!--/#page-content-->
</div>


<!-- js -->
<script src="/static/js/jquery-2.1.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function check() {

        var merNo = $("#merNo").val();
        if (merNo == '' || merNo == null) {
            alert("请输入商户号");
            return false;
        }

        var orderNo = $("#orderNo").val();
        if (orderNo == '' || orderNo == null) {
            alert("请输入冻结的订单号");
            return false;
        }
        return true;
    }

    function check2() {

        var merNo = $("#merNo2").val();
        if (merNo == '' || merNo == null) {
            alert("请输入商户号");
            return false;
        }

        var orderNo = $("#amount").val();
        if (orderNo == '' || orderNo == null) {
            alert("请输入冻结金额");
            return false;
        }

        var exp = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
        if(!exp.test(orderNo)){
            alert("金额格式有误");
            return false;
        }
        return true;
    }

    //批量导入
    function xlsxImportTask() {
        var diag = new Dialog();
        diag.Drag = true;
        diag.Title = "批量冻结导入";
        diag.URL = '/finance/toExcelImportFreeze';
        diag.Width = 650;
        diag.Height = 600;
        diag.CancelEvent = function () {
//            $("#from").submit();
            diag.close();
        };
        diag.show();
    }
</script>
</body>
</html>
