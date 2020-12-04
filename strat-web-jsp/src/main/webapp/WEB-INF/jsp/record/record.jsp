<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!--IE 兼容模式-->
    <meta name="keywords" content="Furniture Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <title>余额变动明细</title>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all"  />
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap-datetimepicker.min.css"/>
    <link href="/static/css/bootstrap-responsive.min.css" type="text/css" media="all"  />
    <link href="/static/css/global.css" rel="stylesheet" type="text/css" media="all"  />
    <link rel="stylesheet" type="text/css" href="/static/css/jiesuanchaxun.css"/>
</head>

<body>
<div class="nav-content">
    <div class="nav_top">
        <div class="nav_wrapper">
            <ul class="pull-right pull-righta">
                <li><a href="#" class="nav_top_rt">你好，神棍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退出</a></li>
                <li><a href="#" class="nav_top_rt">我的一麻袋</a></li>
                <li><a href="#">客服服务</a></li>
            </ul>
        </div>
    </div>
</div>
<!--/nav-content-->

<div class="nav-bottom">
    <div class="nav-bottom-con">
        <div class="pull-left nav-bottom-left">
            <ul class="register-logo">
                <li><a href="#" class="register-logoa"><img src="/static/images/zhece_icon_03.png" /></a></li>
                <li><a href="#" class="register-xian"><img src="/static/images/zhece_icon_06.png" /></a></li>
                <li><a href="#">财务明细</a></li>
            </ul>
        </div>
    </div>
</div>
<!--/nav-bottom-->

<div class="container">
    <div class="chaxun-list" id="jiesuan-list">

        <div class="chaxun-input2">
            <form action="show" method="post" id="queryForm" class="form-horizontal" onsubmit="return check();">
                <input id="queryCycle" name="queryCycle" value="${queryCycle}" type="hidden" style="display: none"/>
                <input id="changeType" name="changeType" value="${changeType}" type="hidden" style="display: none"/>
                <div class="control-group">
                    <div class="chaxun-label">
                        <label>时间范围：</label>
                    </div>
                    <div class="controls">
                        <input type="text" id="beginTime" value="${beginTime}" name="beginTime" style="width:115px;"/>
                        <div class="chaxun-line"></div>
                        <input type="text" id="endTime" value="${endTime}" name="endTime" style="width:115px;"/>
                        <p>最近&nbsp;&nbsp;丨&nbsp;&nbsp;<a href="javascript:void(0);" id="tag1" onclick="checkCycle(1)">今天</a>
                            &nbsp;&nbsp; <a href="javascript:void(0);" id="tag2" onclick="checkCycle(2)" >1月</a>
                            &nbsp;&nbsp;<a href="javascript:void(0);" id="tag3" onclick="checkCycle(3)">1年</a></p>
                    </div>
                </div>

                <div class="control-group">
                    <div class="chaxun-label">
                        <label class="control-label">类型：</label>
                    </div>
                    <div class="controls">
                        <a href="#" style="background-color:#d9f2fc">所有</a>
                        <a href="${tradeDetailURL}">交易</a>
                        <a href="${rechargeDetailURL}">充值</a>
                        <a href="${withdrawDetailURL}">提现</a>
                        <a href="${transferDetailURL}">转账</a>
                        <a href="${transferBKDetailURL}">转账到银行卡</a>
                    </div>
                </div>

                <div class="control-group">
                    <div class="chaxun-label">
                        <label class="control-label" >资金流向：</label>
                    </div>
                    <div class="controls">
                        <a href="javascript:void(0);" id="change" onclick="changeType('')">所有</a>
                        <a href="javascript:void(0);" id="change1" onclick="changeType('in')">收入</a>
                        <a href="javascript:void(0);" id="change2" onclick="changeType('out')">支出</a>
                    </div>
                </div>

                <div class="control-group clearfix">
                    <div class="chaxun-label">
                        <label>金额范围：</label>
                    </div>
                    <div class="controls">
                        <input type="text" id="beginLimit" name="beginLimit" value="${beginLimit}"/>
                        <div class="chaxun-line"></div>
                        <input type="text" id="endLimit" name="endLimit" value="${endLimit}"/>
                    </div>
                </div>

                <div class="control-group" id="control-group2">
                    <div class="controls">
                        <button type="submit" class="btn">搜索</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="jiesuan-list">

            <div class="jiesuan-list-top">
                <div id="amountStatic" class="list-top-left" style="display: none">
                    <ul>
                        <li>收入（<font color="00aaee">11</font>）：<font color="00aaee">2472.00</font>元</li>
                        <li>支出（<font color="ff0000">0</font>）：<font color="ff0000">0.00</font> 元</li>
                    </ul>
                </div>
                <div class="list-top-right">
                    <p><a href="#">日账单下载</a>|<a href="#">月账单下载</a>&nbsp;&nbsp;下载账单：<a href="#">Excel格式</a>丨<a href="#">Txt格式</a>&nbsp;&nbsp;单位：元</p>
                </div>
            </div>

            <div class="list-content">
                <table width="990" border="0" class="list-content-table">
                    <tr>
                        <th scope="col">时间</th>
                        <th scope="col">名称</th>
                        <th scope="col">流水号</th>
                        <th scope="col">收入</th>
                        <th scope="col">支出</th>
                        <th scope="col">账户余额</th>
                        <th scope="col">详情</th>
                    </tr>
                    <c:forEach items="${records}" var="record">
                        <tr>
                            <td>${record.date}&nbsp;<span>${record.time}</span></td>
                            <td>${record.buinessName}</td>
                            <td class="dingdan-num">交易号：${record.systemNo}</td>
                            <c:if test="${record.add}">
                                <td class="money">+${record.operateAmount}</td>
                                <td class="money"></td>
                            </c:if>
                            <c:if test="${!record.add}">
                                <td class="money"></td>
                                <td class="money">-${record.operateAmount}</td>
                            </c:if>
                            <td class="money">${record.afterBalance}</td>

                            <c:if test="${record.detailURL != null}">
                                <td><a href="${record.detailURL}">查看</a></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="footer clearfix">
    <p><a href="#">网上支付</a><span>|</span><a href="#">隐私安全</a><span>|</span><a href="#">联系我们</a></p>
    <p class="banquan">一麻袋版权所有<span>2009-2013</span><span>沪ICP备12026755号</span></p>
