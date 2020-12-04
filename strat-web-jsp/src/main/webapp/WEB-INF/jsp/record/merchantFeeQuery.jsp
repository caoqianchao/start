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
                <form action="merchantFeeQuery" method="post" name="Form" id="Form" onsubmit="return check();">
                    <table>
                        <tr>
                            <td>
                                <span class="input-icon">
                                    <input id="merNo" name="merNo" type="text" value="${merNo}" placeholder="请输入查询商户号"/>
                                </span>
                            </td>
                            <td>
                                <span class="input-icon">
                                    <select id="feeType" name="feeType">
                                        <c:if test="${not empty feeType}">
                                            <option value="${feeType}">${feeName}</option>
                                        </c:if>
                                        <option value="">---请选择手续费类型---</option>
                                        <option value="bussiness_applywithdrawfee">下发</option>
                                        <option value="bussiness_rechargefee">充值</option>
                                        <option value="bussiness_mersettlementfee">结算</option>
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
                                    手续费金额 : <span class="red">￥${feeAmount}</span>
                                </h4>
                            </div>
                        </div>
                    </table>
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
    function check() {

        var merNo = $("#merNo").val();
        if (merNo == '' || merNo == null) {
            alert("请输入商户号");
            return false;
        }

        var feeType = $("#feeType").val();
        if (feeType == '' || feeType == null) {
            alert("请输入手续费类型");
            return false;
        }

        var beginTime = $("#beginTime").val();
        if (beginTime == '' || beginTime == null) {
            alert("请输入开始时间");
            return false;
        }

        var endTime = $("#endTime").val();
        if (endTime == '' || endTime == null) {
            alert("请输入结束时间");
            return false;
        }


        return true;
    }
</script>

</body>
</html>
