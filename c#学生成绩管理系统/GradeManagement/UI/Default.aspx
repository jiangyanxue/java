<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="UI._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="easyui/jquery.min.js"></script>
    <script src="easyui/jquery.easyui.min.js"></script>
    <script src="easyui/easyui-lang-zh_CN.js"></script>
    <link href="easyui/themes/default/easyui.css" rel="stylesheet" />
    <link href="easyui/themes/icon.css" rel="stylesheet" />
</head>
<body class="easyui-layout">
    <div data-options="region:'north',split:true, collapsible:false" style="height: 5%;"></div>
    <div data-options="region:'south',split:true, collapsible:false" style="height: 5%;">
        <center>
            <p style="font-family: Arial">CopyRight@SPM by jyx</p>
        </center>
    </div>

    <div data-options="region:'west',title:'菜单',split:true" style="width: 25%; height: 81%;">
        <div id="myAccordion" class="easyui-accordion" style="width: 100%; height: 100%;">
            <div title="人员信息管理" data-options="iconCls:'icon-user'" style="overflow: auto; padding: 10px;">
                <ul id="myTree"></ul>  
            </div>
            <div title="处理信息" data-options="iconCls:'icon-information',selected:true" style="padding: 10px;">
               <ul id="myTree1"></ul>  
            </div>
            <div title="系统管理 "data-options="iconCls:'icon-system'">
                 <ul id="myTree2"></ul>  
            </div>
        </div>
    </div>
    <div data-options="region:'center'" style="padding: 5px; background: #eee; height: 71%;">
        <div id="mytabs" class="easyui-tabs" style="width: 100%; height: 100%;">
            <div title="欢迎使用" style="padding: 0px; display: none;">
                  欢迎
            </div>
            
        </div>
    </div>

</body>
<script src="Scripts/Tree.js"></script>

</html>
