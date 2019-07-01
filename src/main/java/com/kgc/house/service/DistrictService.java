package com.kgc.house.service;

import com.github.pagehelper.PageInfo;
import com.kgc.house.pojo.District;


public interface DistrictService {
    PageInfo<District> getAll(Integer page, Integer rows);
    int insertSelective(District record);
    int updateByPrimaryKeySelective(District record);
    int deletes(int[] id);
    int deleteByPrimaryKey(Integer id);

}
