package com.delay.college.service;


import com.delay.college.entity.Type;

import java.util.List;

public interface TypeService {

    Type findById(Integer typeId);

    List<Type> findAll();

    void saveOrUpdate(Type byId);

    void delete(Integer o);

    Type findByName(String name);
}
