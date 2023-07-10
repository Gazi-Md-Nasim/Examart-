<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="computer_fundamental.aspx.cs" Inherits="WebApplication1.computer_fundamental" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="exampage.css"/>
    <title>Computer Fundamental</title>
</head>
<body style="background:url(cf.jpg) no-repeat;background-size: cover;
    background-attachment: fixed">
    <form id="form1" runat="server">
        <div id="div2">
            <div id="div1">
		<div class="logoscale"><a href="Home.aspx"><img src="examart.png" alt="logo" title="Home" class="logo"/></a></div>
		<a><img src="user.png" alt="Profile" title="Profile" class="user"/></a>
		</div></div>

      <div><img src="computer.jpg" alt="Title" style="width:100%"/></div> 
        <div id="topics">
            <a><div class="subject" style="background-image: url(cbis.jpg)"> <asp:Label ID="Label1" runat="server" Text="Computer based Information System"></asp:Label></div></a>
            <a><div class="subject" style="background-image: url(software.jpg)"> <asp:Label ID="Label2" runat="server" Text="Hardware & Software"></asp:Label></div></a>
            <a><div class="subject" style="background-image: url(security.jpg)"> <asp:Label ID="Label3" runat="server" Text="Security"></asp:Label></div></a>
            <a><div class="subject" style="background-image: url(cn.jpg)"> <asp:Label ID="Label4" runat="server" Text="Computer Network"></asp:Label></div></a>
</div>
        
        <div id="footer"><hr style="width:80%"/>
            <h2 style="font-family:Verdana, Geneva, Tahoma, sans-serif;margin-bottom: 3px;">Examart</h2>
            <a href="contact_us.aspx" class="extralink" style="color:white">Contact us</a><br/>
            <a href="about_us.aspx" class="extralink" style="color:white">About</a>
        </div>
    </form>
</body>
</html>
