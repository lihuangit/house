package com.kgc.house.mapper;

import com.kgc.house.pojo.House;
import com.kgc.house.pojo.HouseExample;
import com.kgc.house.pojo.PageBean;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface HouseMapper {
    int deleteByPrimaryKey(String id);

    int insert(House record);

    int insertSelective(House record);

    List<House> selectByExample(HouseExample example);

    House selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(House record);

    int updateByPrimaryKey(House record);
    List<House> getAll( Integer uid,Integer isdel);
    House queryOneHouse(String id);
    //查询用户为审核的房屋信息
    List<House> noGetAllHouse(House house);
    List<House> shHouse(House house);
    int upsHouses(String[] ids);
    int piliangquxiaosh(String[] ids);
    /**浏览用户查询出租房
     * @author lh
     * @date 2019/6/29 18:57
     * @param
     * @return
     */
    List<House> liuLanHouse(PageBean pageBean);
    public House queryOneByTitle(String id);
    public List<House> getIsdel();

}