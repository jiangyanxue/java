<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_grade.aspx.cs" Inherits="UI.student_grade" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
        
     <script type="text/javascript">
             function updateGrade() {
                 var url = './Grade/updateGrade.aspx';
                 var par = {
                     sid: $('#Sid').val(),
                     sname: $('#Sname').val(),
                     cid: $('#Cid').val(),
                     cname: $('#Cname').val(),
                     score: $('#Score').val()
                 };
                 $.post(url, par, function (data) {
                     $('#updateDiv').dialog('close');
                     $('#myDatagrid').datagrid('reload');
                 })
             }
                 function deleteGrade(id) {
                     var url = './Grade/deleteGrade.aspx';
                     var par = { id: id };
                     $.post(url, par, function (data) {
                         $('#myDatagrid').datagrid('reload');
                     })
                 }
             
         </script>
        <table id="myDatagrid" class="easyui-datagrid" title="&nbsp" style="width: 100%; height: 100%"
        data-options="rownumbers:true,singleSelect:true,url:'./Grade/GetGrade.aspx',method:'get',toolbar:toolbar">
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
     <div id="updateDiv" data-options="
				buttons: [{
					text:'确定',
					iconCls:'icon-ok',
					handler:function(){
					  updateGrade();
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						$('#updateDiv').dialog('close');
					}
				}]
			">
        <table align="center">

            <tr>
                <td>学号</td>
                <td>
                    <input id="Sid" type="text" /></td>
            </tr>
            <tr>
                <td>姓名</td>
                <td>
                    <input id="Sname" type="text" /></td>
            </tr>
            <tr>
                <td>课程编号</td>
                <td>
                    <input id="Cid" type="text" /></td>
            </tr>
            <tr>
                <td>课程名</td>
                <td>
                    <input id="Cname" type="text" /></td>
            </tr>
            <tr>
                <td>成绩</td>
                <td>
                    <input id="Score" type="text" /></td>
            </tr>
       </table>
    </div>
    <script type="text/javascript">
        $('#updateDiv').hide();
        var toolbar = [{
            text: '修改',
		    iconCls:'icon-edit',
		    handler: function () {
		        var row = $('#myDatagrid').datagrid('getSelected');
		        if (row) {
		            $('#updateDiv').show();
		            $('#updateDiv').dialog({
		                title: '添加信息',
		                width: 250,
		                height: 250,
		                modal: true
		            });
		            $('#Sid').val(row.sid);
		            $('#Sname').val(row.sname);                //将itemid的值设置为row.itemid
		            $('#Cid').val(row.cid);
		            $('#Cname').val(row.cname);
		            $('#Score').val(row.score);
		           
		        }
		        else {
		            $.messager.alert("警告", "请选中一行进行编辑", "info");
		        }
		    }
		},'-',{
		    text:'删除',
		    iconCls:'icon-remove',
		    handler: function () {
		        var rows = $('#myDatagrid').datagrid('getSelected');
		        if (rows.length == 0) {
		            $.messager.alert('提示', '请选择要删除的记录', 'info');
		            return;
		        }
		        $.messager.confirm('确认删除', '您想要删除这条记录吗？', function (r) {
		            if (r) {
		                var id = rows.sid;
		                deleteGrade(id);

		            }
		            else {
		                alert('取消删除');
		            }
		        });
		    }
		}];
	</script>
    
</body>
</html>
