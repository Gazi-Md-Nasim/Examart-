<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="icon.png" type="image/x-icon"/>
    <meta charset="UTF-8" />
    <link href="login.css" rel="stylesheet" />
    <title>Examart</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            color: white;
            font-family: adobe-calson-pro;
            background: url('AI.jpg') no-repeat;
            background-size: cover;
            background-attachment: fixed;
            color:black;
        }
    </style>
</head>
<body>
    <form runat="server">     
<div class="login">
    <p id="logo">Examart</p>
<div class="textbox">
<i class="fa fa-user-circle-o" aria-hidden="true"></i>
    &nbsp;<asp:TextBox cssclass="input" ID="email" runat="server" placeholder="Email"></asp:TextBox>
</div>
<div class="textbox">
<i class="fa fa-key" aria-hidden="true"></i>
    &nbsp;<asp:TextBox type="password" cssclass="input" ID="pass" runat="server" placeholder="Password"></asp:TextBox>
</div>
    <asp:Button cssclass="btn" ID="button" runat="server"  Text="Login" OnClick="button_Click" />
    <br/>
    <a href="forgotpass.aspx">Forgot password?</a><br/>
<a href="createNew.aspx">Create an account</a>
    <asp:Label ID="message" runat="server"></asp:Label>
</div>
    </form>
</body>
</html>