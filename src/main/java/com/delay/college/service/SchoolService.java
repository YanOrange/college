package com.delay.college.service;

import com.delay.college.entity.School;

import java.util.List;

/**
 * @author 闫金柱
 * @date 2020-11-14 17:43
 */
public interface SchoolService {
    List<School> findAll();

    School findById(Integer schoolId);

    void saveOrUpdate(School byId);

    void delete(Integer o);

    School findByName(String name);
}
