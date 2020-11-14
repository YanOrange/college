package com.delay.college.repository;

import com.delay.college.entity.School;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

/**
 * @author 闫金柱
 * @date 2020-11-14 17:43
 */
@Repository
@Component
public interface SchoolRepository extends JpaRepository<School,Integer> {
    School findByName(String name);
}
