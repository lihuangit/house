﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  /*防盗链(翻墙)*/
  Object user = session.getAttribute("user");
  if(user==null){
    out.print("<script type=\"text/javascript\">alert(\"你还没有登陆无法查询\")\n" +
            "location.href=\"login.jsp\"\n" +
            "</script>");
  }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0044)http://localhost:8080/HouseRent/page/add.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>青鸟租房 -发布房屋信息</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type><LINK 
rel=stylesheet type=text/css href="../css/style.css">
<META name=GENERATOR content="MSHTML 8.00.7601.17514"></HEAD>
<script type="text/javascript" src="/admin/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function () {
    if($("#a").val()!=null)
      info($("#a").val())

    $("#a").change(function () {
          var did = $(this).val();

           info(did)

    })
})

function info(did) {

    $.post("/selectAll",{"districtId":did},function (data) {
        $("#c>option").remove();
        for(var i=0;i<data.length;i++){

            var optin = $("<option value="+data[i].id+">"+data[i].name+"</option>");
            $("#c").append(optin)

        }
        $("#c").val(${h.streetId})

    },"json")
}

</script>
<BODY>
<DIV id=header class=wrap>
  <DIV id=logo><IMG src="../images/logo.gif"></DIV>
  <DIV class=search><LABEL class="ui-green searchs"><span>欢迎${user.name}登陆</span>&nbsp;&nbsp;&nbsp;<a href="/queryAll" title="">发布房屋信息</a>&nbsp;&nbsp;&nbsp;<a href="/getAllHouse" title="">管理房屋信息</a></LABEL>
    <LABEL class=ui-green><INPUT onclick='document.location="/page/login.jsp"' value="退       出" type=button name=search></LABEL>
  </DIV></DIV>

<DIV id=regLogin class=wrap>
<DIV class=dialog>
<DL class=clearfix>
  <DT>新房屋信息发布</DT>
  <DD class=past>填写房屋信息</DD></DL>
<DIV class=box>
<FORM id=add_action method=post name=add.action 
action=/upOneHouse  enctype="multipart/form-data">
<DIV class=infos>
<TABLE class=field>
  <TBODY>

  <TR>
    <TD class=field>标　　题：</TD>
    <TD><INPUT id=add_action_title class=text type=text name=title value="${h.title}"><input type="hidden" name="id" value="${h.id}"> </TD></TR>

  <TR>
    <TD class=field>户　　型：</TD>
    <TD><SELECT class=text name=typeId>
      <c:forEach items="${types}" var="t">
        <option <c:if test="${t.id==h.typeId}">selected="selected"</c:if> value=${t.id}>${t.name}</option>
      </c:forEach>
       </SELECT></TD></TR>
  <TR>
    <TD class=field>面　　积：</TD>
    <TD><INPUT id=add_action_floorage class=text type=text value="${h.floorage}"
name=floorage></TD></TR>
  <TR>
    <TD class=field>价　　格：</TD>
    <TD><INPUT id=add_action_price class=text type=text name=price value="${h.price}"> </TD></TR>
  <TR>
    <TD class=field>发布日期：</TD>
    <TD><INPUT class=text type=date name=pubdate value="<f:formatDate value="${h.pubdate}" pattern="yyyy-MM-dd"></f:formatDate>"></TD></TR>
  <TR>
    <TD class=field>位　　置：</TD>
    <TD>区：<SELECT class=text name=districtId id="a">


      <c:forEach items="${dis}" var="d">
      <option <c:if test="${d.id==h.districtId}">selected="selected"</c:if> value="${d.id}" >${d.name}</option>
      </c:forEach>
    </SELECT> 街：<span ><select id="c" name="streetId"></select></span> </TD></TR>
  <TR>
    <TD class=field>图片：<img src="http://localhost:80/${h.path}?a=<%=Math.random()%>" width="100px"/> </TD>

    <TD><INPUT class=text type=hidden name=oldpath value="${h.path}"><INPUT class=text type=file name=files></TD></TR>
  <TR>
    <TD class=field>联系方式：</TD>
    <TD><INPUT id=add_action_contact class=text type=text name=contact value="${h.contact}"> </TD></TR>
  <TR>
    <TD class=field>详细信息：</TD>
    <TD><TEXTAREA name=description>${h.description}</TEXTAREA></TD></TR></TBODY></TABLE>
<DIV class=buttons><INPUT  value=立即修改 type=submit>
</DIV></DIV></FORM></DIV></DIV></DIV>
<DIV id=footer class=wrap>
<DL>
  <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
  <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV></BODY></HTML>
