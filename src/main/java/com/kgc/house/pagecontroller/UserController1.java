package com.kgc.house.pagecontroller;

import com.kgc.house.pojo.Users;
import com.kgc.house.service.UsersService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class UserController1 {
@Autowired
    private UsersService1 usersService1;
@RequestMapping("/selectOne")
@ResponseBody
    public String selectOne(String name){
       int i = usersService1.selectByExample(name);

       return "{\"result\":"+i+"}";
    }
    @RequestMapping("/addUser")

    public String addUser(Users users){
        int i = usersService1.insertSelective(users);
        if(i>0)
            return "login";

            return "error";
    }
    @RequestMapping("/userLogin")

    public String userLogin(String name, String password, Model model, HttpSession session,String inputcode) {
        Users users = usersService1.userLogin(name, password);

        String text = session.getAttribute("text").toString();
        if(inputcode.equals(text)){

            if (users == null) {
                model.addAttribute("info","用户名或密码错误!");
                return "login";
            }else {
                session.setAttribute("user",users);
                session.setMaxInactiveInterval(600);
                return "redirect:getAllHouse";
            }


         }else {
            model.addAttribute("info1","验证码输入错误!");
            return "login";
        }




    }
    @RequestMapping("/userLogin1")

    public String userLogin1(String name, String password, Model model, HttpSession session) {
        Users users = usersService1.userLogin1(name, password);

        if (users == null) {
           session.setAttribute("info1","用户名或密码错误!");
           session.setMaxInactiveInterval(10);
            return "redirect:/admin/jsp/login1.jsp";
        }else {
            session.setAttribute("user1",users);
            session.setMaxInactiveInterval(600);
            return "redirect:/admin/jsp/admin.jsp";
        }



    }

}
