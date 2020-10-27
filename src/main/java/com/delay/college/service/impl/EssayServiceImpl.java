package com.delay.college.service.impl;


import com.delay.college.entity.Essay;
import com.delay.college.repository.EssayRepository;
import com.delay.college.service.EssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EssayServiceImpl implements EssayService {

    @Autowired
    EssayRepository essayRepository;

    @Override
    public void saveOrUpdate(Essay essay) {
        essayRepository.saveAndFlush(essay);
    }

    @Override
    public List<Essay> findAllById(Integer id) {
        return essayRepository.findAllByUser_Id(id);
    }

    @Override
    public Essay findById(Integer essayId) {
        Optional<Essay> byId = essayRepository.findById(essayId);
        if(byId.isPresent()){
            return byId.get();
        }
        return null;
    }

    @Override
    public void delete(Integer o) {
        essayRepository.deleteById(o);
    }

    @Override
    public List<Essay> findByState(Integer state) {
        return essayRepository.findAllByState(state);
    }

    @Override
    public void deleteByUserId(Integer o) {
        List<Essay> allByUser_id = essayRepository.findAllByUser_Id(o);
        essayRepository.deleteAll(allByUser_id);
    }

    @Override
    public List<Essay> findAllByTypeId(Integer typeId) {
        return essayRepository.findAllByTypeIdAndState(typeId,1);
    }
}
