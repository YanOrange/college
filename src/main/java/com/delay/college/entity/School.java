package com.delay.college.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @author 闫金柱
 * @date 2020-11-14 17:44
 */
@Entity
@Data
@Table(name = "t_school")
public class School {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)//自增长
    private Integer id;

    private String name;//高校名

    private Date createTime;//创建时间

}
