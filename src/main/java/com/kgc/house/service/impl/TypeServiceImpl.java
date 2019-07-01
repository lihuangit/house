package com.kgc.house.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.house.mapper.TypeMapper;
import com.kgc.house.pojo.Type;
import com.kgc.house.pojo.TypeExample;
import com.kgc.house.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    private TypeMapper typeMapper;
    @Override
    public int deleteByPrimaryKey(Integer[] id) {
        return typeMapper.deletes(id);
    }

    @Override
    public int insert(Type record) {
        return 0;
    }

    @Override
    public int insertSelective(Type record) {
        return typeMapper.insertSelective(record);
    }

    @Override
    public PageInfo<Type> getAll(Integer page, Integer rows) {
        PageHelper.startPage(page,rows);
        TypeExample typeExample = new TypeExample();
        List<Type> types = typeMapper.selectByExample(typeExample);
        PageInfo<Type> pageInfo=new PageInfo<>(types);
        return pageInfo;
    }




    @Override
    public Type selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Type record) {
        return typeMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Type record) {
        return 0;
    }

    @Override
    public int deleteByPrimaryKey1(Integer id) {
        return typeMapper.deleteByPrimaryKey(id);
    }
}
