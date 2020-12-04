<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>备付金明细</title>
    <meta name="description" content="Large & Small"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap-datetimepicker.min.css"/>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/static/css/bootstrap-responsive.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/css/font-awesome.min.css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="/static/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <!-- page specific plugin styles -->

    <!-- ace styles -->
    <link rel="stylesheet" href="/static/css/ace.min.css"/>
    <link rel="stylesheet" href="/static/css/ace-responsive.min.css"/>
    <link rel="stylesheet" href="/static/css/ace-skins.min.css"/>
    <!--[if lt IE 9]>
    <link rel="stylesheet" href="/static/css/ace-ie.min.css"/>

    <![endif]-->
</head>
<body>
<div class="container-fluid" id="main-container">
    <a href="#" id="menu-toggler"><span></span></a><!-- menu toggler -->
    <div id="main-content" class="clearfix" style="margin-left: 0px;">

        <div id="page-content" class="clearfix">

            <div class="row-fluid">
                <!-- PAGE CONTENT BEGINS HERE -->
                <div class="space-24"></div>


                <h3 class="header smaller red">备付金</h3>

                <!-- 检索  -->
                <form id="from1" action="bankBalanceDetail" method="post">
                    <table>
                        <tr>
                            <td>
                                <input class="span10 date-picker" name="beginTime" id="beginTime" value="${beginTime}"
                                       type="text"
                                       style="width:130px;" placeholder="查询日期"/>
                            </td>
                            <td style="vertical-align:top;">
                                <button class="btn btn-mini btn-light" title="检索">
                                    查询
                                </button>
                            </td>
                        </tr>
                    </table>
                </form>

                <div class="row-fluid">
                    <div class="span3">
                        <div class="widget-box transparent">
                            <div class="widget-header">
                                <h5 class="bigger lighter">银行名称</h5>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding">
                                    <ul class="unstyled list-striped pricing-table-header">
                                        <c:forEach items="${bankNames}" var="info">
                                            <li>${info} </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="span2 pricing-span">
                        <div class="widget-box pricing-box-small">
                            <div class="widget-header header-color-red3">
                                <h5 class="bigger lighter">余额</h5>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding">
                                    <ul class="unstyled list-striped pricing-table">
                                        <c:forEach items="${bankBalances}" var="info">
                                            <li><fmt:formatNumber value="${info}" type="currency"
                                                                  pattern="¥#,##0.0#"
                                                                  minFractionDigits="2"/></li>
                                        </c:forEach>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="span2 pricing-span">
                        <div class="widget-box pricing-box-small">
                            <div class="widget-header header-color-orange">
                                <h5 class="bigger lighter">应收款（未结算）</h5>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding">
                                    <ul class="unstyled list-striped pricing-table">
                                        <c:forEach items="${bankUnSettles}" var="info">
                                            <li><fmt:formatNumber value="${info}" type="currency"
                                                                  pattern="¥#,##0.0#"
                                                                  minFractionDigits="2"/></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="span2 pricing-span">
                        <div class="widget-box pricing-box-small">
                            <div class="widget-header header-color-blue">
                                <h5 class="bigger lighter">应付款（出金）</h5>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding">
                                    <ul class="unstyled  list-striped pricing-table">
                                        <c:forEach items="${shouldPayBanks}" var="info">
                                            <li><fmt:formatNumber value="${info}" type="currency"
                                                                  pattern="¥#,##0.0#"
                                                                  minFractionDigits="2"/></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="span2 pricing-span">
                        <div class="widget-box pricing-box-small">
                            <div class="widget-header header-color-green">
                                <h5 class="bigger lighter">成本(银行手续费)</h5>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding">
                                    <ul class="unstyled list-striped  pricing-table">
                                        <c:forEach items="${bankFees}" var="info">
                                            <li><fmt:formatNumber value="${info}" type="currency"
                                                                  pattern="¥#,##0.0#"
                                                                  minFractionDigits="2"/></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="span2 pricing-span">
                        <div class="widget-box pricing-box-small">
                            <div class="widget-header header-color-grey">
                                <h5 class="bigger lighter">利息收入</h5>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding">
                                    <ul class="unstyled list-striped  pricing-table">
                                        <c:forEach items="${bankInterests}" var="info">
                                            <li><fmt:formatNumber value="${info}" type="currency"
                                                                  pattern="¥#,##0.0#"
                                                                  minFractionDigits="2"/></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="span2 pricing-span">
                        <div class="widget-box pricing-box-small">
                            <div class="widget-header header-color-grey">
                                <h5 class="bigger lighter">实际余额</h5>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding">
                                    <ul class="unstyled list-striped  pricing-table">
                                        <c:forEach items="${realBalances}" var="info">
                                            <li><fmt:formatNumber value="${info}" type="currency"
                                                                  pattern="¥#,##0.0#"
                                                                  minFractionDigits="2"/></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- PAGE CONTENT ENDS HERE -->
            </div><!--/row-->


            <!-- 余额 -->
            <div class="row-fluid">
                <div class="span3">
                    <div class="widget-box transparent">
                        <div class="widget-header">
                            <h5 class="bigger lighter">业务系统余额</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped pricing-table-header">
                                    <li>余额</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="span2 pricing-span">
                    <div class="widget-box pricing-box-small">
                        <div class="widget-header header-color-red3">
                            <h5 class="bigger lighter">商户余额</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped pricing-table">
                                    <li><fmt:formatNumber value="${merBalance}" type="currency"
                                                          pattern="¥#,##0.0#"
                                                          minFractionDigits="2"/></li>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="span2 pricing-span">
                    <div class="widget-box pricing-box-small">
                        <div class="widget-header header-color-orange">
                            <h5 class="bigger lighter">商户（未结算）</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped pricing-table">
                                    <li><fmt:formatNumber value="${unSettle}" type="currency"
                                                          pattern="¥#,##0.0#"
                                                          minFractionDigits="2"/></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="span2 pricing-span">
                    <div class="widget-box pricing-box-small">
                        <div class="widget-header header-color-blue">
                            <h5 class="bigger lighter">冻结余额</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled  list-striped pricing-table">
                                    <li><fmt:formatNumber value="${freezeBalance}" type="currency"
                                                          pattern="¥#,##0.0#"
                                                          minFractionDigits="2"/></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="span2 pricing-span">
                    <div class="widget-box pricing-box-small">
                        <div class="widget-header header-color-green">
                            <h5 class="bigger lighter">普通用户余额</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped  pricing-table">
                                    <li><fmt:formatNumber value="${userBalance}" type="currency"
                                                          pattern="¥#,##0.0#"
                                                          minFractionDigits="2"/></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="span2 pricing-span">
                    <div class="widget-box pricing-box-small">
                        <div class="widget-header header-color-green">
                            <h5 class="bigger lighter">延时分账余额</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped  pricing-table">
                                    <li><fmt:formatNumber value="${shareProfitFree}" type="currency"
                                                          pattern="¥#,##0.0#"
                                                          minFractionDigits="2"/></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="span2 pricing-span">
                    <div class="widget-box pricing-box-small">
                        <div class="widget-header header-color-grey">
                            <h5 class="bigger lighter">合计</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped  pricing-table">
                                    <li><fmt:formatNumber value="${totalBalance}" type="currency"
                                                          pattern="¥#,##0.0#"
                                                          minFractionDigits="2"/></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 未结算余额 -->
            <div class="row-fluid">
                <div class="span3">
                    <div class="widget-box transparent">
                        <div class="widget-header">
                            <h5 class="bigger lighter">结算系统余额</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped pricing-table-header">
                                    <li>余额</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="span2 pricing-span">
                    <div class="widget-box pricing-box-small">
                        <div class="widget-header header-color-red3">
                            <h5 class="bigger lighter">未结算余额</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped pricing-table">
                                    <li><fmt:formatNumber value="${unSettleAmount}" type="currency"
                                                          pattern="¥#,##0.0#"
                                                          minFractionDigits="2"/></li>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="span2 pricing-span">
                    <div class="widget-box pricing-box-small">
                        <div class="widget-header header-color-orange">
                            <h5 class="bigger lighter">未结算手续费</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped pricing-table">
                                    <li><fmt:formatNumber value="${unSettleFee}" type="currency"
                                                          pattern="¥#,##0.0#"
                                                          minFractionDigits="2"/></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 当日出入金 -->
            <div class="row-fluid">
                <div class="span3">
                    <div class="widget-box transparent">
                        <div class="widget-header">
                            <h5 class="bigger lighter">当日系统出入金</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped pricing-table-header">
                                    <li>金额</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="span2 pricing-span">
                    <div class="widget-box pricing-box-small">
                        <div class="widget-header header-color-red3">
                            <h5 class="bigger lighter">交易金额（入）</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped pricing-table">
                                    <li><fmt:formatNumber value="${tradeAmount}" type="currency"
                                                          pattern="¥#,##0.0#"
                                                          minFractionDigits="2"/></li>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="span2 pricing-span">
                    <div class="widget-box pricing-box-small">
                        <div class="widget-header header-color-orange">
                            <h5 class="bigger lighter">充值退回（出）</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped pricing-table">
                                    <li><fmt:formatNumber value="${rechargeAmount}" type="currency"
                                                          pattern="¥#,##0.0#"
                                                          minFractionDigits="2"/></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="span2 pricing-span">
                    <div class="widget-box pricing-box-small">
                        <div class="widget-header header-color-blue">
                            <h5 class="bigger lighter">提现下发（出）</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled  list-striped pricing-table">
                                    <li><fmt:formatNumber value="${withdrawAmount}" type="currency"
                                                          pattern="¥#,##0.0#"
                                                          minFractionDigits="2"/></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="span2 pricing-span">
                    <div class="widget-box pricing-box-small">
                        <div class="widget-header header-color-green">
                            <h5 class="bigger lighter">手续费（出）</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped  pricing-table">
                                    <li><fmt:formatNumber value="${feeAmount}" type="currency"
                                                          pattern="¥#,##0.0#"
                                                          minFractionDigits="2"/></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="span2 pricing-span">
                    <div class="widget-box pricing-box-small">
                        <div class="widget-header header-color-green">
                            <h5 class="bigger lighter">退款（出）</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped  pricing-table">
                                    <li><fmt:formatNumber value="${refundAmount}" type="currency"
                                                          pattern="¥#,##0.0#"
                                                          minFractionDigits="2"/></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="span2 pricing-span">
                    <div class="widget-box pricing-box-small">
                        <div class="widget-header header-color-grey">
                            <h5 class="bigger lighter">差额</h5>
                        </div>
                        <div class="widget-body">
                            <div class="widget-main no-padding">
                                <ul class="unstyled list-striped  pricing-table">
                                    <li><fmt:formatNumber value="${difBalance}" type="currency"
                                                          pattern="¥#,##0.0#"
                                                          minFractionDigits="2"/></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- PAGE CONTENT ENDS HERE -->
        </div><!--/row-->

    </div><!--/#page-content-->

    <div id="ace-settings-container">
        <div id="ace-settings-box">
            <div>
                <div class="pull-left">
                    <select id="skin-colorpicker" class="hidden">
                        <option data-class="default" value="#438EB9">#438EB9</option>
                        <option data-class="skin-1" value="#222A2D">#222A2D</option>
                        <option data-class="skin-2" value="#C6487E">#C6487E</option>
                        <option data-class="skin-3" value="#D0D0D0">#D0D0D0</option>
                    </select>
                </div>
                <span>&nbsp; Choose Skin</span>
            </div>
            <div><input type="checkbox" class="ace-checkbox-2" id="ace-settings-header"/><label class="lbl"
                                                                                                for="ace-settings-header">
                Fixed Header</label></div>
            <div><input type="checkbox" class="ace-checkbox-2" id="ace-settings-sidebar"/><label class="lbl"
                                                                                                 for="ace-settings-sidebar">
                Fixed Sidebar</label></div>
        </div>
    </div><!--/#ace-settings-container-->
</div><!-- #main-content -->
</div><!--/.fluid-container#main-container-->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
    <i class="icon-double-angle-up icon-only"></i>
</a>
<!-- basic scripts -->
<script type="text/javascript" src="/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap-datetimepicker.zh-CN.js"></script>
<!--提示框-->
<script type="text/javascript">
    $("#beginTime").datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 3,
        forceParse: 0,
        showMeridian: 1,
        format: 'yyyy-mm-dd'
    });
</script>
</body>
</html>
