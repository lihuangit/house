package com.kgc.house.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.house.pojo.Users;
import com.kgc.house.pojo.UsersPage;
import com.kgc.house.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    UsersService usersService;
    //条件查询
    @RequestMapping("/queryAllUsers")
    @ResponseBody
    public Map<String,Object> queryAllUsers(UsersPage usersPage){
        PageInfo<Users> pageInfo = usersService.selectByExample(usersPage);
        Map<String,Object> map=new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }
    @RequestMapping("/addUsers")
    //添加
    @ResponseBody
    public String addUsers(Users users){
        int i = usersService.insertSelective(users);

        return "{\"result\":"+i+"}" ;
    }
    @RequestMapping("/deleteUsers")
    //单条删除
    @ResponseBody
    public String deleteUsers(Integer id){
        int i = usersService.deleteByPrimaryKey(id);

        return "{\"result\":"+i+"}" ;
    }
    @RequestMapping("/updateUsers")
    //修改
    @ResponseBody
    public String updateUsers(Users users){
        int i = usersService.updateByPrimaryKeySelective(users);

        return "{\"result\":"+i+"}" ;
    }
    @RequestMapping("/delesUsers")
    //修改
    @ResponseBody
    public String delesUsers(String ids){
        String[] split = ids.split(",");
        Integer[] integers = new Integer[split.length];
        for(int i=0;i<split.length;i++){
            integers[i]=Integer.parseInt(split[i]);
        }
        int i = usersService.deles(integers);
        return "{\"result\":"+i+"}" ;
    }
    @RequestMapping("/updateUsers1")
    //修改
    @ResponseBody
    public String updateUsers1(Users users){
        System.out.println(users);
        int i = usersService.updateByPrimaryKeySelective(users);

        return "{\"result\":"+i+"}" ;
    }
}
