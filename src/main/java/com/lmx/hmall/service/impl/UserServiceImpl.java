package com.lmx.hmall.service.impl;

import com.lmx.hmall.dto.DataDto;
import com.lmx.hmall.dto.Users;
import com.lmx.hmall.mapper.UsersMapper;
import com.lmx.hmall.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.TimeUnit;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UsersMapper usersMapper;

    @Autowired
    private RedisTemplate redisTemplate;

    private Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
    /**
     * 用户登陆
     * @param user
     * @return
     */
    @Override
    public String userLogin(Users user, HttpServletRequest request, HttpServletResponse response){
        try {
            List<Users> userList = usersMapper.userLogin(user);
            if(userList.isEmpty() || userList == null){
                return "loginFailed";
            }else{
                //将username放入session中，让拦截器判定已经登陆了
                request.getSession().setAttribute("username",user.getUsername());
                //跳转用户显示页面
                request.getRequestDispatcher("/showAllUsers").forward(request, response);
                return null;
            }
        } catch (Exception e) {
            logger.error("用户登陆失败==>",e);
        }
        return "loginFailed";
    }
    /**
     * 用户注册
     * @param user
     * @return
     */
    @Override
    public String userRegister(Users user) {
        String key = generateId();
        user.setId(key);
        Long mark = usersMapper.userRegister(user);
        if(mark > 0){
            ValueOperations<String, Users> operations = redisTemplate.opsForValue();
            //判定redis是否存在该key
            boolean hasKey = redisTemplate.hasKey(key);
            if(hasKey){
                operations.getOperations().delete(key);
            }
            //插入缓存 get()就可以取数据
            operations.set(key, user, 60, TimeUnit.MINUTES);
            return "registerSuccess";
        }else{
            return "registerFailed";
        }
    }

    /**
     * 查询所有的用户
     * @return
     */
    @Override
    public List<Users> findAllUsers() {
        List<Users> usersList = usersMapper.findAllUsers();
        return usersList;
    }
    /**
     * 更新用户信息
     * @param user
     * @return
     */
    @Override
    public String updateUser(Users user, HttpServletRequest request, HttpServletResponse response) {
        try {
            Long temp = usersMapper.updateUser(user);
            if(temp > 0){
                ValueOperations<String, Users> operations = redisTemplate.opsForValue();
                boolean hasKey = redisTemplate.hasKey(user.getId());
                if(hasKey){
                    operations.getOperations().delete(user.getId());
                }
                operations.set(user.getId(),user,60, TimeUnit.MINUTES);
                //跳转用户显示页面
                request.getRequestDispatcher("/showAllUsers").forward(request, response);
                return null;
            }
        } catch (Exception e) {
            logger.error("用户更新发生异常==>",e);
        }
        return "404";
    }

    /**
     * 删除用户
     * @param user
     * @param request
     * @param response
     * @return
     */
    @Override
    public DataDto deleteUser(Users user, HttpServletRequest request, HttpServletResponse response) {
        DataDto dataDto = new DataDto();
        try {
            usersMapper.deleteUser(user);
            ValueOperations<String, Users> operations = redisTemplate.opsForValue();
            boolean hasKey = redisTemplate.hasKey(user.getId());
            if(hasKey){
                operations.getOperations().delete(user.getId());
            }
        } catch (Exception e) {
            dataDto.setSuccess(false);
           logger.error("删除用户失败==>",e);
        }
        return dataDto;
    }

    /**
     * 获取token值
     * @param request
     * @param response
     * @return
     */
    @Override
    public String getTokenValue(HttpServletRequest request, HttpServletResponse response) {
        String url = "http://127.0.0.1:8080/srpingboot_hmall_war_exploded/oauth/token?username=user_1&password=123456&grant_type=password&scope=select&client_id=client_2&client_secret=123456";
        RestTemplate restTemplate = new RestTemplate();
        Map resultMap = restTemplate.postForObject(url, null, Map.class);
        logger.info("输出token获取信息==>{}",resultMap);
        request.setAttribute("resultMap",resultMap);
        return "showTokenValue";
    }


    /**
     * 获取主键工具类
     * @return
     */
    public static  String generateId() {
        //当前系统时间戳精确到毫秒
        Long simple=System.currentTimeMillis();
        //三位随机数
        int random=new Random().nextInt(900)+100;//为变量赋随机值100-999;
        return simple.toString()+random;
    }
}
