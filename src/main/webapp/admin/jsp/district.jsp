<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2019/6/18
  Time: 14:15
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
            url:'/getAll',
            fitColumns: true,
            pagination: true,
            pageList: [5, 10, 15, 20],
            toolbar:"#ToolBar",
            //singleSelect:true,  //只能设置单选
            pageSize:5,
            columns: [[
                {field:'ck',checkbox:true},  //复选框列
                { field: 'id', title: '编号', width: 50, align: "center" },
                { field: 'name', title: '区域名', width: 50, align: "center" },
                { field: 'caozuo', title: '操作', width: 50, align: "center",formatter:
                        function(value,row,index){
                       return "<a href='javascript:deleOne("+row.id+")'>删除</a>|<a href='javascript:selectStreet("+row.id+")'>查询街道</a>"
                    }
                }
            ]]
        });

    });
    function Add() {
   //打开对话框
        $("#add").dialog('open').dialog("setTitle","添加");
    }
    function close1(s) {
        //关闭对话框
        $("#"+s).dialog('close')
    }
    function save() {
        $("#add2").form('submit',{
            url:"/add",
          success:function (data) {

                var obj = $.parseJSON(data);
                if(obj.result>0){
                    $("#add").dialog('close')
                    $("#dg").datagrid('reload');
                    $.messager.alert('提示框','恭喜添加成功!')
                } else{
                    $.messager.alert('提示框','系统正在维护无法添加!')
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

    $("#up").dialog('open').dialog("setTitle","修改");
    $("#up1").form('load',selectRow);
}
function update2() {
    $("#up1").form('submit',{
        url:"/update",
        success:function (data) {

            var p= $.parseJSON(data);
            if(p.result>0){
                $("#up").dialog('close')
                $("#dg").datagrid('reload');
                $.messager.alert('提示框','恭喜修改成功!')
            }else {
                $.messager.alert('提示框','系统正在维护无法修改!')
            }
        }
    })
}
    //删除的代码
    function delete1(){
        //获取选择行
        var SelectRows = $("#dg").datagrid('getSelections');

        if( 0 == SelectRows.length ){
            $.messager.alert("系统提示", "请选择要删除的数据");
            return;
        }
        var SelectIndexArr = new Array();
        for( var i = 0 ; i < SelectRows.length; i++ ){
          SelectIndexArr.push(SelectRows[i].id);
            //SelectIndexArr[i]=SelectRows[i].id
        }

        var SelectIndexToString = SelectIndexArr.join(",");

        $.messager.confirm("系统提示", "你确定要删除<font color=red> " + SelectRows.length + " </font>条数据吗?", function(xo){
            if( xo ){
                $("#dg").datagrid('reload');
                //支持多项删除
                //alert(SelectIndexToString);
                $.post("/deletes",{"id":SelectIndexToString},function(data){

                    if( data.data>0 ){
                        $.messager.alert("系统提示", "你已成功删除 <font color=green> " +data.data + " </font>条数据!~");
                        $("#dg").datagrid('reload');
                    }
                    else{
                        $.messager.alert("系统提示", "<font color=red>删除失败</font>");
                    }
                },"json");
            }
        });
    }
function deleOne(id) {
    $.messager.confirm("系统提示","你确定要删除这条数据吗？",function (xo) {
        if (xo) {
            $.post("/deleteOne",{"id":id},function (data) {
                if(data.data>0){
                    $("#dg").datagrid('reload');
                    $.messager.alert('提示框','恭喜删除成功!')
                }

            },"json")
        }
    })

}

function selectStreet(id) {
    $("#select1").dialog('open').dialog("setTitle","显示街道");
     $("#streetid").val(id);
    $("#streetid1").val(id)

    $('#dg1').datagrid({
        url:'/selectStreet?districtId='+id,
        fitColumns: true,
        pagination: true,
        pageList: [5, 10, 15, 20],
        toolbar:"#ToolBar1",
        //singleSelect:true,  //只能设置单选
        pageSize:5,
        columns: [[
            {field:'ck',checkbox:true},  //复选框列
            { field: 'id', title: '编号', width: 50, align: "center" },
            { field: 'name', title: '街道名', width: 50, align: "center" },


            { field: 'caozuo', title: '操作', width: 50, align: "center",formatter:
                    function(value,row,index){
                        return "<a href='javascript:deleOneStreet1("+row.id+")'>删除</a>"
                    }
            }
        ]]
    });
}

    /**
     * @author lh
     * @date 2019/6/26 11:19
     * @param 弹框添加街道
     * @return 
     */
$(function () {
   $("#but1").click(function () {
    var s= $("#aa").val();
    if(s==''){
        $.messager.alert('提示框','街道不能为空!')
        return
    }
       $("#form1").form('submit',{
            url:"/addStreet",
           success:function (data) {
                var p = $.parseJSON(data);
               if(p.result>0){

                   $("#dg1").datagrid('reload');
                   $.messager.alert('提示框','恭喜添加成功!')
               }else {
                   $.messager.alert('提示框','系统正在维护无法添加!')
               }

           }
       })

   }) 
})
    /**
     * @author lh
     * @date 2019/6/26 11:18
     * @param 街道修改
     * @return 
     */
$(function () {

    $("#but2").click(function () {



        $("#form2").form('submit',{
            url:"/upStreet",
            success:function (data) {
                var p = $.parseJSON(data);
                if(p.result>0){
                    $("#dg1").datagrid('reload');
                    $.messager.alert('提示框','恭喜修改成功!')
                }else {
                    $.messager.alert('提示框','系统正在维护无法添加!')
                }
            }
        })
    })
})
    /**
     * @author lh
     * @date 2019/6/26 11:20
     * @param 选中获取修改中的值到修改框中 
     * @return 
     */
    $(function () {
        $("#but3").click(function () {
            var datagrid = $("#dg1").datagrid("getSelections");

            if(datagrid.length!=1){
                $.messager.alert('提示框','你没有选择行或者选择了多行!')
                return
            }
            var d = datagrid[0];
            $("#name1").val(d.name);

            $("#ids").val(d.id)
        })
    })
    /**
     * @author lh
     * @date 2019/6/26 11:22
     * @param 传入表格中的id进行单条删除
     * @return 
     */
function deleOneStreet1(id) {

    $.messager.confirm("提示框","确定删除此信息吗？",function (xo) {
        if(xo){
            $.post("/delStreet",{"id":id},function (data) {
                if (data.result>0){
                    $("#dg1").datagrid("reload")
                    $.messager.alert("提示框","删除成功!")
                }else {
                    $.messager.alert("提示框","删除失败!")
                }
            },"json")
        }
    })
}
/**
 * @author lh
 * @date 2019/6/26 11:23
 * @param 实行街道多条删除
 * @return 
 */
function delete3() {
    var SelectRows = $("#dg1").datagrid('getSelections');
    if(SelectRows.length==0){
        $.messager.alert("提示框","请选择要删的数据")
        return
    }
    var str="";
    for (var i=0;i<SelectRows.length;i++){
        str=str+SelectRows[i].id+",";
    }
    var s = str.substring(0,str.length-1);

    $.messager.confirm("提示框","确定删除"+SelectRows.length+"条数据吗？",function (xo) {
        if(xo){
            $.post("/delesStreet",{"id":s},function (data) {
                if(data.result>0){
                    $("#dg1").datagrid("reload")
                    $.messager.alert("提示框","成功删除"+data.result+"条数据")
                }else {
                    $.messager.alert("提示框","删除失败!")
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
                <td>区域:</td>

                <td><input type="text" name="name" id="author" /></td>
            </tr>
        </table>
    </form>
</div>
<div id="up" class="easyui-dialog" buttons="#up2"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">
    <form id="up1" method="post">
        <table>

            <tr>
                <td>区域:</td>
                <td><input type="hidden" name="id" id="author2" /></td>
                <td><input type="text" name="name" id="author1" /></td>
            </tr>
        </table>
    </form>
</div>

<div id="select1" class="easyui-dialog" buttons="#up3"
     style="width: 680px; height: 650px; padding: 10px 20px;" closed="true">
    <table id="dg1"></table>
    <div id="ToolBar1">
        <div style="height: 40px;">
            <a

                href="javascript:delete3()" class="easyui-linkbutton"
                iconCls="icon-remove" plain="true">删除</a>
        </div>
    </div>
    <div>
        <form id="form1">

      街道名：  <input type="text" name="name" id="aa">&nbsp;&nbsp;&nbsp;区域id:<input type="text" readonly name="districtId" id="streetid">
        <input type="button" value="添加" id="but1">
        </form>
    </div>
    <div>
        <form id="form2">
            <input type="hidden" name="id" id="ids">
            街道名：  <input type="text" name="name" id="name1">&nbsp;&nbsp;&nbsp;区域id:<input type="text" readonly name="districtId" id="streetid1">
            <input type="button" value="修改" id="but2"><input type="button" value="确定选中行" id="but3">
        </form>
    </div>

</div>


<div id="add1">
    <a href="javascript:save()" class="easyui-linkbutton"
       iconCls="icon-ok">保存</a>
    <a href="javascript:close1('add')"
        class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>
<div id="up2">
    <a href="javascript:update2()" class="easyui-linkbutton"
       iconCls="icon-ok">修改</a>
    <a href="javascript:close1('up')"
       class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>
<div id="up3">

    <a href="javascript:close1('select1')"
       class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>
</body>
</html>
