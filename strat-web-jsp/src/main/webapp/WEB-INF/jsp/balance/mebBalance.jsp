<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>麻袋账户余额</title>
    <%--<base href="<%=basePath%>">--%>
    <%--<!-- jsp文件头和头部 -->--%>
    <%@ include file="../top.jsp" %>
</head>
<body>
<div class="container-fluid" id="main-container">
    <div id="page-content" class="clearfix">
        <div class="row-fluid">
            <div class="row-fluid">
                <!-- 检索  -->
                <form id="from1" action="mebBalance" method="post" onsubmit="return check();">
                    <table>
                        <tr>
                            <td>
                                <span class="input-icon">
                                    <input id="merNo" name="merNo" type="text" value="${merNo}" placeholder="请输入查询商户号"/>
                                </span>
                            </td>
                            <td style="vertical-align:top;">
                                <button class="btn btn-mini btn-light" onclick="search();" title="检索">
                                    查询
                                </button>
                            </td>
                        </tr>
                    </table>
                </form>
                <!-- 检索  -->
                <table id="table_report" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="center">商户号</th>
                        <th class="center">状态</th>
                        <th class="center">类型</th>
                        <th class="center">余额</th>
                        <th class="center">冻结余额</th>
                        <th class="center">创建时间</th>
                        <th class="center">更新时间</th>
                        <th class="center">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- 开始循环 -->

                            <tr>
                                <td>11</td>
                                <td>11</td>
                                <td>11</td>
                                <td>11</td>
                                <td>11</td>
                                <td> balance.createTime</td>
                                <td>balance.updateTime</td>
                                <td style="width: 60px;" class="center">
                                    <div class='hidden-phone visible-desktop btn-group'>

                                            <a class='btn btn-mini btn-primary' title="操作"
                                               href="#"  >
                                                <i class='icon-edit'>禁用</i>
                                            </a>/


                                            <a class='btn btn-mini btn-primary' title="操作"
                                               href="#" >
                                                <i class='icon-edit'>启用</i>
                                            </a>/

                                    </div>
                                    <div class='hidden-phone visible-desktop btn-group'>
                                        <a class='btn btn-mini btn-primary' title="查看明细">
                                            <i class='icon-edit'>明细</i>
                                        </a>
                                    </div>
                                </td>
                            </tr>

                    </tbody>
                </table>
            </div>
            <!-- PAGE CONTENT ENDS HERE -->
        </div>
        <!--/row-->
    </div>
    <!--/#page-content-->
</div>
<!--/.fluid-container#main-container-->

<!-- js -->
<script type="text/javascript">
    function check() {

        var merNo = $("#merNo").val();
        if (merNo == '' || merNo == null) {
            alert("商户号不能为空");
            return false;
        }

        return true;
    }

    function operMer(merNo, active) {
        if (merNo == '' || merNo == null) {
            alert("商户号不能为空");
            return false;
        }

        $("#merNo").val(merNo);

        if (active) {
            var url = "activeAccount";
            //更改form的action
            $("#from1").attr("action", url);
            //触发submit事件，提交表单
            $("#from1").submit();
        } else {
            var url = "forbidAccount";
            //更改form的action
            $("#from1").attr("action", url);
            //触发submit事件，提交表单
            $("#from1").submit();
        }

    }
</script>
</body>
</html>
