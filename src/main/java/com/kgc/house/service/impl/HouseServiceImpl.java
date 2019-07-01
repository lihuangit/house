package com.kgc.house.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.house.mapper.HouseMapper;
import com.kgc.house.pojo.House;
import com.kgc.house.pojo.PageBean;
import com.kgc.house.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HouseServiceImpl implements HouseService {
@Autowired
private HouseMapper houseMapper;
    @Override
    /**
     * 发布出租房
     */
    public int addHouse(House house) {
        return houseMapper.insertSelective(house);
    }

    @Override
    /**
     * 查询所有出租房并分页
     */
    public PageInfo<House> getAll(Integer page, Integer rows, Integer uid) {

        Integer isdel=0;
        PageHelper.startPage(page,rows);

        List<House> all = houseMapper.getAll(uid,isdel);
        PageInfo<House> pageInfo=new PageInfo<>(all);
        return pageInfo;
    }

    @Override
    /**
     * 查询单条出租房
     */
    public House queryOneHouse(String id) {
        return houseMapper.queryOneHouse(id);
    }

    @Override
    /**
     * 修改出租房
     */
    public int updateByPrimaryKeySelective(House record) {
        return houseMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    /**
     * 查询未通过审核的出租房
     */
    public PageInfo<House> noGetAllHouse(Integer page, Integer rows,House house) {
        PageHelper.startPage(page,rows);
        List<House> houses = houseMapper.noGetAllHouse(house);

        PageInfo<House> pageInfo=new PageInfo<>(houses);

        return pageInfo;
    }

    @Override
    /**
     * 查询审核的租出房
     */
    public PageInfo<House> getAllHouse(Integer page, Integer rows,House house) {
        PageHelper.startPage(page,rows);
        List<House> houses = houseMapper.shHouse(house);
        PageInfo<House> pageInfo=new PageInfo<>(houses);

        return pageInfo;
    }
    /**
     * 通过审核出租房
     */
    @Override
    public int upshHouse(String id){
        House house=new House();
        house.setId(id);
        house.setIspass(1);
      return   houseMapper.updateByPrimaryKeySelective(house);
    }

    /**
     * 批量通过审核
     * @param ids
     * @return
     */
    @Override
    public int upsHouses(String[] ids) {
        return houseMapper.upsHouses(ids);
    }

    /**
     * 取消审核
     * @param id
     * @return
     */
    @Override
    public int quxiaosh(String id) {
        House house=new House();
        house.setIspass(0);
        house.setId(id);
        return houseMapper.updateByPrimaryKeySelective(house);
    }

    /**
     * 批量取消审核
     * @param ids
     * @return
     */
    @Override
    public int piliangquxiaosh(String[] ids) {
        return houseMapper.piliangquxiaosh(ids);
    }
/**
 * @author lh
 * @date 2019/6/29 19:04
 * @param
 * @return
 * 浏览用户查询出租房
 */
    @Override
    public PageInfo<House> liuLanHouse(PageBean pageBean) {
        PageHelper.startPage(pageBean.getPageNum()==null?1:pageBean.getPageNum(),pageBean.getPageSize());
        List<House> houses = houseMapper.liuLanHouse(pageBean);
        PageInfo<House> pageInfo=new PageInfo<>(houses);
        return pageInfo;
    }

    @Override
    public House queryOneByTitle(String id) {
        return houseMapper.queryOneByTitle(id);
    }

    @Override
    /**
     * 查询已删除的房子
     */
    public PageInfo<House> getIsdel(Integer page,Integer rows) {
        PageHelper.startPage(page,rows);
        List<House> isdel = houseMapper.getIsdel();
        PageInfo<House> pageInfo=new PageInfo<>(isdel);

        return pageInfo;
    }

}
