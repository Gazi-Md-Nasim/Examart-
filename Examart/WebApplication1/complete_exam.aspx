<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="complete_exam.aspx.cs" Inherits="WebApplication1.complete_exam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="icon.png" type="image/x-icon"/>
    <meta charset="urf-8" />
    <link href="Home.css" rel="stylesheet" />
    <title></title>
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

      <div><img src="welcome.jpg" alt="Welcome" style="width:100%"/></div> 
      <div>
      <ul>
        <li><a href="Home.aspx">Home</a></li>
        <li><a class="active">Completed Exams</a></li>
        <li><a href="feed_back.aspx">Discussion Form</a></li>
        <li><a href="resources.aspx">Resources</a></li>
        </ul></div><hr/>
        <asp:GridView ID="grid" runat="server" AutoGenerateColumns="false" Width="80%" HorizontalAlign="Center">
                    <Columns>
                        <asp:BoundField DataField="ExamName" HeaderText="Exam Name" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="Marks" HeaderText="Marks" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" />
                    </Columns>
                </asp:GridView>
        <div id="footer"><hr style="width:80%"/>
            <h1 class="name">Examart</h1>
            <a href="contact_us.aspx" class="extralink" style="color:black">Contact us</a><br/>
            <a href="about_us.aspx" class="extralink" style="color:black">About</a>
        </div>
    </form>
</body>
</html>
