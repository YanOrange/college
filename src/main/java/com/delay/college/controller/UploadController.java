package com.delay.college.controller;


import com.delay.college.utils.ExecuteResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("upload")
public class UploadController {

    /**
     * 上传图片
     * @param file
     * @return
     */
    @RequestMapping("/cloud")
    @ResponseBody
    public ExecuteResult<?> importPic(@RequestParam(value = "thumbnail") MultipartFile file) {
        String property = System.getProperty("user.dir");
        System.out.println(property);
        String imgurl = null;// 文件路径
        String trueFileName = null;// 自定义的文件名称
        if (file != null) {// 判断上传的文件是否为空
            String type = null;// 文件类型
            String fileName = file.getOriginalFilename();// 文件原名称
            System.out.println("上传的文件原名称:" + fileName);
// 判断文件类型
            type = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()) : null;
            if (type != null) {// 判断文件类型是否为空
                if ("GIF".equals(type.toUpperCase()) || "PNG".equals(type.toUpperCase()) || "JPG".equals(type.toUpperCase())) {
// 项目在容器中实际发布运行的根路径
// String realPath="E:\\apache-tomcat-8.5.40\\apache-tomcat-8.5.40\\webapps\\imgs\\";

//图片存放的路径，可写在本地硬盘，也可放在服务器上
//----------------------------本实例在服务器镜像映射的地址----------------------------------------------
                    String realPath = property+"/target/classes/static/uploadImg/";

//自定义的文件名称
                    trueFileName = String.valueOf(System.currentTimeMillis()) + fileName;
//设置存放图片文件的路径
                    imgurl = realPath +/*System.getProperty("file.separator")+*/trueFileName;
                    System.out.println("存放图片文件的路径:" + imgurl);
// 转存文件到指定的路径
                    try {
                        file.transferTo(new File(imgurl));
                    } catch (IllegalStateException e) {
                        System.out.println(e.toString());
                        e.printStackTrace();
                    } catch (IOException e) {
                        System.out.println(e.toString());
                        e.printStackTrace();
                    }
                    System.out.println("文件成功上传到指定目录下");
                } else {
                    System.out.println("不是我们想要的文件类型,请按要求重新上传");
                    return ExecuteResult.fail(1, "文件类型不符");
                }
            } else {
                System.out.println("文件类型为空");
                return ExecuteResult.fail(1, "文件类型为空");
            }
        } else {
            System.out.println("没有找到相对应的文件");
            return ExecuteResult.fail(1, "没有找到相对应的文件");
        }
//TODO 线上图片存放路径需要修改
//测试地址--------------------------------------------------------------------------
        String returnUrl = "/uploadImg/" + trueFileName;
//测试地址--------------------------------------------------------------------------

        return ExecuteResult.ok(returnUrl);
    }

}
