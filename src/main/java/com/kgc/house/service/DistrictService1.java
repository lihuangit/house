package com.kgc.house.service;

import com.kgc.house.pojo.District;

import java.util.List;


public interface DistrictService1 {
    List<District> getAll();
    int insertSelective(District record);
    int updateByPrimaryKeySelective(District record);
    int deletes(int[] id);
    int deleteByPrimaryKey(Integer id);

}
