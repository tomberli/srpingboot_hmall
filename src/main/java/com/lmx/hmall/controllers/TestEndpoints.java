package com.lmx.hmall.controllers;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
public class TestEndpoints {
    /**
     * 需要权鉴认证获取资源
     * @return
     */
    @GetMapping("/tokenSource")
    public String getOrder(HttpServletRequest request, HttpServletResponse response) throws Exception{
        request.getRequestDispatcher("/echartsJsp").forward(request, response);
        return null;
    }
}