</div>
<!--/footer-->
<script src="/static/js/jquery-2.1.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/bootstrap-datetimepicker.min.js"></script>
<script src="/static/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
    $(function () {

        var query = $("#queryCycle").val();
        if (query != null && query != "") {
            $("#tag" + query).css({"background-color": "#d9f2fc"});
        }

        var type = $("#changeType").val();
        if (type != null && type != "") {
            if ("in" == type) {
                $("#change1").css({"background-color": "#d9f2fc"});
            } else if ("out" == type) {
                $("#change2").css({"background-color": "#d9f2fc"});
            } else {
                $("#change").css({"background-color": "#d9f2fc"});
            }
        } else {
            $("#change").css({"background-color": "#d9f2fc"});
        }
    });
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
    function checkCycle(val) {
        $("#queryCycle").val(val);
        $("#queryForm").submit();
    }
    function changeType(val) {
        $("#changeType").val(val);
        if ("in" == val) {
            $("#change1").css({"background-color": "#d9f2fc"});
            $("#change2").css({"background-color": "inherit"});
            $("#change").css({"background-color": "inherit"});
        } else if ("out" == val) {
            $("#change2").css({"background-color": "#d9f2fc"});
            $("#change").css({"background-color": "inherit"});
            $("#change1").css({"background-color": "inherit"});
        } else {
            $("#change").css({"background-color": "#d9f2fc"});
            $("#change1").css({"background-color": "inherit"});
            $("#change2").css({"background-color": "inherit"});
        }
    }
    function checkAmount() {
        var amount1 = $("#beginLimit").val();
        var amount2 = $("#endLimit").val();
        var av=/^[0-9]*(\.[0-9]{1,2})?$/;
        if(amount1 !="" && !av.test(amount1))
        {
            alert("请输入正确的起始金额格式");
            return false;
        }
        if(amount2 =="" && !av.test(amount2))
        {
            alert("请输入正确的金额金额格式");
            return false;
        }

        if (amount1 != null && amount1 != "") {
            if (amount2 != null && amount2 != "") {
                if (amount1 > amount2) {
                    alert("起始金额不能大于结束金额");
                    return false;
                }
            }
        }

        return true;
    }
    function check() {
        var amountOK = checkAmount();
        if (!amountOK)
                return false;

        var cycle = $("#queryCycle").val();
        if (cycle != null && cycle != "") {
            $("#beginTime").val("");
            $("#endTime").val("");
        } else {
            var begin = $("#beginTime").val();
            var end = $("#endTime").val();
            if (begin != null && begin != "") {
                if (end != null && end != "") {
                    if (begin > end) {
                        alert("开始日期不能大于结束日期");
                        return false;
                    }
                }
            }
            if (begin == null || begin == "") {
                if (end == null || end == "") {}
                alert("请选择日期");
                return false;
            }
        }

        return true;
    }
</script>
</body>
</html>
