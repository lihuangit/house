package com.kgc.house.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.house.mapper.StreetMapper;
import com.kgc.house.pojo.Street;
import com.kgc.house.pojo.StreetDis;
import com.kgc.house.pojo.StreetExample;
import com.kgc.house.service.StreetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StreetServiceImpl implements StreetService {
    @Autowired
    private StreetMapper streetMapper;


    @Override
    public int deleteByPrimaryKey(Integer id) {
        return streetMapper.deleteByPrimaryKey(id);
    }


    @Override
    public int insert(Street record) {
        return 0;
    }

    @Override
    public int insertSelective(Street record) {
        return streetMapper.insertSelective(record);
    }

    @Override
    public  PageInfo<Street> selectByExample(StreetDis streetDis) {
        PageHelper.startPage(streetDis.getPage(),streetDis.getRows());
        StreetExample streetExample = new StreetExample();
        StreetExample.Criteria criteria = streetExample.createCriteria();
         criteria.andDistrictIdEqualTo(streetDis.getDistrictId());

        List<Street> streets = streetMapper.selectByExample(streetExample);
        PageInfo<Street> pageInfo=new PageInfo<>(streets);

        return pageInfo;
    }

    @Override
    public Street selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Street record) {
        return streetMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Street record) {
        return 0;
    }

    @Override
    public int deles(Integer[] id) {
        return streetMapper.deles(id);
    }

    @Override
    public PageInfo<Street> selectByExample1(Integer page, Integer rows) {
        PageHelper.startPage(page,rows);
       ;


        List<Street> streets = streetMapper.selectByExample1();
        PageInfo<Street> pageInfo=new PageInfo<>(streets);

        return pageInfo;
    }
}
