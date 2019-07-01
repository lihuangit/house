package com.kgc.house.service.impl;

import com.kgc.house.mapper.UsersMapper;
import com.kgc.house.pojo.Users;
import com.kgc.house.pojo.UsersExample;
import com.kgc.house.service.UsersService1;
import com.kgc.house.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersServiceImpl1 implements UsersService1 {
    @Autowired
  private UsersMapper usersMapper;
    @Override
    public int selectByExample(String name) {
        UsersExample usersExample = new UsersExample();
        UsersExample.Criteria criteria = usersExample.createCriteria();
        criteria.andNameEqualTo(name);
        List<Users> users = usersMapper.selectByExample(usersExample);

        return users.size()==0?0:1;

    }

    @Override
    public int insertSelective(Users record) {
        record.setIsadmin(0);
        String s = MD5Utils.md5Encrypt(record.getPassword());
        record.setPassword(s);
        int i = usersMapper.insertSelective(record);
        return i;
    }

    @Override
    public Users userLogin(String name, String password) {
        UsersExample usersExample = new UsersExample();
        UsersExample.Criteria criteria = usersExample.createCriteria();
        criteria.andIsadminEqualTo(0);
        criteria.andNameEqualTo(name);
        criteria.andPasswordEqualTo(MD5Utils.md5Encrypt(password));
        List<Users> users = usersMapper.selectByExample(usersExample);
        if(users.size()!=0)
           return users.get(0);

         return null;
    }

    @Override
    public Users userLogin1(String name, String password) {
        UsersExample usersExample = new UsersExample();
        UsersExample.Criteria criteria = usersExample.createCriteria();
        criteria.andIsadminEqualTo(1);
        criteria.andNameEqualTo(name);
        criteria.andPasswordEqualTo(MD5Utils.md5Encrypt(password));
        List<Users> users = usersMapper.selectByExample(usersExample);
        if(users.size()!=0)
            return users.get(0);

        return null;
    }
}
