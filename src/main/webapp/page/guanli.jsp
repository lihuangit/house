<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- saved from url=(0050)http://localhost:8080/HouseRent/manage!list.action -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD>
<TITLE>青鸟租房 - 用户管理</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type><LINK 
rel=stylesheet type=text/css href="../css/style.css">

<META name=GENERATOR ></HEAD>
<script type="text/javascript" src="/admin/js/jquery-1.8.3.js"></script>
<script type="text/javascript" >
  function aa(id) {
      window.location="/queryOneHouse?id="+id;
  }
  function bb(id) {
      if(confirm("确定删除吗？")){
         window.location="/delUpHouse?id="+id;
      }
  }
</script>
<BODY>
<DIV id=header class=wrap>
<DIV id=logo><IMG src="../images/logo.gif"></DIV>
<DIV class=search><LABEL class="ui-green searchs"><span>欢迎${user.name}登陆</span>&nbsp;&nbsp;&nbsp;<a href="/queryAll" title="">发布房屋信息</a>&nbsp;&nbsp;&nbsp;<a href="/getAllHouse" title="">管理房屋信息</a></LABEL>
<LABEL class=ui-green><INPUT onclick='document.location="/page/login.jsp"' value="退       出" type=button name=search></LABEL>
</DIV></DIV>

<DIV class="main wrap">
<DIV id=houseArea>
<TABLE class=house-list>
  <TBODY>
  <c:forEach items="${pageInfo.list}" var="p" >
  <TR>
    <TD class=house-thumb><SPAN><A href="/queryOneByTitle?id=${p.id}" target="_blank"><img src="http://localhost:80/${p.path}?<%=Math.random()%>" width="100" height="75" alt=""></A></SPAN></TD>
    <TD>
      <DL>
        <DT><A href="/queryOneByTitle?id=${p.id}" target="_blank">${p.title}</A></DT>
        <DD>${p.dname}区${p.sname}街,房屋类型:${p.tname},${p.floorage}平米<BR>联系方式：${p.contact} </DD></DL></TD>
    <TD class=house-ispass>
      <c:choose>
        <c:when test="${p.ispass==0}">
         <span style="color: green">未审核</span>
        </c:when>
        <c:when test="${p.ispass==1}">
          <span style="color: green">已审核</span>
        </c:when>
      </c:choose>
    </TD>
    <TD class=house-type><LABEL class=ui-green><INPUT onclick="aa(${p.id})" value="修    改" type=button name=search></LABEL></TD>
    <TD class=house-price><LABEL class=ui-green><INPUT id="cl" onclick="bb(${p.id})" value="删    除" type=button name=search></LABEL></TD></TR>
  </c:forEach>

  </TBODY></TABLE></DIV>
<DIV class=pager>
<UL>
  <c:forEach begin="1" end="${pageInfo.pages}" step="1" var="i">
  <LI class=current><A id=widget_338868862 
  href="/getAllHouse?page=${i}"
  parseContent="true" showError="true" targets="houseArea" 
  ajaxAfterValidation="false" validate="false" 
dojoType="struts:BindAnchor">${i}</A>
   </LI>
  </c:forEach>
   </UL><SPAN class=total>${pageInfo.pageNum}/${pageInfo.pages}页</SPAN> </DIV></DIV>
<DIV id=footer class=wrap>
<DL>
  <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
  <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV></BODY></HTML>
