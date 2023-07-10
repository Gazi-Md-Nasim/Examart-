<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpass.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="icon.png" type="image/x-icon"/>
    <meta charset="UTF-8" />
    <link href="forgotpass.css" rel="stylesheet" />
    <title>Examart</title>
    <style type="text/css">
        #message {
            width: 100%;
            font-size: 20px;
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" >
    <div id="forgotpass">
        <p>Examart</p>
<div class="forgot2">
<i class="fa fa-user-circle-o" aria-hidden="true"></i>
    &nbsp;<asp:TextBox cssclass="input" ID="email" runat="server" placeholder="Enter your Email"></asp:TextBox>
        </div>
        <asp:Button cssclass="btn" ID="btn" runat="server" Text="Submit" OnClick="btn_Click" />
        <br/>
        <asp:Label ID="message" runat="server"></asp:Label>
</div>
 
    </form>
</body>
</html>
