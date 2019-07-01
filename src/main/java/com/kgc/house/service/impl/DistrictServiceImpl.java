package com.kgc.house.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.house.mapper.DistrictMapper;
import com.kgc.house.mapper.StreetMapper;
import com.kgc.house.pojo.District;
import com.kgc.house.service.DistrictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DistrictServiceImpl implements DistrictService {
    @Autowired
  private DistrictMapper districtMapper;
    @Autowired
    private StreetMapper streetMapper;
    @Override
    public PageInfo<District> getAll(Integer page,Integer rows) {
        PageHelper.startPage(page,rows);
        List<District> all = districtMapper.getAll();
        PageInfo<District> pageInfo=new PageInfo<>(all);
        return pageInfo;
    }

    @Override
    public int insertSelective(District record) {
        return districtMapper.insertSelective(record);
    }

    @Override
    public int updateByPrimaryKeySelective(District record) {
        return districtMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int deletes(int[] id) {
        return districtMapper.deletes(id);
    }

    @Override
    @Transactional
    public int deleteByPrimaryKey(Integer id) {

        try {
            streetMapper.dele1(id);
            districtMapper.deleteByPrimaryKey(id);
            return 1;
        } catch (Exception e) {
            return 0;
        }

    }

}
