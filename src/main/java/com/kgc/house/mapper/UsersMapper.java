package com.kgc.house.mapper;

import com.kgc.house.pojo.Users;
import com.kgc.house.pojo.UsersExample;

import java.util.List;

public interface UsersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Users record);

    int insertSelective(Users record);

    List<Users> selectByExample(UsersExample example);

    Users selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);
    int deles(Integer[] id);

}