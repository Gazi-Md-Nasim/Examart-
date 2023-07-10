<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact_us.aspx.cs" Inherits="WebApplication1.contact_us" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="icon.png" type="image/x-icon"/>
    <meta charset="utf-8" />
    <link href="Home.css" rel="stylesheet" />
    <title>Contact us</title>
    <style type="text/css">
        .table{
            
            margin-top:10px;
            background-color:#e5e5e5;
            font-family:'Times New Roman';
            font-size:22px;
            border-radius:5px;
            font-weight:bold;
            box-shadow:5px 5px 5px grey;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="div2">
            <div id="div1">
		<div class="logoscale"><a href="Home.aspx"><img src="examart.png" alt="logo" class="logo"/></a></div>
                <a href="profile.aspx">
            <asp:Image ID="image" CssClass="user" runat="server" Height="25px" AlternateText="Profile"/></a>
		</div></div>
        <input type="checkbox" id="check"/>
        <label for="check" class="checkbtn">
            <img src="bar.png" class="bar" title="Menu"/>
        </label>

      <div><img src="contact.jpg" alt="Welcome" style="width:100%"/></div>  
      <div>
      <ul>
        <li><a href="Home.aspx">Home</a></li>
        <li><a href="complete_exam.aspx">Completed Exams</a></li>
        <li><a href="grades.aspx">Grades</a></li>
        <li><a href="feed_back.aspx">Discussion Form</a></li>
        <li><a href="resources.aspx">Resources</a></li>
        </ul></div><hr/>
        <asp:Table ID="Table1" runat="server"  HorizontalAlign="Center" Width="900px" Height="200px" CssClass="table">
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">Email:</asp:TableCell>
                <asp:TableCell HorizontalAlign="Left">examart086@gmail.com</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">Cell:</asp:TableCell>
                <asp:TableCell HorizontalAlign="Left">01xxxxxxxxx</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">Address:</asp:TableCell>
                <asp:TableCell HorizontalAlign="Left">Amar Ekushey Hall, Khulna University of Engineering & Technology, Khulna</asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <div id="footer"><hr style="width:80%"/>
            <h1 class="name">Examart</h1>
            <a class="extralink">Contact us</a><br/>
            <a href="about_us.aspx" class="extralink">About</a>
        </div>
    </form>
</body>
</html>
