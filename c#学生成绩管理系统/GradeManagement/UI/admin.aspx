<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="UI.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    
</head>
<body>
    <script type="text/javascript">
        function addAdmin() {
            var url = './Admin/addAdmin.aspx';
            var par = {
                aid: $('#txtId').val(),
                aUsername: $('#txtName').val(),
                IsSelect: $('#txtSelect').val(),
                IsDelete: $('#txtDelete').val(),
                IsEdit: $('#txtEdit').val(),
                a_identity: $('#txtIdentity').val()

            };
            $.post(url, par, function (data) {
                $('#addDiv').dialog('close');
                $('#myDatagrid').datagrid('reload');
            })
        }
        function updateAdmin() {
            var url = './Admin/updateAdmin.aspx';
            var par = {
                aid: $('#txtAid').val(),
                aUsername: $('#txtAname').val(),
                IsSelect: $('#txtAselect').val(),
                IsDelete: $('#txtAdelete').val(),
                IsEdit: $('#txtAedit').val(),
                a_identity: $('#txtAidentity').val()
            }
            $.post(url, par, function (data) {
                $('#updateDiv').dialog('close');
                $('#myDatagrid').datagrid('reload');
            })
        }
        function deleteAdmin(id) {
            var url = './Admin/deleteAdmin.aspx';
            var par = { id: id};
            $.post(url, par, function (data) {
                $('#myDatagrid').datagrid('reload');
            })
        }

    </script>
    <table id="myDatagrid" class="easyui-datagrid" title="&nbsp" style="width: 100%; height: 100%"
        data-options="rownumbers:true,singleSelect:false,url:'/GetAdmin.aspx',method:'get',toolbar:toolbar">
        <thead>
            <tr>
                <th data-options="field:'ck',checkbox:true"></th>
                <th data-options="field:'aid',width:100,align:'center'">管理员姓名</th>
                <th data-options="field:'aUsername',width:100,align:'center'">管理员用户名</th>
                <th data-options="field:'IsSelect',width:100,align:'center'">是否查询权限</th>
                <th data-options="field:'IsDelete',width:100,align:'center'">是否删除权限</th>
                <th data-options="field:'IsEdit',width:100,align:'center'">是否编辑权限</th>
                <th data-options="field:'a_identity',width:100,align:'center'">身份</th>

            </tr>
        </thead>
    </table>
    <div id="addDiv" data-options="
				buttons: [{
					text:'确定',
					iconCls:'icon-ok',
					handler:function(){
					    addAdmin();
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
                <td>管理员编号</td>
                <td>
                    <input id="txtId" type="text" /></td>
            </tr>
            <tr>
                <td>管理员用户名</td>
                <td>
                    <input id="txtName" type="text" /></td>
            </tr>
            <tr>
                <td>是否查询权限</td>
                <td>
                    <input id="txtSelect" type="text" /></td>
            </tr>
            <tr>
                <td>是否删除权限</td>
                <td>
                    <input id="txtDelete" type="text" /></td>
            </tr>
            <tr>
                <td>是否编辑权限</td>
                <td>
                    <input id="txtEdit" type="text" /></td>
            </tr>
            <tr>
                <td>身份</td>
                <td>
                    <input id="txtIdentity" type="text" /></td>
            </tr>
        </table>
    </div>
    <div id="updateDiv" data-options="
				buttons: [{
					text:'确定',
					iconCls:'icon-ok',
					handler:function(){
					  updateAdmin();
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
                <td>管理员编号</td>
                <td>
                    <input id="txtAid" type="text" /></td>
            </tr>
            <tr>
                <td>管理员用户名</td>
                <td>
                    <input id="txtAname" type="text" /></td>
            </tr>
            <tr>
                <td>是否查询权限</td>
                <td>
                    <input id="txtAselect" type="text" /></td>
            </tr>
            <tr>
                <td>是否删除权限</td>
                <td>
                    <input id="txtAdelete" type="text" /></td>
            </tr>
            <tr>
                <td>是否编辑权限</td>
                <td>
                    <input id="txtAedit" type="text" /></td>
            </tr>
            <tr>
                <td>身份</td>
                <td>
                    <input id="txtAidentity" type="text" /></td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        $('#updateDiv').hide();
        $('#addDiv').hide();
        var toolbar = [{
            text: '添加管理员',
            iconCls: 'icon-add',
            handler: function () {
                $('#addDiv').show();
                $('#addDiv').dialog({
                    title: '添加信息',
                    width: 250,
                    height: 250,
                    modal: true
                });
            }
        }, {
            text: '修改管理员信息',
            iconCls: 'icon-edit',
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
                    $('#txtAid').val(row.aid);
                    $('#txtAname').val(row.aUsername);                //将itemid的值设置为row.itemid
                    $('#txtAselect').val(row.IsSelect);
                    $('#txtAdelete').val(row.IsDelete);
                    $('#txtAedit').val(row.IsEdit);
                    $('#txtAidentity').val(row.a_identity)
                }
                else {
                    $.messager.alert("警告", "请选中一行进行编辑", "info");
                }
            }
        }, '-',
		    {
		        text: '删除管理员',
		        iconCls: 'icon-remove',
		        handler: function () {
		            var rows = $('#myDatagrid').datagrid('getSelected');
		            if (rows.length == 0) {
		                $.messager.alert('提示', '请选择要删除的记录', 'info');
		                return;
		            }
		            $.messager.confirm('确认删除', '您想要删除这条记录吗？', function (r) {
		                if (r) {
		                    var id = rows.aid;
		                    deleteAdmin(id);
		                   
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
