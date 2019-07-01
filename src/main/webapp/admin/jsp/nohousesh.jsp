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
<script type="text/javascript" >
    $.post("/selects",function (data) {

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



    },"json")

    $(function () {


        if( $("#d").val()!=null&& $("#d").val()!=""){
            aa($("#d").val())
        }
        $("#d").change(function () {
            if( $("#d").val()!=null&& $("#d").val()!=""){
                var val = $("#d").val();
                var ops = $("#s>option");
                for(var i=1;i<ops.length;i++){
                    ops[i].remove()
                }
                aa(val)
            }else {
                $("#s").val("")
            }

        })
    })
    function aa(val){
        $.post("/selectAll1",{"districtId":val},function (data) {
            for(var i=0;i<data.length;i++){
                var option = $("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                $("#s").append(option);
            }
        },"json")
    }
    $(function () {
        $('#dg').datagrid({
            url:'/noGetAllHouse',
            fitColumns: true,
            pagination: true,
            pageList: [5, 10, 15, 20],
            toolbar:"#ToolBar",
            // singleSelect:true,  //只能设置单选
            pageSize:5,
            columns: [[
                {field:'ck',checkbox:true},  //复选框列
                { field: 'id', title: '编号', width: 50, align: "center" },
                { field: 'title', title: '标题', width: 50, align: "center" },
                { field: 'price', title: '价格', width: 50, align: "center" },
                { field: 'dname', title: '区域', width: 50, align: "center" },
                { field: 'sname', title: '街道', width: 50, align: "center" },
                { field: 'tname', title: '房屋类型', width: 50, align: "center" },
                { field: 'pubdate', title: '发布时间', width: 50, align: "center",formatter:
                        function(value,row,index){
                            var date=new Date(value);
                            var year=date.getFullYear();
                            var moneth=date.getMonth()+1;
                            var day=date.getDate();

                            return year+"年"+moneth+"月"+day+"日";

                        } },
                { field: 'ispass', title: '状态', width: 50, align: "center",formatter:
                        function(value,row,index){
                            return"未审核";
                        } },
                { field: 'caozuo', title: '操作', width: 50, align: "center",formatter:
                        function(value,row,index){
                            return "<a href='javascript:upshHouse1("+row.id+")'>通过审核</a>"
                        }
                }
            ]]
        });
    });

    function upshHouse1(id) {

        $.post("/upshHouse",{"id":id},function (data) {
            if(data.result>0){
                $.messager.alert("提示框","审核成功")
                $("#dg").datagrid("reload");
            }else {
                $.messager.alert("提示框","审核失败")
            }

        },"json")
    }

    function sousuo() {
        var tel = $("#tel").val();
        var name = $("#name").val();
        $("#dg").datagrid("load",{"telePhone":tel,"name":name});
    }
function upHouses() {
    var datagrid = $("#dg").datagrid('getSelections');
    if (datagrid == 0) {
        $.messager.alert("提示框","请选择一行或者多行,谢谢!")
        return
    }
    var str="";
   for(var i=0;i<datagrid.length;i++){
       str=str+datagrid[i].id+","
   }
   str=str.substring(0,str.length-1);
  $.post("/upsHouses",{"ids":str},function (data) {
      if (data.result>0){
          $.messager.alert("提示框","批量审核成功!")
          $("#dg").datagrid("reload");
      } else {
          $.messager.alert("提示框","批量审核失败!")
      }
  },"json")

}
function sousuo() {
    var d = $("#d").val();
    var s = $("#s").val();
    var t = $("#t").val();
    var pf = $("#pfrom").val();
    var pt = $("#pto").val();
    $("#dg").datagrid("load",{"districtId":d,"streetId":s,"typeId":t,"pfrom":pf,"pto":pt})

}
</script>

<div>
    区域：<select id="d" name="name">
    <option value="">请选择</option>
</select>

    街道：<select id="s" name="name"><option value="">请选择</option></select>
    类型：<select id="t" name="name"><option value="">请选择</option></select>
    价格：<input type="text" name="pfrom" id="pfrom">-<input type="text" name="pto" id="pto" >
    <a id="btn" href="javascript:sousuo()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
</div>

<table id="dg"></table>
<div id="ToolBar">
    <a
            href="javascript:upHouses()" class="easyui-linkbutton"
            iconCls="icon-remove" plain="true">批量审核</a>
    </div>


</body>
</html>
