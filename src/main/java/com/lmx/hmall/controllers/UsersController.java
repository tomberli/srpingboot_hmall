package com.lmx.hmall.controllers;

import com.lmx.hmall.dto.DataDto;
import com.lmx.hmall.dto.Users;
import com.lmx.hmall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

@Controller
public class UsersController {
    @Autowired
    private UserService userService;

    @Autowired
    private RedisTemplate redisTemplate;

    private Logger logger = LoggerFactory.getLogger(UsersController.class);

    @RequestMapping("userLoginJsp")
    public String userLoginJsp(){
        return "userLogin";
    }

    @RequestMapping("userRegisterJsp")
    public String userRegisterJsp(){
        return "userRegister";
    }

    @RequestMapping("echartsJsp")
    public String echartsJsp(){
        return "echarts";
    }

    @RequestMapping("/")
    public String mainPageJsp(){
        return "mainPage";
    }

    @RequestMapping("tipInterceptorJsp")
    public String tipInterceptorJsp(){
        return "tipInterceptor";
    }





    /**
     * 用户注册
     * @return
     */
    @RequestMapping("userRegister")
    public String userRegister(Users user){
        //先插入数据库中
        return userService.userRegister(user);
    }

    /**
     * 用户登陆
     * @return
     */
    @RequestMapping("userLogin")
    public String userLogin(Users user, HttpServletRequest request, HttpServletResponse response) {
        //验证用户名和密码是否正确
        return userService.userLogin(user,request,response);
    }


    /**
     * 显示所有的用户
     * @return
     */
    @RequestMapping("/showAllUsers")
    public String showAllUsers(HttpServletRequest request){
        List<Users> usersList = new ArrayList<>();
        usersList = userService.findAllUsers();
        request.setAttribute("usersList",usersList);
        //跳转到页面上
        return "showAllUsers";
    }

    /**
     * 更新用户信息 用户名和密码
     * @param user
     * @return
     */
    @RequestMapping("/updateUser")
    public String updateUser(Users user,HttpServletRequest request, HttpServletResponse response) {
        return userService.updateUser(user,request,response);
    }

    /**
     * 删除用户
     * @param user
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/deleteUser")
    @ResponseBody
    public DataDto deleteUser(Users user, HttpServletRequest request, HttpServletResponse response) {
        return userService.deleteUser(user,request,response);
    }

    /**
     * 获取token值
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "getTokenValue")
    public String getTokenValue(HttpServletRequest request, HttpServletResponse response) {
        return userService.getTokenValue(request,response);
    }



}





























