package com.kgc.house.service;

import com.github.pagehelper.PageInfo;
import com.kgc.house.pojo.Street;
import com.kgc.house.pojo.StreetDis;

import java.util.List;

public interface StreetService1 {
     List<Street> selectAll(Integer districtId);

}
