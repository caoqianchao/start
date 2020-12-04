<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
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
                <!-- 检索  -->
                <form method="post" id="form1" action="/finance/acl/editWithdrawAcl" onsubmit="return checkSubmit();">
                    <div id="zhongxin">
                        <table class="table table-striped table-bordered table-hover" id="table_report">
                            <td style="width:70px;text-align: right;padding-top: 13px;">商户号:</td>
                            <td>
                                <input id="merNo" type="text" name="merNo" value="${dto.merNo}" readonly="readonly">
                            </td>
                            <tr>
                                <td style="width:70px;text-align: right;padding-top: 13px;">结算至提现账户比率:</td>
                                <td>
                                    <input id="rate" type="text" name="rate" value="${dto.rate}">
                                </td>
                            </tr>
                            <tr>
                                <td style="width:70px;text-align: right;padding-top: 13px;">是否激活:</td>
                                <td>
                                    <select id="active" name="active">
                                        <c:if test="${dto.state == 'open'}">
                                            <option value="open">激活</option>
                                            <option value="close">关闭</option>
                                        </c:if>
                                        <c:if test="${dto.state == 'close'}">
                                            <option value="close">关闭</option>
                                            <option value="open">激活</option>
                                        </c:if>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="10" style="text-align: center;">
                                    <button type="submit" class="btn btn-mini btn-primary">保存</button>
                                    <button type="button" onclick="top.Dialog.close();" class="btn btn-mini btn-danger">
                                        取消
                                    </button>
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

<!-- 引入 -->
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
<script type="text/javascript" src="/js/ace.min.js"></script>

<script type="text/javascript" src="/static/js/common/fn_jquery.js"></script>
<script type="text/javascript" src="/static/js/jquery.json.js"></script>
<script type="text/javascript" src="/static/plugins/zoomimage/js/jquery.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/bootstrap-datetimepicker.min.js"></script>
<script src="/static/js/bootstrap-datetimepicker.zh-CN.js"></script>
<!--提示框-->
<script type="text/javascript">
    function checkSubmit() {
        var rate = $("#rate").val();
        if (rate == null || rate == '') {
            alert("比率不能为空");
            return false;
        }
        if (!checkFee(rate)) {
            alert("比率格式不正确");
            return false;
        }

        var merNo = $("#merNo").val();
        if (merNo == null || merNo == '') {
            alert("商户号不能为空");
            return false;
        }

        return true;
    }

    function checkFee(num) {
        var isNum = /^\d+(\.\d+)?$/;
        if(isNum.test(num)) {
            return true;
        } else {
            return false;
        }
    }

</script>

</body>
</html>
