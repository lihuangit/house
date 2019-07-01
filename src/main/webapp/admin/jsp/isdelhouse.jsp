<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2019/7/1
  Time: 10:02
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
            url:'/getIsdel',
            fitColumns: true,
            pagination: true,
            pageList: [5, 10, 15, 20],
           // toolbar:"#ToolBar",
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
                { field: 'isdel', title: '状态', width: 50, align: "center",formatter:
                        function(value,row,index){
                            return"已删除";
                        } }

            ]]
        });
    });
</script>
<body>
<table id="dg"></table>

</body>
</html>
