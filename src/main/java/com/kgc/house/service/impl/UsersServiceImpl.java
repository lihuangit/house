package com.kgc.house.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kgc.house.mapper.UsersMapper;
import com.kgc.house.pojo.Users;
import com.kgc.house.pojo.UsersExample;
import com.kgc.house.pojo.UsersPage;
import com.kgc.house.service.UsersService;
import com.kgc.house.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {
    @Autowired
  private UsersMapper usersMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return usersMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Users record) {
        return 0;
    }

    @Override
    public int insertSelective(Users record) {
        return usersMapper.insertSelective(record);
    }

    @Override
    public PageInfo<Users> selectByExample(UsersPage usersPage) {
        PageHelper.startPage(usersPage.getPage(),usersPage.getRows());
        UsersExample usersExample = new UsersExample();
        UsersExample.Criteria criteria = usersExample.createCriteria();
        criteria.andIsadminEqualTo(1);
        if (usersPage.getName()!=null)
            criteria.andNameLike("%"+usersPage.getName()+"%");
        if(usersPage.getTelePhone()!=null)
            criteria.andTelephoneLike("%"+usersPage.getTelePhone()+"%");
        List<Users> users = usersMapper.selectByExample(usersExample);
        PageInfo<Users> pageInfo=new PageInfo<>(users);
        return pageInfo;
    }

    @Override
    public Users selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Users record) {
        String s = MD5Utils.md5Encrypt(record.getPassword());
        record.setPassword(s);

        return usersMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Users record) {
        return 0;
    }

    @Override
    public int deles(Integer[] id) {
        return usersMapper.deles(id);
    }
}
