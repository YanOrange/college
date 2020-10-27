package com.delay.college.controller;

import com.delay.college.entity.Essay;
import com.delay.college.entity.Type;
import com.delay.college.entity.User;
import com.delay.college.service.EssayService;
import com.delay.college.service.TypeService;
import com.delay.college.utils.ExecuteResult;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("essay")
public class EssayController extends BaseController {

    @Autowired
    private EssayService essayService;
    @Autowired
    private TypeService typeService;


    //保存
    @RequestMapping("save")
    @ResponseBody
    public ExecuteResult save(@RequestBody Essay essay){
        User user = getUser();
        Integer typeId = essay.getType().getId();
        Type type = typeService.findById(typeId);
        if(essay.getId()==null){
            essay.setUser(user);
            essay.setCreateTime(new Date());
            essay.setType(type);
            essay.setState(0);
            essayService.saveOrUpdate(essay);
        }else{
            Essay byId = essayService.findById(essay.getId());
            BeanUtils.copyProperties(essay,byId,"createTime","user","publishTime","type");
//            byId.setType("稿件");
            byId.setState(0);
            byId.setUpdateTime(new Date());

            essayService.saveOrUpdate(byId);
        }

        return ExecuteResult.ok();
    }

    //通过类型找
    @RequestMapping("findByType")
    @ResponseBody
    public ExecuteResult findByType(Integer typeId){
        List<Essay> essays = essayService.findAllByTypeId(typeId);
        return ExecuteResult.ok(essays);
    }

    //获取全部
    @RequestMapping("getAllEssay")
    @ResponseBody
    public ExecuteResult getAllEssay(){
        User user = getUser();
        List<Essay> essays = essayService.findAllById(user.getId());
        return ExecuteResult.ok(essays);
    }

    //根据状态查找
    @RequestMapping("getEssayByState")
    @ResponseBody
    public ExecuteResult getEssayByState(@RequestParam("state") Integer state){
        List<Essay> essays = essayService.findByState(state);
        return ExecuteResult.ok(essays);
    }

    //设置状态
    @RequestMapping("setState")
    @ResponseBody
    public ExecuteResult setState(@RequestParam("state") Integer state,@RequestParam("essayId") Integer essayId){
        Essay byId = essayService.findById(essayId);
        byId.setState(state);
        if(state.equals(1)){
            byId.setPublishTime(new Date());
        }
        essayService.saveOrUpdate(byId);
        return ExecuteResult.ok();
    }

    //查看
    @RequestMapping("checkEssay")
    public String checkEssay(@RequestParam("essayId") Integer essayId, Model model){

        Essay essay = essayService.findById(essayId);
        model.addAttribute("essay",essay);
        return "author/essay-show";
    }

    //前往修改页面
    @RequestMapping("toEditEssay")
    public String toEditEssay(@RequestParam("essayId") Integer essayId, Model model){
        Essay essay = essayService.findById(essayId);
        model.addAttribute("essay",essay);
        return "author/editor";
    }

    //删除
    @RequestMapping("delete")
    @ResponseBody
    public ExecuteResult delete(@RequestBody List<Integer> ids){
        if(CollectionUtils.isEmpty(ids)){
            return ExecuteResult.fail(1,"未选择一列");
        }
        ids.stream().forEach(o->{
            essayService.delete(o);
        });
        return ExecuteResult.ok();
    }

    //打回
    @RequestMapping("refuse")
    @ResponseBody
    public ExecuteResult refuse(@RequestParam("essayId")Integer essayId,@RequestParam("remark")String remark){
        Essay byId = essayService.findById(essayId);
        byId.setRemark(remark);
        byId.setState(2);
        essayService.saveOrUpdate(byId);
        return ExecuteResult.ok();
    }



}
