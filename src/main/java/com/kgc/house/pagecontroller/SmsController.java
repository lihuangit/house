package com.kgc.house.pagecontroller;

import com.kgc.house.sms.HttpClientUtil;
import com.kgc.house.sms.SmsUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @program: house
 * @ClassName: SmsController
 * @author: Mr.Li
 * @create: 2019-07-02 18:51
 **/
@Controller
public class SmsController {
    @RequestMapping("/getCode")
    @ResponseBody
    public String getCode(String tel, HttpSession session){
       int v = (int)(Math.random() * 10000);
        String text="您输入的验证码为"+v+"请保管好!";
        session.setAttribute("text",v);
        session.setMaxInactiveInterval(120);
        int i = SmsUtil.sendMsm(tel, text);
        return "{\"result\":"+i+"}";
    }

}
