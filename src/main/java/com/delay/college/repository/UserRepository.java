package com.delay.college.repository;

import com.delay.college.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Component
public interface UserRepository extends JpaRepository<User,Integer> {

    List<User> findAllByStatus(int status);

    User findByAccount(String account);

    User findByAccountAndPassWord(String account, String passWord);
}
