package com.kgc.house.service;

import com.github.pagehelper.PageInfo;
import com.kgc.house.pojo.Street;
import com.kgc.house.pojo.StreetDis;

public interface StreetService {
    int deleteByPrimaryKey(Integer id);

    int insert(Street record);

    int insertSelective(Street record);

    PageInfo<Street> selectByExample(StreetDis streetDis);

    Street selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Street record);

    int updateByPrimaryKey(Street record);
    int deles(Integer[] id);
    PageInfo<Street> selectByExample1(Integer page, Integer rows);

}
