package com.delay.college.controller;

import com.delay.college.entity.User;
import com.delay.college.service.UserService;
import com.delay.college.utils.ExecuteResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("login")
public class LoginController extends BaseController{

    @Autowired
    UserService userService;

    //登录后台
    @RequestMapping("doLogin")
    @ResponseBody
    public ExecuteResult login(@RequestParam("userName") String userName, @RequestParam("passWord")String passWord){

        User user = userService.findByAccountAndPassWord(userName,passWord);
        if(user==null){
            return ExecuteResult.fail(1,"用户passWord名不存在或密码错误");
        }
        if(user.getStatus().equals(1)){
            return ExecuteResult.fail(1,"账号权限不足");
        }
        getSession().setAttribute("user",user);
        return ExecuteResult.ok();
    }

    //登录客户端
    @RequestMapping("doLogin2")
    @ResponseBody
    public ExecuteResult login2(@RequestParam("userName") String userName, @RequestParam("passWord")String passWord){

        User user = userService.findByAccountAndPassWord(userName,passWord);
        if(user==null){
            return ExecuteResult.fail(1,"用户名不存在或密码错误");
        }
        getSession().setAttribute("user2",user);
        return ExecuteResult.ok();
    }

}
