<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>500 Error Page - Ace Admin</title>
    <meta name="description" content="500 Error Page"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
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
<!--/.navbar-->
<div class="container-fluid" id="main-container">
    <div id="main-content" class="clearfix">

        <div id="page-content" class="clearfix">

            <div class="row-fluid">
                <!-- PAGE CONTENT BEGINS HERE -->
                <div class="error-container">
                    <div class="well">
                        <h1 class="grey lighter smaller">
                            <span class="blue bigger-125"><i class="icon-random"></i> 错误</span> Something Went Wrong
                        </h1>
                        <hr/>
                        <h3 class="lighter smaller"> ${errorInfo}</h3>

                        <div class="space"></div>

                        <hr/>
                        <div class="space"></div>

                    </div>
                </div>
                <!-- PAGE CONTENT ENDS HERE -->
            </div>
            <!--/row-->

        </div>

    </div>
    <!-- #main-content -->
</div>
<!--/.fluid-container#main-container-->

<!-- basic scripts -->
<script src="/static/js/jquery-1.9.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<!-- page specific plugin scripts -->

<!-- ace scripts -->
<script src="/static/js/ace-elements.min.js"></script>
<script src="/static/js/ace.min.js"></script>
<!-- inline scripts related to this page -->

<script type="text/javascript">

    $(function () {

    })
</script>
</body>
</html>
