<%--
  User: limingxing
  Date: 2019/7/15
  Time: 9:07
  Describe:显示所有的用户
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    body{text-align:center}
    .table th, .table td {
        text-align: center;
        vertical-align: middle!important;
    }
    .table td{
        font-size:15px;
    }
</style>
<head>
    <title>显示有所的用户</title>
</head>
<body>
<%-- 获取的token值 --%>
<div style="margin-left:0px;color: blue;font-size: 15px;cursor:pointer;" onclick="toMainPage()"><a>首页</a></div>
<div id="mainDiv" style="width:800px; height:600px;margin:0 auto;margin-top:30px;">
    <div style="margin:10 301"><h2>获取权鉴数据</h2></div>
    <table class="table table-bordered" id="showProTable" >
        <tr style="background:#FFF4C1;" id="topTitle">
            <th>序号</th>
            <th>字段名</th>
            <th>字段值</th>
        </tr>
        <c:forEach items="${resultMap}" var="tempMap"  varStatus="status">
            <tr class="active" style="font-size:18px;">
                <!-- 序号 0-->
                <td width="10%">
                    <span style="font-weight:bold">${status.index+1}</span>
                </td>
                <%-- 字段名 --%>
                <td width="15%">
                    ${tempMap.key}
                </td>
                <%-- 字段值 --%>
                <td width="75%">
                    <a>${tempMap.value}</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<script>

    //跳到主页
    function toMainPage() {
        window.location.href="/srpingboot_hmall_war_exploded/";
    }
</script>
</body>
</html>
