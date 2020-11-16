package com.delay.college.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
@Table(name = "t_user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)//自增长
    private Integer id;

    private String name;//姓名
    private String sex;//性别
    private String age;//年龄
    private String birthDay;//生日
    private String phone;//联系方式
    private String idCard;//身份证
    private String school;//所属高校
    private String account;//账号
    private String passWord;//密码
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss",timezone = "GMT-8")
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date createTime;//创建时间
    private String email;//邮箱
    private String address;//地址
    private Integer status;//0普通用户 3管理员


}
