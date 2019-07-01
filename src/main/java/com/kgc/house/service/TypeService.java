package com.kgc.house.service;

import com.github.pagehelper.PageInfo;
import com.kgc.house.pojo.Type;

public interface TypeService {    int deleteByPrimaryKey(Integer[] id);

    int insert(Type record);

    int insertSelective(Type record);

    PageInfo<Type> getAll(Integer page, Integer rows);

    Type selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Type record);

    int updateByPrimaryKey(Type record);
    int deleteByPrimaryKey1(Integer id);


}
