<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- saved from url=(0030)http://localhost:8080/House-2/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>青鸟租房 - 首页</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="../css/style.css">
<META name=GENERATOR content="MSHTML 8.00.7601.17514"></HEAD>
<script type="text/javascript" src="../admin/js/jquery-1.8.3.js"></script>
<script type="text/javascript" >
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

function aa(num) {
    $("#h").val(num);
    $("#for").submit();
}
</script>
<BODY>
<DIV id=header class=wrap>
<DIV id=logo><IMG src="../images/logo.gif"></DIV></DIV>
<DIV id=navbar class=wrap>

  <form id="for" method="post" action="/liuLanHouse">
   标题: <input type="text" name="title" value="${p.title}">&nbsp;&nbsp;价格:<input type="text" name="priceFrom" value="${p.priceFrom}">-<input type="text" name="priceTo" value="${p.priceTo}">&nbsp;&nbsp;
    面积:<input type="text" name="floorageFrom" value="${p.floorageFrom}">-<input type="text" name="floorageTo" value="${p.floorageTo}"><br>
    区域:<select name="districtId" id="d"><option value="">请选择</option></select>&nbsp;&nbsp;街道:<select name="streetId" id="s" ><option value="">请选择</option></select>&nbsp;&nbsp;
    类型:<select name="typeId" id="t"><option value="">请选择</option></select>
      <input type="hidden"  id="h" name="pageNum">
    <input type="submit" value="搜索">
  </form>
<DIV class="main wrap">
<TABLE class=house-list>
  <TBODY>
  <c:forEach items="${page.list}" var="p">


  <TR>
    <TD class=house-thumb><span><A href="details.jsp" target="_blank"><img src="http://localhost:80/${p.path}" width="100" height="75" ></a></span></TD>
    <TD>
      <DL>
        <DT><A href="/queryOneByTitle?id=${p.id}" target="_blank">${p.title}</A></DT>
        <DD>${p.dname}${p.sname}${p.floorage}平米<BR>联系方式：${p.contact} </DD></DL></TD>
    <TD class=house-type>${p.tname}</TD>
    <TD class=house-price><SPAN>${p.price}</SPAN>元/月</TD></TR>
  </c:forEach>
  </TBODY></TABLE>
<DIV class=pager>
<UL>
  <LI class=current><A href="javascript:aa(1)">首页</A></LI>
  <LI><A href="javascript:aa(${page.prePage==0?1:page.prePage})">上一页</A></LI>
  <LI><A href="javascript:aa(${page.nextPage==0?page.pages:page.nextPage})">下一页</A></LI>
  <LI><A href="javascript:aa(${page.pages})">末页</A></LI></UL><SPAN
class=total>${page.pageNum}/${page.pages}页</SPAN> </DIV></DIV>
<DIV id=footer class=wrap>
<DL>
  <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
  <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV></BODY></HTML>
