package com.delay.college.controller;


import com.delay.college.entity.User;
import com.delay.college.service.EssayService;
import com.delay.college.service.UserService;
import com.delay.college.utils.ExecuteResult;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private EssayService essayService;
    /**
     * 获取个人信息
     * @return
     */
    @RequestMapping("getInfo")
    public String getInfo(@RequestParam("authorId") Integer authorId, HttpServletRequest request){

        User author = userService.findById(authorId);
        request.setAttribute("author",author);
        return "author/person-edit";
    }
    /**
     * 修改个人信息
     * @return
     */
    @RequestMapping("editInfo")
    @ResponseBody
    public ExecuteResult editInfo(@RequestBody User author){

        User comAuthor = userService.findById(author.getId());
        BeanUtils.copyProperties(author,comAuthor,"createTime","status","passWord","account");
        userService.saveOrUpdate(comAuthor);
        getSession().setAttribute("user",comAuthor);
        return ExecuteResult.ok();
    }
    /**
     * 根据身份查找用户
     * @return
     */
    @RequestMapping("findAllByStatus")
    @ResponseBody
    public ExecuteResult findAllByStatus(@RequestParam("status")Integer status){
        List<User> users = userService.findAllByStatus(status);
        return ExecuteResult.ok(users);
    }
    /**
     * 删除用户
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public ExecuteResult delete(@RequestBody List<Integer> userIds){
        userIds.stream().forEach(o->{
            essayService.deleteByUserId(o);
            userService.delete(o);
        });
        return ExecuteResult.ok();
    }
    /**
     * 注册用户
     * @return
     */
    @RequestMapping("add")
    @ResponseBody
    public ExecuteResult add(@RequestBody User user){
        User byAccount = userService.findByAccount(user.getAccount());
        if(byAccount!=null){
            return ExecuteResult.fail(1,"用户名已存在");
        }
        user.setCreateTime(new Date());
        userService.saveOrUpdate(user);
        return ExecuteResult.ok();
    }
}
