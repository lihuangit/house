<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%
  /*防盗链(翻墙)*/
  Object user = session.getAttribute("user");
  if(user==null){
    out.print("<script type=\"text/javascript\">alert(\"你还没有登陆无法查询\")\n" +
            "location.href=\"login.jsp\"\n" +
            "</script>");
  }
%>--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0044)http://localhost:8080/HouseRent/page/add.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>青鸟租房 -发布房屋信息</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type><LINK 
rel=stylesheet type=text/css href="../css/style.css">
<META name=GENERATOR content="MSHTML 8.00.7601.17514"></HEAD>
<script type="text/javascript" src="../admin/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
    $(function () {
        $.post("/selects",null,function (data) {

            var ds = data.ds;
            var ts = data.ts;
            for(var i=0;i<ds.length;i++){
                var option = $("<option value='"+ds[i].id+"'>"+ds[i].name+"</option>");
                $("#d").append(option)
            }

            for(var i=0;i<ts.length;i++){
                var option = $("<option value='"+ts[i].id+"'>"+ts[i].name+"</option>");
                $("#t").append(option)
            }

            if( $("#d").val(${p.districtId})!=null&& $("#d").val(${p.districtId})!=''){

                $("#d").val(${p.districtId})
                $.post("/selectAll1",{"districtId":$("#d").val()},function (data) {
                    for(var i=0;i<data.length;i++){
                        var option = $("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                        $("#s").append(option);
                    }

                    $("#s").val(${p.streetId})

                },"json")
            }
            $("#t").val(${p.typeId})

        },"json")
        $("#d").change(function () {

            if( $("#d").val()!=null&& $("#d").val()!=""){

                var ops = $("#s>option");
                for(var i=1;i<ops.length;i++){
                    ops[i].remove()
                }
                $.post("/selectAll1",{"districtId":$("#d").val()},function (data) {
                    for(var i=0;i<data.length;i++){
                        var option = $("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                        $("#s").append(option);
                    }

                    $("#s").val(${p.streetId})

                },"json")

            }else {
                $("#s").val("")
            }

        })



    })
</script>
<BODY>

<DIV id=header class=wrap>
<DIV id=logo><IMG src="../images/logo.gif"></DIV>
<DIV class=search>
<FORM method=get><INPUT class=text type=text name=keywords>
 <LABEL class="ui-green searchs"><a href="list.jsp" target="_blank">搜索房屋</a></LABEL>
</FORM></DIV></DIV>
<DIV id=navbar class=wrap>
<DL class="search clearfix">
  <form id="for" method="post" action="/liuLanHouse">
    标题: <input type="text" name="title" value="${p.title}">&nbsp;&nbsp;价格:<input type="text" name="priceFrom" value="${p.priceFrom}">-<input type="text" name="priceTo" value="${p.priceTo}">&nbsp;&nbsp;
    面积:<input type="text" name="floorageFrom" value="${p.floorageFrom}">-<input type="text" name="floorageTo" value="${p.floorageTo}"><br>
    区域:<select name="districtId" id="d"><option value="">请选择</option></select>&nbsp;&nbsp;街道:<select name="streetId" id="s" ><option value="">请选择</option></select>&nbsp;&nbsp;
    类型:<select name="typeId" id="t"><option value="">请选择</option></select>
    <input type="hidden"  id="h" name="1">
    <input type="submit" value="搜索">
  </form>
</DL></DIV>
<DIV id=position class=wrap>当前位置：青鸟租房网 - 浏览房源</DIV>
<DIV id=view class="main wrap">
<DIV class=intro>
<DIV class=lefter>
<H1>${h.title}</H1>
<DIV class=subinfo>2013-06-28 14:06:33.0</DIV>
<DIV class=houseinfo>
<P>户　　型：<SPAN>${h.tname}</SPAN></P>
<P>面　　积：<SPAN>${h.floorage}m<SUP>2</SUP></SPAN></P>
<P>位　　置：<SPAN>${h.dname}${h.sname}</SPAN></P>
<P>联系方式：<SPAN>${h.contact}</SPAN></P></DIV></DIV>
<DIV class=side>
<P><A class=bold href="http://localhost:8080/House-2/#">北京青鸟房地产经纪公司</A></P>
<P>资质证书：有</P>
<P>内部编号:1000</P>
<P>联 系 人：</P>
<P>联系电话：<SPAN></SPAN></P>
<P>手机号码：<SPAN>暂无</SPAN></P></DIV>
<DIV class=clear></DIV>
<DIV class=introduction>
<H2><SPAN><STRONG>房源详细信息</STRONG></SPAN></H2>
<DIV class=content>
<P>${h.description}</P></DIV></DIV></DIV></DIV>
<DIV id=footer class=wrap>
<DL>
  <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
  <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV>
</BODY>
</HTML>
