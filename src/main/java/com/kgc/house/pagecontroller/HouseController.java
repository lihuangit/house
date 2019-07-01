package com.kgc.house.pagecontroller;

import com.github.pagehelper.PageInfo;
import com.kgc.house.mapper.HouseMapper;
import com.kgc.house.pojo.*;
import com.kgc.house.service.DistrictService1;
import com.kgc.house.service.HouseService;
import com.kgc.house.service.StreetService1;
import com.kgc.house.service.TypeService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class HouseController {
    @Autowired
    private DistrictService1 districtService1;
    @Autowired
    private StreetService1 streetService1;
    @Autowired
    private TypeService1 typeService1;
    @Autowired
    private HouseService houseService;
    @RequestMapping("/queryAll")

    public String getAll(Model model){

        List<District> all = districtService1.getAll();

        List<Type> alls = typeService1.getAll();
         model.addAttribute("types",alls);
         model.addAttribute("dis",all);
         return "fabu";

    }

    @RequestMapping("/selectAll")
    @ResponseBody

    public List<Street> selectStreet(Integer districtId){

        List<Street> streets = streetService1.selectAll(districtId);
        return streets;
    }


    @RequestMapping("/addHouse")

    public String addHouse(House house, @RequestParam(value = "files",required = false) CommonsMultipartFile files, HttpSession session) throws IOException {
       //保存图片到本地磁盘
        String filename = files.getOriginalFilename();
        String f = filename.substring(filename.lastIndexOf("."));
        String s = System.currentTimeMillis() + f;
        File file=new File("e:\\imgs\\"+s);
          files.transferTo(file);

          Users user =(Users) session.getAttribute("user");
          house.setUserId(user.getId());
          house.setIspass(0);
          house.setIsdel(0);
          house.setId(System.currentTimeMillis()+"");
          house.setPath(s);


       if(houseService.addHouse(house)>0){
           return "redirect:/page/guanli.jsp" ;
       }else {
           file.delete();
           return "redirect:/page/error.jsp";
       }



    }
    @RequestMapping("/getAllHouse")
    public String getAllHouse(Integer page,HttpSession session,Model model){
        Users user =(Users) session.getAttribute("user");

        PageInfo<House> pageInfo = houseService.getAll(page == null ? 1 : page, 2, user.getId());
        model.addAttribute("pageInfo",pageInfo);
        return "guanli";
    }
    /**
     * @author lh
     * @date 2019/6/26 18:59
     * @param
     * @return
     */
  @RequestMapping("/queryOneHouse")
   public String queryOneHouse(String id,Model model){
      List<District> all = districtService1.getAll();

      List<Type> alls = typeService1.getAll();
      model.addAttribute("types",alls);
      model.addAttribute("dis",all);
      House house = houseService.queryOneHouse(id);
      model.addAttribute("h",house);
      return "upfabu";
  }
    @RequestMapping("/upOneHouse")
    public String upOneHouse(House house,Model model,@RequestParam(value= "files",required = false) CommonsMultipartFile files,String oldpath) throws IOException {
        File file=null;
        if(files.getOriginalFilename()==null||files.getOriginalFilename().equals("")){


        }else {
           file=new File("e:/imgs/"+oldpath);
           files.transferTo(file);
           house.setPath(oldpath);
        }
        if ( houseService.updateByPrimaryKeySelective(house)<=0) {
            file.delete();
        }

        return "redirect:getAllHouse";
    }
       @RequestMapping("/delUpHouse")
    public String delUpHouse(String id){
               House house=new House();
               house.setId(id);
               house.setIsdel(1);

               houseService.updateByPrimaryKeySelective(house);
               return "redirect:getAllHouse";
       }
       /**查询未审核的房屋
        * @author lh
        * @date 2019/6/28 17:07
        * @param
        * @return
        */
       @RequestMapping("/noGetAllHouse")
       @ResponseBody
       /**
        * 查询未通过审核的出租房
        */
       public Map<String,Object> noGetAllHouse(Integer page,Integer rows,House house){
           PageInfo<House> pageInfo = houseService.noGetAllHouse(page, rows,house);

           Map<String,Object> map=new HashMap<>();
           map.put("total",pageInfo.getTotal());
           map.put("rows",pageInfo.getList());
           return map;
       }
    @RequestMapping("/getAllHousesh")
    @ResponseBody
    /**
     * 查询通过审核的出租房
     */
    public Map<String,Object> getAllHouse(Integer page,Integer rows,House house){
        PageInfo<House> pageInfo = houseService.getAllHouse(page, rows,house);
        Map<String,Object> map=new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("rows",pageInfo.getList());
        return map;
    }
    /**
     * 通过审核出租房
     */
    @RequestMapping("/upshHouse")
    @ResponseBody
    public String upshHouse(String id){
        int i = houseService.upshHouse(id);
        return "{\"result\":"+i+"}";

    }
    /**
     * 批量审核
     */
    @RequestMapping("/upsHouses")
    @ResponseBody
    public String upsHouses(String ids){
        String[] split = ids.split(",");
        int i = houseService.upsHouses(split);
        return "{\"result\":"+i+"}";
    }

    /**
     * 取消审核
     * @param id
     * @return
     */
    @RequestMapping("/quxiaosh")
    @ResponseBody
    public String quxiaosh(String id){
        int i = houseService.quxiaosh(id);
        return "{\"result\":"+i+"}";
    }
    /**
     * 批量审核
     */
    @RequestMapping("/piliangquxiaosh")
    @ResponseBody
    public String piliangquxiaosh(String ids){
        String[] split = ids.split(",");
        int i = houseService.piliangquxiaosh(split);
        return "{\"result\":"+i+"}";
    }

    /**
     * 查询街道和类型
     * @return
     */
    @RequestMapping("/selects")
    @ResponseBody
    public Map<String,Object> selects(){
        List<District> all = districtService1.getAll();
        List<Type> all1 = typeService1.getAll();
        Map<String,Object> map=new HashMap<>();
        map.put("ds",all);
        map.put("ts",all1);
        return map;
    }

    /**
     * 通过区域ID查询街道
     * @param districtId
     * @return
     */
    @RequestMapping("/selectAll1")
    @ResponseBody

    public List<Street> selectStreet1(Integer districtId){

        List<Street> streets = streetService1.selectAll(districtId);
        return streets;
    }

    /**浏览用户查询出租房
     * @author lh
     * @date 2019/6/29 18:57
     * @param
     * @return
     */
    @RequestMapping("/liuLanHouse")
    public String liuLanHouse(Model model,PageBean pageBean){

        PageInfo<House> pageInfo = houseService.liuLanHouse(pageBean);
        model.addAttribute("page",pageInfo);
        model.addAttribute("p",pageBean);

        return "list";
    }

    /**
     * 通过id查询单条
     * @param id
     * @return
     */
    @RequestMapping("/queryOneByTitle")

    public String queryOneByTitle(String id,Model model){
        House house = houseService.queryOneByTitle(id);
        model.addAttribute("h",house);
        return"details";
    }

    /**
     * 查询已删除的房屋
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/getIsdel")
    @ResponseBody
    public Map<String,Object> getIsdel(Integer page,Integer rows){
        PageInfo<House> isdel = houseService.getIsdel(page, rows);
        Map<String,Object> map=new HashMap<>();
        map.put("rows",isdel.getList());
        map.put("total",isdel.getTotal());
        return map;
    }

}
