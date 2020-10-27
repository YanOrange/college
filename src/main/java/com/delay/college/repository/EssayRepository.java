package com.delay.college.repository;

import com.delay.college.entity.Essay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Component
public interface EssayRepository extends JpaRepository<Essay,Integer> {

    List<Essay> findAllByUser_Id(Integer user_id);

    List<Essay> findAllByState(Integer state);

    List<Essay> findAllByTypeIdAndState(Integer typeId, int state);

}
