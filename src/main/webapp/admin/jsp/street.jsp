<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2019/6/19
  Time: 15:08
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
    <title>街道</title>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../easyUI/css/demo.css">
    <script src="../js/jquery-1.8.3.js" type="text/javascript"></script>
    <!--jquery.easyui.min.js包含了easyUI中的所有插件-->
    <script src="../js/jquery.easyui.min.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
    $(function () {
        $('#dg').datagrid({
            url:'/queryAllStreet1',
            fitColumns: true,
            pagination: true,
            pageList: [5, 10, 15, 20],
            toolbar:"#ToolBar",
            //singleSelect:true,  //只能设置单选
            pageSize:5,
            columns: [[
                {field:'ck',checkbox:true},  //复选框列
                { field: 'id', title: '编号', width: 50, align: "center" },
                { field: 'name', title: '街道名', width: 50, align: "center" },

                { field: 'district', title: '区域', width: 50, align: "center" ,formatter:
                        function(value,row,index){
                           return value.name
                        }},
                { field: 'caozuo', title: '操作', width: 50, align: "center",formatter:
                        function(value,row,index){
                            return "<a href='javascript:deleOneStreet("+row.id+")'>删除</a>"
                        }
                }
            ]]
        });
    });
    function close1(s) {
        $("#"+s).dialog("close");
    }
function Add() {
    $("#add").dialog("open").dialog("setTitle","添加");
}
function save() {
    $("#add2").form('submit',{
      url:"/addStreet",
        success:function (data) {
          var p = $.parseJSON(data);
            if(p.result>0){
                $("#add").dialog("close");
                $("#dg").datagrid("reload");
                $.messager.alert("提示框","添加成功")
            }else {
                $.messager.alert("提示框","添加失败")
            }
        }


    })
}
function update1() {
    var SelectRows = $("#dg").datagrid('getSelections');
    if(SelectRows.length!=1){
        $.messager.alert("提示框",'你没有选择或者选择了多行');
        return;
    }
    var selectRow = SelectRows[0];
    $("#up").dialog("open").dialog("setTitle","修改");
    $("#up1").form('load',selectRow);
}
function up1() {
    $("#up1").form('submit',{
        url:"/upStreet",
        success:function (data) {
            var p = $.parseJSON(data);
            if(p.result>0){
                $("#up").dialog("close");
                $("#dg").datagrid("reload");
                $.messager.alert("提示框","修改成功")
            }else{
                $.messager.alert("提示框","修改失败")
            }
        }
    })
}
function deleOneStreet(id) {
   $.messager.confirm("提示框","确定删除吗？",function (xo) {
       if(xo){
           $.post("/delStreet",{"id":id},function (data) {
              if(data.result>0){

                  $("#dg").datagrid("reload");
                  $.messager.alert("提示框","删除成功")
              }
           },"json")
       }
   })

}
function delete1() {
    var SelectRows = $("#dg").datagrid('getSelections');
    if(SelectRows.length==0){
        $.messager.alert("提示框",'请选择要删除的行!');
        return;
    }
    var idss="";
    for (var i=0;i<SelectRows.length;i++){
        idss=idss+SelectRows[i].id+","
    }
   var s = idss.substring(0,idss.length-1);
    $.messager.confirm("提示框","确定删除"+SelectRows.length+"条吗！",function (xo) {
        if(xo){
            $.post("/delesStreet",{"id":s},function (data) {
                if(data.result>0){
                    $("#dg").datagrid("reload");
                    $.messager.alert("提示框",'删除成功!')
                }
            },"json")
        }
    })

}
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
                <td>街道:</td>

                <td><input type="text" name="name" id="a" /></td>
            </tr>
            <tr>
                <td>区域:</td>

                <td><input type="text" name="districtId" id="a1" /></td>
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
<div id="up" class="easyui-dialog" buttons="#up2"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">
    <form id="up1" method="post">
        <table>
            <tr>
                <td><input type="hidden" name="id" id="aaaaa" /></td>
            </tr>

            <tr>

                <td>街道:</td>

                <td><input type="text" name="name" id="aaa" /></td>
            </tr>
            <tr>
                <td>区域:</td>

                <td><input type="text" name="districtId" id="aaaa" /></td>
            </tr>
        </table>
    </form>
</div>
<div id="up2">
    <a href="javascript:up1()" class="easyui-linkbutton"
       iconCls="icon-ok">修改</a>
    <a href="javascript:close1('up')"
       class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>
</body>
</html>
