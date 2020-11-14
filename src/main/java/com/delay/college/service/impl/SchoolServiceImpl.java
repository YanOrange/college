package com.delay.college.service.impl;

import com.delay.college.entity.School;
import com.delay.college.repository.SchoolRepository;
import com.delay.college.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * @author 闫金柱
 * @date 2020-11-14 17:43
 */
@Service
public class SchoolServiceImpl implements SchoolService {

    @Autowired
    SchoolRepository schoolRepository;

    @Override
    public List<School> findAll() {
        return schoolRepository.findAll();
    }

    @Override
    public School findById(Integer schoolId) {
        Optional<School> byId = schoolRepository.findById(schoolId);
        if(byId.isPresent()){
            return byId.get();
        }
        return null;
    }

    @Override
    public void saveOrUpdate(School byId) {
        schoolRepository.saveAndFlush(byId);
    }

    @Override
    public void delete(Integer o) {
        schoolRepository.deleteById(o);
    }

    @Override
    public School findByName(String name) {
        return schoolRepository.findByName(name);
    }
}
