package com.delay.college.service;


import com.delay.college.entity.User;

import java.util.List;

public interface UserService {
    User findById(Integer authorId);

    void saveOrUpdate(User comAuthor);

    List<User> findAllByStatus(int i);

    void delete(Integer userId);

    User findByAccount(String account);

    User findByAccountAndPassWord(String userName, String passWord);
}
