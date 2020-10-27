package com.delay.college.controller;

import com.delay.college.entity.Essay;
import com.delay.college.entity.User;
import com.delay.college.service.EssayService;
import com.delay.college.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("page")
public class PageController extends BaseController{

    @Autowired
    private EssayService essayService;
    @Autowired
    private UserService userService;

    /**
     * 登录页面
     * @return
     */
    @RequestMapping("login")
    public String login(){
        return "login";
    }

    /**
     *欢迎页面
     * @return
     */
    @RequestMapping("welcome")
    public String welcome(){
        return "welcome";
    }

    /**
     *首页
     * @return
     */
    @RequestMapping("index")
    public String index(){
        return "index";
    }


    /**
     * 个人界面
     * @return
     */
    @RequestMapping("person")
    public String person(){
        User user = getUser();

        return "author/person";
    }
    /**
     * 客户端个人界面
     * @return
     */
    @RequestMapping("clientPerson")
    public String clientPerson(){

        return "client/person";
    }

    /**
     * 我的收藏
     * @return
     */
    @RequestMapping("myFav")
    public String myFav(){

        return "client/fav";
    }
    /**
     * 修改个人信息
     * @return
     */
    @RequestMapping("editor")
    public String editor(){
        return "author/editor";
    }
    /**
     * 新闻列表
     * @return
     */
    @RequestMapping("essayList")
    public String essayList(){
        return "author/essay-list";
    }
    /**
     * 待审核稿件
     * @return
     */
    @RequestMapping("masterEssayList")
    public String masterEssayList(){
        return "master/master-essay-list";
    }

    /**
     * 审核后的稿件
     * @return
     */
    @RequestMapping("masterEssayPassList")
    public String masterEssayPassList(){
        return "master/master-essay-pass-list";
    }

    /**
     * 弃用稿件列表
     * @return
     */
    @RequestMapping("editorEssayList")
    public String editorEssayList(){
        return "editor/editor-essay-list";
    }

    /**
     * 获取全部专家
     * @return
     */
    @RequestMapping("toGetMaster")
    public String toGetMaster(){
        return "editor/master-list";
    }

    /**
     * 获取全部管理员
     * @return
     */
    @RequestMapping("toAdmin")
    public String toAdmin(){
        return "admin/admin-list";
    }

    /**
     * 新增用户
     * @return
     */
    @RequestMapping("add")
    public String add(Integer status, Model model){
        model.addAttribute("status",status);
        return "author/person-add";
    }
    /**
     * 新增类型
     * @return
     */
    @RequestMapping("addType")
    public String addType(){
        return "type/type-add";
    }

    /**
     * 类型列表
     * @return
     */
    @RequestMapping("typeList")
    public String typeList(){
        return "type/type-list";
    }

    /**
     * 退出登录
     * @return
     */
    @RequestMapping("exit")
    public String exit(){

        getSession().removeAttribute("user");

        return "login";
    }

    /**
     * 客户端首页
     * @return
     */
    @RequestMapping("home")
    public String home(){

        return "client/home";
    }

    /**
     * 客户端登录页面
     * @return
     */
    @RequestMapping("clientLogin")
    public String clientLogin(){

        return "client/login";
    }

    //查看新闻（根据ID）
    @RequestMapping("findById")
    public String findById(@RequestParam("essayId") Integer essayId, Model model){
        Essay essay = essayService.findById(essayId);
        model.addAttribute("essay",essay);
        return "client/essay";
    }


}
