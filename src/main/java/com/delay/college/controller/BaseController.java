package com.delay.college.controller;

import com.delay.college.entity.User;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class BaseController {

    @Autowired
    protected HttpServletRequest request;

    public HttpSession getSession(){
        return request.getSession();
    }

    public User getUser(){
        User user = null;
        try {
            user = (User)request.getSession().getAttribute("user");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return user;

    }

}
