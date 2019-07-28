<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>主界面</title>
</head>
<body>
<div style="margin:6% auto;width:30%;">
    <div style="float:left;margin-right:20px;"><span class="btn btn-success" onclick="login()" style="border-radius: 5px">登陆</span></div>
    <div style="float:left;margin-right:20px;"><span class="btn btn-warning" onclick="register()" style="border-radius: 5px">注册</span></div>
    <div style="float:left;border-radius: 5px"><span class="btn btn-info" onclick="showAllUsers()" style="border-radius: 5px">显示所有用户</span></div>
</div>
<div style="float:left;margin:3% 15%;width:60%;">
    <table class="table table-bordered" id="showProTable" >
        <tr style="background:lightblue;" id="topTitle">
            <th>序号</th>
            <th>功能</th>
            <th>验证方式</th>
        </tr>
        <tr>
            <td><div style="width: 50px;">1</div></td>
            <td><div style="width: 150px;">拦截器</div></td>
            <td>这里拦截器拦截显示所有用户的路径，放行的条件就是用户登陆时，存放用户名到session中。在页面你不登陆，那么就不能进入到展示所有的用中。</td>
        </tr>
        <tr>
            <td>2</td>
            <td>oauth2验证</td>
            <td>我实现了客户端模式和密码模式，这里只给出密码模式具体验证信息。(1)获取token值(点击获取即可)：
            <a onclick="getTokenValue()" style="color: blue">http://39.106.76.79:8080/srpingboot_hmall_war_exploded/oauth/token?username=user_1&password=123456&grant_type=password&scope=select&client_id=client_2&client_secret=123456</a>
                (2)请求资源路径：<sapn style="color: blue">http://39.106.76.79:8080/srpingboot_hmall_war_exploded/tokenSource?access_token=获取的access_token值</sapn>
                (备注：如果没有获取的access_token值，那么就无法访问该路径下的资源，反之可以)。
            </td>
        </tr>
        <tr>
            <td>3</td>
            <td>redis</td>
            <td>可以用本地连接远程redis,连接命令redis-cli.exe -h 39.106.76.79 -p 6379 -a ，查看2号库</td>
        </tr>
        <tr>
            <td>4</td>
            <td>其它</td>
            <td>....</td>
        </tr>
        <tr>
            <td>5</td>
            <td>github地址</td>
            <td></td>
        </tr>
    </table>
</div>

<script>
    function login(){
        window.location.href="/srpingboot_hmall_war_exploded/userLoginJsp";
    }
    function register() {
        window.location.href="/srpingboot_hmall_war_exploded/userRegisterJsp";
    }
    function showAllUsers() {
        window.location.href="/srpingboot_hmall_war_exploded/showAllUsers";
    }

    function getTokenValue() {
        window.location.href="/srpingboot_hmall_war_exploded/getTokenValue";
    }
</script>
</body>
</html>
