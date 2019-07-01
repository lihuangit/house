package com.kgc.house.service.impl;

import com.kgc.house.mapper.DistrictMapper;
import com.kgc.house.mapper.StreetMapper;
import com.kgc.house.pojo.District;
import com.kgc.house.pojo.DistrictExample;
import com.kgc.house.service.DistrictService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DistrictServiceImpl1 implements DistrictService1 {
    @Autowired
  private DistrictMapper districtMapper;
    @Autowired
    private StreetMapper streetMapper;


    @Override
    public List<District> getAll() {
        DistrictExample districtExample = new DistrictExample();
        return districtMapper.selectByExample(districtExample);
    }

    @Override
    public int insertSelective(District record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeySelective(District record) {
        return 0;
    }

    @Override
    public int deletes(int[] id) {
        return 0;
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }
}
