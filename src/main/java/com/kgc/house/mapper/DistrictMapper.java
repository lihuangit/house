package com.kgc.house.mapper;

import com.kgc.house.pojo.District;
import com.kgc.house.pojo.DistrictExample;

import java.util.List;

public interface DistrictMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(District record);

    int insertSelective(District record);

    List<District> selectByExample(DistrictExample example);

    District selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(District record);

    int updateByPrimaryKey(District record);
    List<District> getAll();
    int deletes(int[] id);
}