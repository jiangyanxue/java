<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UI.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="easyui/jquery.min.js"></script>
    <script src="easyui/jquery.easyui.min.js"></script>
    <script src="easyui/easyui-lang-zh_CN.js"></script>

    <link href="easyui/themes/default/easyui.css" rel="stylesheet" />
    <link href="easyui/themes/icon.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function(){
            $('#button1').click(function(){
                var username = $("#username").val();
                var pwd = $("#pwd").val();
                var valid = $("#valid").val();
                var identity = $("input[name='identity']:checked").val();

                $.ajax({
                    type: "post",
                    contentType: "application/json",
                    url: "Login.aspx/GetValueAjax",
                    data: "{username : '" + username + "',pwd : '" +  pwd + "',valid : '" + valid + "',identity : '" + identity + "'}",
                    success: function (result) {
                        if (result.d == 1) {
                            window.location.href = 'admin_page.aspx';
                        } else if(result.d == 2){
                            window.location.href = 'teacher_page.aspx';
                        } else if(result.d == 3){ 
                            window.location.href = 'student_page.aspx';
                        } else if(result.d == 4){
                            alert("输入信息不正确");
                        } else{
                            alert("验证码错误");
                        }
                    }
                    
            })
            //var url = "admin.aspx";
            ////$.post(url, "11111");
            //window.location.href = 'admin.aspx';
        }) 
        
        })


    </script>
</head>
<body style="background-image: url(image/loginbackground.jpg);">

    <div class="easyui-panel" style="width: 400px; height: 350px; padding: 50px 60px; margin: 250px 450px; background-color: transparent">
        <div style="margin-bottom: 20px;">
            <input class="easyui-textbox" prompt="Username" id="username" runat="server" iconwidth="28" style="width: 100%; height: 34px; padding: 10px;"/>
        </div>
        <div style="margin-bottom: 20px;"> 
            <input class="easyui-passwordbox" prompt="Password" id="pwd" runat="server" iconwidth="28" style="width: 100%; height: 34px; padding: 10px"/>
        </div>
        <div style="margin-bottom: 20px;">
            <input class="easyui-textbox"   id="valid" iconwidth="28" runat="server" style="width: 60%; height: 34px; padding:10px"/><asp:Image ID="Image1" runat="server" Style="margin-left: 30px;" />
        </div>
        <div style="margin-bottom: 20px;">
            <input type="radio" name="identity" runat="server" value="管理员" />管理员&nbsp;&nbsp;&nbsp;
            <input type="radio" name="identity" runat="server" value="教师" />教师&nbsp;&nbsp;&nbsp;
            <input type="radio" name="identity" runat="server" value="学生" />学生
        </div>
        <div style="margin-bottom: 0px;">
            <input id="button1" type="button" value="登&nbsp&nbsp录"  style="width: 50px; height: 30px; background-color: darkgray; border-radius: 2px; margin-left:60px;" />
        </div>
    </div>
</body>
</html>
