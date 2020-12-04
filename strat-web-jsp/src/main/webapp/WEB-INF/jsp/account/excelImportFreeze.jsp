<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                <form  method="post" action="/finance/excelImportFreeze" enctype="multipart/form-data">
                    <div class="item">
                       <%-- <b style="color: slategrey">[注：* 不可修改,请联系管理员进行开放]</b>--%>
                    </div>
                    <div id="zhongxin">
                        <table border="1" width="450" cellpadding="4" cellspacing="2" bordercolor="#9BD7FF">
                            <tr>
                                <td width="100%" colspan="2">
                                    文件：<input name="file" size="40" type="file" >
                                </td>
                            </tr>
                        </table>
                        <br/><br/>
                        <table>
                            <tr><td align="center"><input name="upload" type="submit" value="开始导入"/></td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <td align="center">点击下载<a href="/model/freezeTemplate.xls">模板</a></td>
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


</body>
</html>