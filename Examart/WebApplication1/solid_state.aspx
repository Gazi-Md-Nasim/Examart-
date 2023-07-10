<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="solid_state.aspx.cs" Inherits="WebApplication1.solid_state" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="exampage.css"/>
    <title>Solid State Electronics</title>
</head>
<body style="background:url(ss.jpg) no-repeat;background-size: cover;
    background-attachment: fixed">
    <form id="form1" runat="server">
             <div id="div2">
            <div id="div1">
		<div class="logoscale"><a href="Home.aspx"><img src="examart.png" alt="logo" title="Home" class="logo"/></a></div>
		<a><img src="user.png" alt="Profile" title="Profile" class="user"/></a>
		</div></div>

      <div><img src="solid.jpg" alt="Title" style="width:100%"/></div> 
        <div id="topics">
            <a href="exam_page.aspx"><div class="subject" style="background-image: url(matter.jpg)"><asp:Label ID="Label1" runat="server" Text="Matter and it's Classification"></asp:Label></div></a>
            <a><div class="subject" style="background-image: url(crystal.jpg)"><asp:Label ID="Label2" runat="server" Text="Crystal"></asp:Label></div></a>
            <a><div class="subject" style="background-image: url(material.jpg)"><asp:Label ID="Label3" runat="server" Text="Classification of Materials"></asp:Label></div></a>
            <a><div class="subject" style="background-image: url(semiconductor.jpg)"><asp:Label ID="Label4" runat="server" Text="Semiconductor"></asp:Label></div></a>
            <a><div class="subject" style="background-image: url(metal.jpg)"><asp:Label ID="Label5" runat="server" Text="Metals"></asp:Label></div></a>
        </div>
        
        <div id="footer"><hr style="width:80%"/>
            <h2 style="font-family:Verdana, Geneva, Tahoma, sans-serif;margin-bottom: 3px;">Examart</h2>
            <a href="contact_us.aspx" class="extralink" style="color:white">Contact us</a><br/>
            <a href="about_us.aspx" class="extralink" style="color:white">About</a>
        </div>
    </form>
</body>
</html>
