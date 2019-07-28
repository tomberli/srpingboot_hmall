<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>拦截器</title>
</head>
<script type="text/javascript">
    var time = 4;
    function returnUrlByTime() {
        window.setTimeout('returnUrlByTime()', 1000);
        time = time - 1;
        document.getElementById("layer").innerHTML = time;
    }
</script>
<body onload="returnUrlByTime()">
    <h2>没有登陆不能访问，请先登陆</h2>
    <b><span id="layer" style="font-size:40px">4</span>秒后，跳入登录界面</b>
    <%
        //转向语句
        response.setHeader("Refresh", "3;URL=/srpingboot_hmall_war_exploded/userLoginJsp");
    %>
</body>
</html>
