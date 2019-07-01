package com.kgc.house.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.house.mapper.StreetMapper;
import com.kgc.house.pojo.Street;
import com.kgc.house.pojo.StreetDis;
import com.kgc.house.pojo.StreetExample;
import com.kgc.house.service.StreetService;
import com.kgc.house.service.StreetService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StreetServiceImpl1 implements StreetService1 {
    @Autowired
    private StreetMapper streetMapper;

    @Override
    public List<Street> selectAll(Integer districtId) {
        StreetExample streetExample = new StreetExample();
        StreetExample.Criteria criteria = streetExample.createCriteria();
        criteria.andDistrictIdEqualTo(districtId);
        List<Street> streets = streetMapper.selectByExample(streetExample);
        return streets;
    }
}
