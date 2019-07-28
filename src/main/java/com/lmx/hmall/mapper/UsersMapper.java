package com.lmx.hmall.mapper;

import com.lmx.hmall.dto.Users;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UsersMapper {
    /**
     * 用户登陆
     * @param user
     * @return
     */
    List<Users> userLogin(Users user);

    /**
     * 用户注册
     * @param user
     * @return
     */
    Long userRegister(Users user);

    /**
     * 返回所有的用户
     * @return
     */
    List<Users> findAllUsers();

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    Long updateUser(Users user);

    /**
     * 删除用户
     * @param user
     */
    void deleteUser(Users user);
}