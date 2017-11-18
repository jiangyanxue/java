<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="teacher.aspx.cs" Inherits="UI.teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<script>
    function addTeacher() {
        var url = './Teacher/addTeacher.aspx';
        var par = {
            tid: $('#txtId').val(),
            tname: $('#txtName').val(),
            gender: $('#txtGender').val(),
            telephone: $('#txtTelephone').val(),
            tcourse: $('#txtCourse').val(),


        };
        $.post(url, par, function (data) {
            $('#addDiv1').dialog('close');
            $('#myDatagrid').datagrid('reload');
        })
    }
    function updateTeacher() {
        var url = './Teacher/updateTeacher.aspx';
        var par = {
            tid: $('#Tid').val(),
            tname: $('#Tname').val(),
            gender: $('#Gender').val(),
            telephone: $('#Telephone').val(),
            tcourse: $('#Tcourse').val()

        }
        $.post(url, par, function (data) {
            $('#updateDiv1').dialog('close');
            $('#myDatagrid').datagrid('reload');
        })
    }
    function deleteTeacher(id) {
        var url = './Teacher/deleteTeacher.aspx';
        var par = { id: id };
        $.post(url, par, function (data) {
            $('#myDatagrid').datagrid('reload');
        })
    }
</script>
<table id="myDatagrid" class="easyui-datagrid" title="&nbsp" style="width: 100%; height: 100%"
    data-options="rownumbers:true,singleSelect:true,url:'./teacher/GetTeacher_info.aspx',method:'get',toolbar:toolbar">
    <thead>
        <tr>
            <th data-options="field:'tid',width:100,align:'center'">教师编号</th>
            <th data-options="field:'tname',width:100,align:'center'">教师姓名</th>
            <th data-options="field:'gender',width:100,align:'center'">性别</th>
            <th data-options="field:'telephone',width:100,align:'center'">联系方式</th>
            <th data-options="field:'tcourse',width:100,align:'center'">任教课程</th>


        </tr>
    </thead>
</table>
<div id="addDiv1" data-options="
				buttons: [{
					text:'确定',
					iconCls:'icon-ok',
					handler:function(){
					    addTeacher();
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						$('#addDiv').dialog('close');
					}
				}]
			">
    <table align="center">

        <tr>
            <td>教师编号</td>
            <td>
                <input id="txtId" type="text" /></td>
        </tr>
        <tr>
            <td>教师姓名</td>
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
        <tr>
            <td>任教课程</td>
            <td>
                <input id="txtCourse" type="text" /></td>
        </tr>

    </table>
</div>
<div id="updateDiv1" data-options="
				buttons: [{
					text:'确定',
					iconCls:'icon-ok',
					handler:function(){
					  updateTeacher();
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						$('#updateDiv1').dialog('close');
					}
				}]
			">
    <table align="center">

        <tr>
            <td>教师编号</td>
            <td>
                <input id="Tid" type="text" /></td>
        </tr>
        <tr>
            <td>教师姓名</td>
            <td>
                <input id="Tname" type="text" /></td>
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
        <tr>
            <td>任教课程</td>
            <td>
                <input id="Tcourse" type="text" /></td>
        </tr>
        >
    </table>
</div>
<script type="text/javascript">
    $('#addDiv1').hide();
    $('#updateDiv1').hide();
    var toolbar = [{
        text: '添加教师',
        iconCls: 'icon-add',
        handler: function () {
            $('#addDiv1').show();
            $('#addDiv1').dialog({
                title: '添加信息',
                width: 250,
                height: 250,
                modal: true
            });
        }
    }, {
        text: '修改教师',
        iconCls: 'icon-edit',
        handler: function () {
            var row = $('#myDatagrid').datagrid('getSelected');
            if (row) {
                $('#updateDiv1').show();
                $('#updateDiv1').dialog({
                    title: '添加信息',
                    width: 250,
                    height: 250,
                    modal: true
                });
                $('#Tid').val(row.tid);
                $('#Tname').val(row.tname);                //将itemid的值设置为row.itemid
                $('#Gender').val(row.gender);
                $('#Telephone').val(row.telephone);
                $('#Tcourse').val(row.tcourse)

            }
            else {
                $.messager.alert("警告", "请选中一行进行编辑", "info");
            }
        }
    }
         , '-', {
             text: '删除教师',
             iconCls: 'icon-remove',
             handler: function () {
                 var rows = $('#myDatagrid').datagrid('getSelected');
                 if (rows.length == 0) {
                     $.messager.alert('提示', '请选择要删除的记录', 'info');
                     return;
                 }
                 $.messager.confirm('确认删除', '您想要删除这条记录吗？', function (r) {
                     if (r) {
                         var id = rows.tid;
                         deleteTeacher(id);
                     }
                     else {
                         alert('取消删除');
                     }
                 });
             }
         }];
</script>


</html>
