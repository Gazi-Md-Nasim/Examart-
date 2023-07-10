<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="programming.aspx.cs" Inherits="WebApplication1.programming" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="exampage.css"/>
    <title>Programming with C and C++</title>
</head>
<body style="background:url(pr.jpg) no-repeat;background-size: cover;
    background-attachment: fixed">
    <form id="form1" runat="server">
        <div id="div2">
            <div id="div1">
		<div class="logoscale"><a href="Home.aspx"><img src="examart.png" alt="logo" title="Home" class="logo"/></a></div>
		<a><img src="user.png" alt="Profile" title="Profile" class="user"/></a>
		</div></div>

      <div><img src="programming.jpg" alt="Title" style="width:100%"/></div> 
        <div id="topics">
                <a><div class="subject" style="background-image: url(C.jpg)"><asp:Label ID="Label1" runat="server" Text="C programming"></asp:Label></div></a>
                <a><div class="subject" style="background-image: url(Cpp.jpg)"><asp:Label ID="Label2" runat="server" Text="C++ programming"></asp:Label></div></a>
</div>
        
        <div id="footer"><hr style="width:80%"/>
            <h2 style="font-family:Verdana, Geneva, Tahoma, sans-serif;margin-bottom: 3px;">Examart</h2>
            <a href="contact_us.aspx" class="extralink" style="color:white">Contact us</a><br/>
            <a href="about_us.aspx" class="extralink" style="color:white">About</a>
        </div>
    </form>
</body>
</html>
