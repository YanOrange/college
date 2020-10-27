package com.delay.college.service;


import com.delay.college.entity.Essay;

import java.util.List;


public interface EssayService {
    void saveOrUpdate(Essay essay);

    List<Essay> findAllById(Integer id);

    Essay findById(Integer essayId);

    void delete(Integer o);

    List<Essay> findByState(Integer state);

    void deleteByUserId(Integer o);

    List<Essay> findAllByTypeId(Integer typeId);
}
