package com.kgc.house.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.house.pojo.Type;
import com.kgc.house.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class TypeController {
    @Autowired
    private TypeService typeService;
    //查询全部
    @RequestMapping("/getAllType")
    @ResponseBody
    public Map<String,Object> getAll(Integer page,Integer rows){
        PageInfo<Type> all = typeService.getAll(page, rows);

        Map<String,Object> map=new HashMap<>();
        map.put("total",all.getTotal());
        map.put("rows",all.getList());
        return map;
    }
    //添加
    @RequestMapping("/addType")
    @ResponseBody
    public String addType(Type type){
        int i = typeService.insertSelective(type);

        return "{\"result\":"+i+"}";
    }
    //修改
    @RequestMapping("/updateType")
    @ResponseBody
    public String updateType(Type type){
        int i = typeService.updateByPrimaryKeySelective(type);
        return "{\"result\":"+i+"}";
    }
    //删除
    @RequestMapping("/deletes1")
    @ResponseBody
    public String deletes(Integer[] id){
        int i = typeService.deleteByPrimaryKey(id);
        return "{\"result\":"+i+"}";
    }
    //删除
    @RequestMapping("/deleteOne3")
    @ResponseBody
    public String deleteOne3(Integer id){
        int i = typeService.deleteByPrimaryKey1(id);
        return "{\"result\":"+i+"}";
    }
}
