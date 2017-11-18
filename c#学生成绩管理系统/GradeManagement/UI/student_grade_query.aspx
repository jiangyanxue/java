<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_grade_query.aspx.cs" Inherits="UI.student_grade_query" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <script type="text/javascript">
       
        function searchGrade() {
          
            $('#myDatagrid').datagrid('load', {
                sid: $('#searchId').val(),
                sname: $('#searchName').val()
            });
            
        }
    </script>
   
     <div id="searchDiv">
        编号：<input id="searchId" class="easyui-textbox" style="width: 110px">
        名称：<input id="searchName" class="easyui-textbox" style="width: 110px">
        <a href="#" class="easyui-linkbutton" iconcls="icon-search" onclick="searchGrade()">查找</a>
    </div>
  
      <table id="myDatagrid" class="easyui-datagrid" title="&nbsp" style="width: 100%; height: 100%"
        data-options="toolbar:'#searchDiv',rownumbers:true,url:'./Grade/queryGrade.aspx',method:'get'">
        <thead>
            <tr>
                <th data-options="field:'sid',width:100,align:'center'">学号</th>
                <th data-options="field:'sname',width:100,align:'center'">学生姓名</th>
                <th data-options="field:'cid',width:100,align:'center'">课程编号</th>
                <th data-options="field:'cname',width:100,align:'center'">课程名</th>
                <th data-options="field:'score',width:100,align:'center'">成绩</th>
            </tr>
        </thead>
    </table>
 
</body>
</html>
