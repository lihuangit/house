package com.kgc.house.service;

import com.kgc.house.pojo.Users;

public interface UsersService1 {
    int selectByExample(String name);
    int insertSelective(Users record);
    Users userLogin(String name, String password);
    Users userLogin1(String name, String password);
}
