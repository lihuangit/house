package com.kgc.house.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.house.pojo.Street;
import com.kgc.house.pojo.StreetDis;
import com.kgc.house.service.StreetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class StreetController {
    @Autowired
    private StreetService streetService;
    /**
     * 分页查询全部
     */
   /* @RequestMapping("/selectStreet")
    @ResponseBody
    public Map<String,Object> selectStreet(StreetDis streetDis){
        PageInfo<Street> pageInfo = streetService.selectByExample(streetDis);
        Map<String,Object> map=new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }*/
    @RequestMapping("/selectStreet")
    @ResponseBody
    public Map<String,Object> selectStreet(StreetDis streetDis){
        PageInfo<Street> pageInfo = streetService.selectByExample(streetDis);
        Map<String,Object> map=new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }
    @RequestMapping("/queryAllStreet1")
    @ResponseBody
    public Map<String,Object> queryAllStreet(Integer page,Integer rows){
        PageInfo<Street> pageInfo = streetService.selectByExample1(page,rows);
        Map<String,Object> map=new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }
    @RequestMapping("/addStreet")
    @ResponseBody
    public String addStreet(Street street){

        int i = streetService.insertSelective(street);

        return "{\"result\":"+i+"}";
    }
    @RequestMapping("/upStreet")
    @ResponseBody
    public String upStreet(Street street){
        int i = streetService.updateByPrimaryKeySelective(street);
        return "{\"result\":"+i+"}";
    }
    @RequestMapping("/delStreet")
    @ResponseBody
    public String delStreet(Integer id){


        int i = streetService.deleteByPrimaryKey(id);
        return "{\"result\":"+i+"}";
    }
    @RequestMapping("/delesStreet")
    @ResponseBody
    public String delesStreet(String id){
        String[] split = id.split(",");
        Integer[] ids=new Integer[split.length];
       for(int i=0;i<split.length;i++){
           ids[i]=Integer.parseInt(split[i]);
       }
        int temp = streetService.deles(ids);
        return "{\"result\":"+temp+"}";
    }

}
