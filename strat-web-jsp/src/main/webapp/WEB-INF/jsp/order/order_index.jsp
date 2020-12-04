<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
    <script src="/static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <!-- jsp文件头和头部 -->
    <%@ include file="../top.jsp" %>
    <style type="text/css">
        #opr td {
            border: 0
        }
    </style>
    <!-- jsp文件头和头部 -->
    <!-- basic styles -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/static/css/bootstrap-responsive.min.css" rel="stylesheet"/>

    <link rel="stylesheet" href="/static/css/font-awesome.min.css"/>

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="/static/css/chosen.css"/>
    <link rel="stylesheet" href="/static/css/daterangepicker.css"/>
    <link href="/static/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css"/>

    <!-- ace styles -->
    <link rel="stylesheet" href="/static/css/ace.min.css"/>
    <link rel="stylesheet" href="/static/css/ace-responsive.min.css"/>
    <link rel="stylesheet" href="/static/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="/static/css/search.css"/>
    <!--endif-->
</head>
<body style="min-width: 100px;text-align: center">


<%--分页查询--%>
<div class="container-fluid" id="main-container">
    <div id="page-content" class="clearfix">
        <div class="row-fluid">
            <div class="row-fluid">
                <!-- 检索  -->
                <form action="/order/index" method="post" id="Form">
                    <table>
                        <tr>
                            <td>
                                <span class="input-icon">
                                    <input autocomplete="off" type="text" name="merchantOrderNo"
                                           value="${pd.query.merchantOrderNo}" placeholder="商户订单号"/>
                                    <i id="nav-search-icon" class="icon-search"></i>
                                </span>
                            </td>

                            <td>
                                <span class="input-icon">
                                    <input autocomplete="off" type="text" name="merchantNo"
                                           value="${pd.query.merchantNo}" placeholder="商户号"/>
                                    <i class="icon-search"></i>
                                </span>
                            </td>

                            <td>
                                <select name="orderStateCode" id="orderStateCode" data-placeholder="请选择" class="chosen-select"
                                        style="vertical-align:top;width: 120px;">
                                    <option value="">-全部-</option>
                                    <c:forEach items="${OrderState.values()}" var="orderState" varStatus="vs">
                                        <option value="${orderState.code}"
                                                <c:if test="${orderState==pd.query.orderState}">selected</c:if>>${orderState.text}</option>
                                    </c:forEach>
                                </select>
                            </td>

                            <td>
                                <select name="payTypCode" id="payTypeCode" data-placeholder="请选择" class="chosen-select"
                                        style="vertical-align:top;width: 120px;">
                                    <option value="">-全部-</option>
                                    <c:forEach items="${PayType.values()}" var="payType" varStatus="vs">
                                        <option value="${payType.code}"
                                                <c:if test="${payType==pd.query.payType}">selected</c:if>>${payType.text}</option>
                                    </c:forEach>
                                </select>
                            </td>



                            <td>
                                <div class="nav-search-input input-append date" id="date-begin"
                                     style="width: auto !important;">
                                    <input class="date-picker" name="queryTimeBegin" type="text" readonly="readonly"
                                           value="<fmt:formatDate value="${pd.query.queryTimeBegin}" pattern="yyyy-MM-dd"/>"
                                           style="width:75px;" placeholder="开始日期"/>
                                    <span class="add-on" style="margin-left: -4px"><i class="icon-remove"></i></span>
                                    <span class="add-on" style="margin-left: -5px"><i class="icon-calendar"></i></span>
                                </div>
                            </td>

                            <td>
                                <div class="nav-search-input input-append date" id="date-end"
                                     style="width: auto !important;">
                                    <input class="date-picker" name="queryTimeEnd" type="text"
                                           value="<fmt:formatDate value="${pd.query.queryTimeEnd}" pattern="yyyy-MM-dd"/>"
                                           readonly="readonly" style="width:75px;" placeholder="结束日期"/>
                                    <span class="add-on" style="margin-left: -4px"><i class="icon-remove"></i></span>
                                    <span class="add-on" style="margin-left: -5px"><i class="icon-calendar"></i></span>
                                </div>
                            </td>

                            <td style="vertical-align: top;">
                                <a class='btn btn-mini btn-primary' title="查询"
                                   target="_blank" onclick="checkSearch()">查询</a>
                            </td>

                        </tr>
                    </table>


                    <table id="table_report" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">序号</th>
                            <th class="center">商户订单号</th>
                            <th class="center">主商户号</th>
                            <th class="center">主商户名</th>
                            <th class="center">子商户号</th>
                            <th class="center">子商户名</th>
                            <th class="center">流水号</th>
                            <th class="center">支付类型</th>
                            <th class="center">交易时间</th>
                            <th class="center">订单状态</th>
                            <th class="center">订单号</th>
                            <th class="center">订单金额</th>
                            <th class="center">商品</th>
                            <th class="center">备注</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- 开始循环 -->
                        <c:choose>
                            <c:when test="${not empty pd.pager}">
                                <c:forEach items="${pd.pager.list}" var="order" varStatus="vs">
                                    <tr>
                                        <td class='center' style="width: 30px;">${vs.index+1}</td>
                                        <td class='center'>${order.merchantOrderNo}</td>
                                        <td class='center'>${order.merchantNo}</td>
                                        <td class='center'>${order.merchantName}</td>
                                        <td class='center'>${order.subMerchantNo}</td>
                                        <td class='center'>${order.subMerchantName}</td>
                                        <td class='center'>${order.systemNo}</td>
                                        <td class='center'>${order.payType.text}</td>
                                        <td class='center'>${order.tradeTime}</td>
                                        <td class='center'>${order.orderState.text}</td>
                                        <td class='center'>${order.orderNo}</td>
                                        <td class='center'>${order.amount}</td>
                                        <td class='center'>${order.products}</td>
                                        <td class='center'>${order.remark}</td>
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
                    <td style="vertical-align:top;">
                        <div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">
                            ${pd.pager.pageStr}
                        </div>
                    </td>

                </form>
            </div>
            <!-- PAGE CONTENT ENDS HERE -->
        </div>
        <!--/row-->
    </div>
    <!--/#page-content-->
</div>
<!--/.fluid-container#main-container-->
<!-- 返回顶部  -->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
        class="icon-double-angle-up icon-only"></i>
</a>

</body>
<script src="/static/js/bootstrap.min.js"></script>
<!-- page specific plugin scripts -->
<script type="text/javascript" src="/static/js/fuelux.wizard.js"></script>
<script type="text/javascript" src="/static/js/date.js"></script>
<script type="text/javascript" src="/static/js/tools.js"></script>
<script type="text/javascript" src="/static/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/static/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="utf-8"></script>

<script type="text/javascript" src="/static/js/plugins/attention/zDialog/zDrag.js"></script>
<script type="text/javascript" src="/static/js/plugins/attention/zDialog/zDialog.js"></script>

<!-- ace scripts -->
<script type="text/javascript" src="/static/js/ace-elements.min.js"></script>
<script type="text/javascript" src="/static/js/ace.min.js"></script>

<script type="text/javascript" src="/static/js/common/fn_jquery.js"></script>
<script type="text/javascript" src="/static/js/bootbox.min.js"></script>
<script type="text/javascript" src="/static/js/jquery.json.js"></script>
<script type="text/javascript" src="/static/js/jquery.tips.js"></script>
<script type="text/javascript">
    function checkSearch() {
        $("#Form").submit();
    }
</script>
</html>
