$(function () {
    $('#dg').datagrid({
        url:'/getAllType',
        fitColumns: true,
        pagination: true,
        pageList: [5, 10, 15, 20],
        toolbar:"#ToolBar",
        // singleSelect:true,  //只能设置单选
        pageSize:5,
        columns: [[
            {field:'ck',checkbox:true},  //复选框列
            { field: 'id', title: '编号', width: 50, align: "center" },
            { field: 'name', title: '房屋类型', width: 50, align: "center" },
            { field: 'caozuo', title: '操作', width: 50, align: "center",formatter:
                    function(value,row,index){
                        return "<a href='javascript:deleOneType("+row.id+")'>删除</a>"
                    }
            }
        ]]
    });
});
function Add() {//添加弹框
    $("#add").dialog("open").dialog("setTitle","添加")
}
function close1(s) {//关闭弹框
    $("#"+s).dialog("close")
}
//添加数据
function save() {
    $("#add2").form('submit',{
        url:"/addType",
        success:function (result) {
            var p = $.parseJSON(result);
            if (p.result > 0) {
                $("#add").dialog("close");
                $("#dg").datagrid("reload")
                $.messager.alert("提示框","添加成功!")
            }else {
                $.messager.alert("提示框","添加失败!")
            }
        }
    })

}
//修改数据
function update1() {
    var datagrid = $("#dg").datagrid('getSelections');
    if(datagrid.length!=1){
        $.messager.alert("提示框","你没有选择或者选择了多行");
        return;
    }
    var da = datagrid[0];

    $("#upType").dialog("open").dialog("setTitle","修改");
    $("#upType1").form('load',da);
}

//提交修改表单
function upType() {
    $("#upType1").form("submit",{
        url:"/updateType",
        success:function (data) {
            var p = $.parseJSON(data);
            if(p.result>0){
                $("#upType").dialog("close")
                $("#dg").datagrid("reload")
                $.messager.alert("提示框","修改成功")
            }else {
                $.messager.alert("提示框","修改失败")
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
            $.post("/deletes1",{id:SelectIndexToString},function(data){

                if( data.result>0 ){
                    $.messager.alert("系统提示", "你已成功删除 <font color=green> " +data.result + " </font>条数据!~");
                    $("#dg").datagrid('reload');
                }
                else{
                    $.messager.alert("系统提示", "<font color=red>删除失败</font>");
                }
            },"json");
        }
    });
}
function deleOneType(id) {
    $.messager.confirm("系统提示","确认删除这条数据吗？",function (xo) {
        if(xo){
            $.post("/deleteOne3",{"id":id},function (data) {
                $("#dg").datagrid("reload")
                if(data.result>0){
                    $("#dg").datagrid("reload")
                    $.messager.alert("系统提示", "你已成功删除" );
                }

            },"json")
        }
    })
}
