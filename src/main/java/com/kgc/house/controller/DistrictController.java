package com.kgc.house.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.house.pojo.District;
import com.kgc.house.service.DistrictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class DistrictController {
    @Autowired
    private DistrictService districtService;
    @RequestMapping("/getAll")
    @ResponseBody
    public Map<String,Object> getAll(Integer page, Integer rows){

        PageInfo<District> all = districtService.getAll(page, rows);
        Map<String,Object> map=new HashMap<>();
        map.put("total",all.getTotal());
        map.put("rows",all.getList());

        return map;
    }
    @RequestMapping("/add")
    @ResponseBody
    public String add(District district){

        int i = districtService.insertSelective(district);

        return "{\"result\":"+i+"}";

    }
    @RequestMapping("/update")
    @ResponseBody
   public String update(District district){
        System.out.println(district);
        int i = districtService.updateByPrimaryKeySelective(district);
        System.out.println(i);
        return "{\"result\":"+i+"}";
    }
    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(int[] id){

        int i = districtService.deletes(id);

        return "{\"data\":"+i+"}";
    }
    @RequestMapping("/deleteOne")
    @ResponseBody
    public String deleteOne(Integer id){

        int i = districtService.deleteByPrimaryKey(id);

        return "{\"data\":"+i+"}";
    }
}
