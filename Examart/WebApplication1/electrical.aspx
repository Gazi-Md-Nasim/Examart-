<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="electrical.aspx.cs" Inherits="WebApplication1.electrical" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="exampage.css"/>
    <title>Electrical</title>
</head>
<body style="background:url(ed.jpg) no-repeat;background-size: cover;
    background-attachment: fixed">
    <form id="form1" runat="server">
       <div id="div2">
            <div id="div1">
		<div class="logoscale"><a href="Home.aspx"><img src="examart.png" alt="logo" title="Home" class="logo"/></a></div>
		<a><img src="user.png" alt="Profile" title="Profile" class="user"/></a>
		</div></div>

      <div><img src="electrical.jpg" alt="Title" style="width:100%"/></div> 
        <div id="topics">
            <a><div class="subject" style="background-image: url(transducer.jpg)"><asp:Label ID="Label1" runat="server" Text="Tranducers"></asp:Label></div></a>
            <a><div class="subject" style="background-image: url(tv.jpg)"><asp:Label ID="Label2" runat="server" Text="Television System"></asp:Label></div></a>
            <a><div class="subject" style="background-image: url(picture.jpg)"><asp:Label ID="Label3" runat="server" Text="Analysis and Synthesis of TV picture"></asp:Label></div></a>
            <a><div class="subject" style="background-image: url(CRO.jpg)"><asp:Label ID="Label4" runat="server" Text="CRO"></asp:Label></div></a>
</div>
        
        <div id="footer"><hr style="width:80%"/>
            <h2 style="font-family:Verdana, Geneva, Tahoma, sans-serif;margin-bottom: 3px;">Examart</h2>
            <a href="contact_us.aspx" class="extralink" style="color:white">Contact us</a><br/>
            <a href="about_us.aspx" class="extralink" style="color:white">About</a>
        </div>
    </form>
</body>
</html>
