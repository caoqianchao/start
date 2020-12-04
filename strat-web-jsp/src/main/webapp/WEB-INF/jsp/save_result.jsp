<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>操作结果</title>
    <meta name="description" content="overview & stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <script type="text/javascript" src="/static/js/jquery-1.9.1.min.js"></script>

</head>
<body>
<div id="zhongxin" class="clearfix"></div>
<script type="text/javascript">
    var msg = "${msg}";
    if (msg == "success" || msg == "") {
        document.getElementById('zhongxin').style.display = 'none';
        parent.Dialog.close();
    } else {
        alert(msg);
        parent.Dialog.close();
    }
</script>
</body>
</html>
