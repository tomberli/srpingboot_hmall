package com.lmx.hmall.service;

import com.lmx.hmall.dto.DataDto;
import com.lmx.hmall.dto.Users;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public interface UserService {

    /**
     * 用户登陆
     * @param user
     * @return
     */
    String userLogin(Users user,HttpServletRequest request, HttpServletResponse response);

    /**
     * 用户注册
     * @param user
     * @return
     */
    String userRegister(Users user);

    /**
     * 寻找所有的用户
     * @return
     */
    List<Users> findAllUsers();

    /**
     * 更新用户名
     * @param user
     * @return
     */
    String updateUser(Users user, HttpServletRequest request, HttpServletResponse response);

    /**
     * 删除用户
     * @param user
     * @param request
     * @param response
     * @return
     */
    DataDto deleteUser(Users user, HttpServletRequest request, HttpServletResponse response);

    /**
     * 获取token值
     * @param request
     * @param response
     * @return
     */
    String getTokenValue(HttpServletRequest request, HttpServletResponse response);
}













