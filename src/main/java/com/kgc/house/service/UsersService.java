package com.kgc.house.service;

import com.github.pagehelper.PageInfo;
import com.kgc.house.pojo.Users;
import com.kgc.house.pojo.UsersPage;

public interface UsersService {    int deleteByPrimaryKey(Integer id);

    int insert(Users record);

    int insertSelective(Users record);

    PageInfo<Users> selectByExample(UsersPage usersPage);

    Users selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);
    int deles(Integer[] id);


}
