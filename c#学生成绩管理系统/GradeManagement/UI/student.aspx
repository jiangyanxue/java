<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student.aspx.cs" Inherits="UI.student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <script type="text/javascript">
        function addStudent() {
            var url = './Student/addStudent.aspx';
            var par = {
                sid: $('#txtId').val(),
                sname: $('#txtName').val(),
                gender: $('#txtGender').val(),
                telephone: $('#txtTelephone').val()
             };
            $.post(url, par, function (data) {
                $('#addDiv2').dialog('close');
                $('#myDatagrid').datagrid('reload');
            })
        }
        function updateStudent() {
            var url = './Student/updateStudent.aspx';
            var par = {
                sid: $('#Sid').val(),
                sname: $('#Sname').val(),
                gender: $('#Gender').val(),
                telephone: $('#Telephone').val()
            };
            $.post(url, par, function (data) {
                $('#updateDiv2').dialog('close');
                $('#myDatagrid').datagrid('reload');
            })
        }
        function deleteStudent(id) {
            var url = './Student/deleteStudent.aspx';
            var par = { id: id };
            $.post(url, par, function (data) {
                $('#myDatagrid').datagrid('reload');
            })
        }
    </script>
   <table id="myDatagrid" class="easyui-datagrid" title="&nbsp" style="width: 100%; height: 100%"
    data-options="rownumbers:true,singleSelect:true,url:'./Student/GetStudent.aspx',method:'get',toolbar:toolbar">
    <thead>
        <tr>
            <th data-options="field:'sid',width:100,align:'center'">学生编号</th>
            <th data-options="field:'sname',width:100,align:'center'">学生姓名</th>
            <th data-options="field:'gender',width:100,align:'center'">性别</th>
            <th data-options="field:'telephone',width:100,align:'center'">联系方式</th>
        </tr>
    </thead>
</table>
    <div id="addDiv2" data-options="
				buttons: [{
					text:'确定',
					iconCls:'icon-ok',
					handler:function(){
					    addStudent();
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						$('#addDiv2').dialog('close');
					}
				}]
			">
    <table align="center">

        <tr>
            <td>学生编号</td>
            <td>
                <input id="txtId" type="text" /></td>
        </tr>
        <tr>
            <td>学生姓名</td>
            <td>
                <input id="txtName" type="text" /></td>
        </tr>
        <tr>
            <td>性别</td>
            <td>
                <input id="txtGender" type="text" /></td>
        </tr>
        <tr>
            <td>联系方式</td>
            <td>
                <input id="txtTelephone" type="text" /></td>
        </tr>
     </table>
</div>
    <div id="updateDiv2" data-options="
				buttons: [{
					text:'确定',
					iconCls:'icon-ok',
					handler:function(){
					    updateStudent();
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						$('#updateDiv2').dialog('close');
					}
				}]
			">
    <table align="center">

        <tr>
            <td>学生编号</td>
            <td>
                <input id="Sid" type="text" /></td>
        </tr>
        <tr>
            <td>学生姓名</td>
            <td>
                <input id="Sname" type="text" /></td>
        </tr>
        <tr>
            <td>性别</td>
            <td>
                <input id="Gender" type="text" /></td>
        </tr>
        <tr>
            <td>联系方式</td>
            <td>
                <input id="Telephone" type="text" /></td>
        </tr>
     </table>
</div>
    <script type="text/javascript">
        $('#addDiv2').hide();
        $('#updateDiv2').hide();
        var toolbar = [{
            text: '添加学生信息',
            iconCls: 'icon-add',
            handler: function () {
                $('#addDiv2').show();
                $('#addDiv2').dialog({
                    title: '添加信息',
                    width: 250,
                    height: 250,
                    modal: true
                });
            }
        }, {
            text: '修改信息',
            iconCls: 'icon-edit',
            handler: function () {
                var row = $('#myDatagrid').datagrid('getSelected');
                if (row) {
                    $('#updateDiv2').show();
                    $('#updateDiv2').dialog({
                        title: '添加信息',
                        width: 250,
                        height: 250,
                        modal: true
                    });
                    $('#Sid').val(row.sid);
                    $('#Sname').val(row.sname);                //将itemid的值设置为row.itemid
                    $('#Gender').val(row.gender);
                    $('#Telephone').val(row.telephone);
                    
                }
                else {
                    $.messager.alert("警告", "请选中一行进行编辑", "info");
                }
            }
        }, '-', {
            text: '删除信息',
            iconCls: 'icon-remove',
            handler: function () {
                var rows = $('#myDatagrid').datagrid('getSelected');
                if (rows.length == 0) {
                    $.messager.alert('提示', '请选择要删除的记录', 'info');
                    return;
                }
                $.messager.confirm('确认删除', '您想要删除这条记录吗？', function (r) {
                    if (r) {
                        var id = rows.sid;
                        deleteStudent(id);
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
