<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2019/6/18
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /*防盗链(翻墙)*/
    Object user = session.getAttribute("user1");
    if(user==null){
        out.print("<script type=\"text/javascript\">alert(\"你还没有登陆无法查询\")\n" +
                "location.href=\"login1.jsp\"\n" +
                "</script>");
    }
%>
<html>
<head>
    <title>Title</title>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../easyUI/css/demo.css">
    <script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
    <!--jquery.easyui.min.js包含了easyUI中的所有插件-->
    <script src="../js/jquery.easyui.min.js" type="text/javascript"></script>
</head>
<script type="text/javascript" src="../js/type.js">

</script>
<body>
<table id="dg"></table>
<div id="ToolBar">
    <div style="height: 40px;">
        <a href="javascript:Add()" class="easyui-linkbutton"
           iconCls="icon-add" plain="true">添加</a> <a
            href="javascript:update1()" class="easyui-linkbutton"
            iconCls="icon-edit" plain="true">修改</a> <a
            href="javascript:delete1()" class="easyui-linkbutton"
            iconCls="icon-remove" plain="true">删除</a>
    </div>
</div>
<div id="add" class="easyui-dialog" buttons="#add1"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">
    <form id="add2" method="post">
        <table>

            <tr>
                <td>房屋类型:</td>

                <td><input type="text" name="name" id="author" /></td>
            </tr>
        </table>
    </form>
</div>
<div id="add1">
    <a href="javascript:save()" class="easyui-linkbutton"
       iconCls="icon-ok">添加</a>
    <a href="javascript:close1('add')"
       class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>
<div id="upType" class="easyui-dialog" buttons="#upType3"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">
    <form id="upType1" method="post">
        <table>

            <tr>
                <td>房屋类型:</td>
                <td><input type="hidden" name="id" id="author2" /></td>
                <td><input type="text" name="name" id="author1" /></td>
            </tr>
        </table>
    </form>
</div>
<div id="upType3">
    <a href="javascript:upType()" class="easyui-linkbutton"
       iconCls="icon-ok">修改</a>
    <a href="javascript:close1('upType')"
       class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>
</body>
</html>
