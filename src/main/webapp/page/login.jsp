<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0032)http://localhost:8080/HouseRent/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>青鸟租房 - 用户登录</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type><LINK 
rel=stylesheet type=text/css href="../css/style.css">
<META name=GENERATOR content="MSHTML 8.00.7601.17514"></HEAD>
<script type="text/javascript" src="/admin/js/jquery-1.8.3.js"></script>
<script type="text/javascript">

  $(function () {
      $("#but").click(function () {
          window.location="regs.jsp";
      })
  })
  $(function () {
      $("#butn").click(function () {
          $.post("/getCode",{"tel":$("#tel").val()},function (data) {
              if(data.result>0){
                  alert("获取验证码成功!请查看手机")
              }else {
                  alert("获取验证码失败!")
              }
          },"json")
      })
  })
</script>

<BODY>
<DIV id=header class=wrap>
<DIV id=logo><IMG src="../images/logo.gif"></DIV></DIV>
<DIV id=regLogin class=wrap>
<DIV class=dialog>
<DIV class=box>
<H4>用户登录</H4>
<FORM id=user method=post name=user action=/userLogin>
<DIV class=infos>
<TABLE class=field>
  <TBODY>
  <TR>
    <TD colSpan=2></TD></TR>
  <TR>
    <TD class=field>用 户 名：</TD>
    <TD><!-- <input type="text" class="text" name="name" /> --><INPUT 
      id=username class=text type=text name=name> </TD></TR>
  <TR>
    <TD class=field>密　　码：</TD>
    <TD><!-- <input type="password" class="text" name="password" /> --><INPUT 
      id=userpassword class=text type=password name=password><br><span> <h3 style="color: red">${info}</h3></span> </TD></TR>
  <tr>
    <td colspan="2" align="left">请输入手机号码:<input type="text" name="tel" id="tel"><input type="button" id="butn" value="获取验证码"></td>
  </tr>
  <tr>
    <td colspan="2" align="left">请输入验证码:<input type="text" name="inputcode"><br><span> <h3 style="color: red">${info1}</h3></span></td>
  </tr>
	<tr>
      <td colspan="2" align="center"><div ><a href="../admin/jsp/login1.jsp">管理用户登录</a></div></td>
    </tr>

  </TBODY></TABLE>
<DIV class=buttons> <INPUT id="but1" value=登陆 type="submit"> <INPUT id="but" value=注册 type=button>
</DIV></DIV></FORM></DIV></DIV></DIV>
<DIV id=footer class=wrap>
<DL>
  <DT>青鸟租房 © 2018 北大青鸟 京ICP证1000001号</DT>
  <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV></BODY></HTML>
