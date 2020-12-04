<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重叠金额冲正</title>
    <%--<base href="<%=basePath%>">--%>
    <%--<!-- jsp文件头和头部 -->--%>
    <%@ include file="../top.jsp" %>
</head>
<body>
<div class="container-fluid" id="main-container">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>减少重叠金额操作
                <small><i class="icon-double-angle-right"></i> 银行备付金与商户余额减少</small>
            </h1>
        </div>
        <!--/page-header-->

        <div class="row-fluid">
            <!-- PAGE CONTENT BEGINS HERE -->
            <form class="form-horizontal" action="merBankBalanceAlign" method="post" onsubmit="return check();">

                <div class="control-group">
                    <label class="control-label" for="bankName">&nbsp;&nbsp;&nbsp;&nbsp;银行名称:&nbsp;&nbsp;&nbsp;&nbsp;</label>

                    <select id="bankName" name="bankName">
                        <option value=""></option>
                        <c:forEach items="${bankInfo}" var="info">
                            <option value='${info.bankCode}'>${info.bankName}</option>
                        </c:forEach>

                    </select>
                </div>
                <div class="control-group">
                    <label class="control-label" for="merNo">商户号:</label>

                    <div class="controls">
                        <input type="text" id="merNo" name="merNo" placeholder="商户号"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="subAmount">减少金额:</label>

                    <div class="controls">
                        <input type="text" id="subAmount" name="subAmount" placeholder="减少金额"/>
                    </div>
                </div>
                <!-- 暂时只有出金 -->
             <%--   <div class="control-group">
                    <label class="control-label">余额变动类型:&nbsp;&nbsp;&nbsp;&nbsp;</label>

                    <div class="controls">
                        <label>
                            <input name="inAccount" type="radio" value="inAccount"/><span class="lbl"> 入金</span>
                        </label>

                        <label>
                            <input name="inAccount" type="radio" value="outAccount"/><span class="lbl"> 出金</span>
                        </label>

                    </div>
                </div>--%>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit"><i class="icon-ok"></i> 提交</button>
                </div>
            </form>
            <!--/row-->
         <%--   <table id="table_report" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    &lt;%&ndash;   <th class="center">
                           <label><input type="checkbox" id="zcheckbox"/><span class="lbl"></span></label>
                       </th>&ndash;%&gt;
                    <th class="center">序号</th>
                    <th scope="col">时间</th>
                    <th scope="col">名称</th>
                    <th scope="col">流水号</th>
                    <th scope="col">收入</th>
                    <th scope="col">支出</th>
                    <th scope="col">账户余额</th>
                </tr>
                </thead>
                <tbody>
                <!-- 开始循环 -->
                <c:choose>
                    <c:when test="${not empty page.list}">
                        <c:forEach items="${page.list}" var="record" varStatus="vs">
                            <tr>
                                    &lt;%&ndash;<td class='center' style="width: 30px;">
                                        <label>
                                            <input type='checkbox' name='ids' value="" id="" alt=""/>
                                            <span class="lbl"></span>
                                        </label>
                                    </td>&ndash;%&gt;
                                <td class='center' style="width: 30px;">${vs.index+1}</td>
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
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr class="main_info">
                            <td colspan="100" class="center">没有相关数据</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>--%>
            </table>
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

        var bankName = $("#bankName").val();
        if (bankName == '' || bankName == null) {
            alert("请选择备付金银行");
            return false;
        }

        var amount = $("#subAmount").val();
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
