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
<%--编辑模态框--%>
<!-- 模态框，修改作用 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">编辑用户信息</h4>
            </div>
            <form class="form-horizontal" role="form" action="updateUser" method="post">
                <input type="hidden" name="id" id="id">
                <!-- 添加表单信息 -->
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-md-3 control-label">用户账号:</label>
                        <div class="col-md-5">
                            <input style="width:220px;" type="text" class="form-control"
                                   name="username" id="username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">用户密码:</label>
                        <div class="col-md-5">
                            <input style="width:220px;" type="text" class="form-control"
                                   name="password" id="password">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">提交更改</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%-- 显示用户信息 --%>
<div style="margin-left:0px;color: blue;font-size: 15px;cursor:pointer;" onclick="toMainPage()"><a>首页</a></div>
<div id="mainDiv" style="width:800px; height:600px;margin:0 auto;margin-top:30px;">
    <div style="margin:10 301"><h2>显示所有用户</h2></div>
    <table class="table table-bordered" id="showProTable" >
        <tr style="background:#FFF4C1;" id="topTitle">
            <th>序号</th>
            <th>主键ID</th>
            <th>用户账号</th>
            <th>用户密码</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${usersList}" var="userDto"  varStatus="status">
            <tr class="active" style="font-size:18px;">
                <!-- 序号 0-->
                <td width="5%">
                    <span style="font-weight:bold">${status.index+1}</span>
                </td>
                <%-- 主键ID --%>
                <td width="8%" id="domark">
                    ${userDto.getId()}
                </td>
                <!-- 用户账号 1-->
                <td width="8%" id="domark">
                    ${userDto.getUsername()}
                </td>
                <!-- 用户密码 2-->
                <td width="10%">
                    ${userDto.getPassword()}
                </td>
                <%--操作--%>
                <td width="10%">
                    <button class="btn btn-success .btn-xs" onclick="updateSelectUser(this)" data-toggle="modal" data-target="#myModal">
                        编辑
                    </button>
                    <button class="btn btn-danger .btn-xs" onclick="deleteUser(this)" name="${userDto.getId()}">删除</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<script>
        //更新用户
    function updateSelectUser(obj){
        var id = Trim($(obj).parent().siblings().eq(1).text());
        var username = Trim($(obj).parent().siblings().eq(2).text());
        var password = Trim($(obj).parent().siblings().eq(3).text());
        $("#id").val(id);
        $("#username").val(username);
        $("#password").val(password);
        console.log("id---"+id+"---username:"+username+"----password:"+password);
    }
    //删除用户
    function deleteUser(obj) {
        var flag = window.confirm("确定要删除该信息？");
        if(flag){
            var id = $(obj).attr("name");
            console.log(id);
            $.post("deleteUser",{"id":id},function(data){
                if(data.success){
                    $(obj).parent().parent().remove();
                    console.log("成功删除");
                }
            });
        }
    }
    //去空格
    function Trim(str){
        return str.replace(/(^\s*)|(\s*$)/g, "");
    }
    //去主页
    function toMainPage() {
        window.location.href="/srpingboot_hmall_war_exploded/";
    }
</script>
</body>
</html>
