<%--
  User: limingxing
  Date: 2019/7/13
  Time: 22:58
  用户登陆
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>用户登陆</title>
</head>
<style>
    #mainDiv{

    }
</style>
<body>
    <div id="mainDiv" style="width:400px; height:400px;margin:0 auto;margin-top:30px;">
        <div style="color: blue;font-size: 15px;cursor:pointer;" onclick="toMainPage()"><a>首页</a></div>
        <div style="margin:30 159;font-size:20px;">用户登陆</div>
        <form class="form-horizontal" role="form" action="userLogin">
            <div class="form-group">
                <label class="col-sm-3 control-label">用户名</label>
                <div class="col-sm-7">
                    <input type="text" name="username" class="form-control" id="username" placeholder="请输入用户名">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">密码</label>
                <div class="col-sm-7">
                    <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码">
                </div>
            </div>
            <div style="margin:10 130;">
                <button type="submit" class="btn btn-primary" style="margin-right:25px;">登陆</button>
                <button type="reset" class="btn btn-warning">重置</button>
            </div>
        </form>
    </div>
<script>
    function toMainPage() {
        window.location.href="/srpingboot_hmall_war_exploded/";
    }
</script>
</body>
</html>
