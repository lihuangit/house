package com.kgc.house.service;

import com.github.pagehelper.PageInfo;
import com.kgc.house.pojo.House;
import com.kgc.house.pojo.PageBean;

import java.util.List;

public interface HouseService {
    int addHouse(House house);
    PageInfo<House> getAll(Integer page, Integer rows, Integer uid);
    House queryOneHouse(String id);
    int updateByPrimaryKeySelective(House record);
   PageInfo<House> noGetAllHouse(Integer page,Integer rows,House house);
    PageInfo<House> getAllHouse(Integer page,Integer rows,House house);
    public int upshHouse(String id);
    int upsHouses(String[] ids);
    int quxiaosh(String id);
    int piliangquxiaosh(String[] ids);
    PageInfo<House>  liuLanHouse(PageBean pageBean);
    public House queryOneByTitle(String id);
    public PageInfo<House> getIsdel(Integer page,Integer rows);
}
