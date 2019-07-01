package com.kgc.house.mapper;

import com.kgc.house.pojo.Type;
import com.kgc.house.pojo.TypeExample;

import java.util.List;

public interface TypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Type record);

    int insertSelective(Type record);

    List<Type> selectByExample(TypeExample example);

    Type selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Type record);

    int updateByPrimaryKey(Type record);
    int deletes(Integer[] id);
}