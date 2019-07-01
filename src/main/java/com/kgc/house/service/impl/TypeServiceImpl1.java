package com.kgc.house.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.house.mapper.TypeMapper;
import com.kgc.house.pojo.Type;
import com.kgc.house.pojo.TypeExample;
import com.kgc.house.service.TypeService;
import com.kgc.house.service.TypeService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl1 implements TypeService1 {
    @Autowired
    private TypeMapper typeMapper;



    @Override
    public List<Type> getAll() {
        return typeMapper.selectByExample(new TypeExample());
    }
}
