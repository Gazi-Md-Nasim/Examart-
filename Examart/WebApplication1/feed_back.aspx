<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feed_back.aspx.cs" Inherits="WebApplication1.feed_back" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="icon.png" type="image/x-icon"/>
    <meta charset="utf-8" />
    <link href="Home.css" rel="stylesheet" />
    <title>Feed back</title>
    <style type="text/css">
        .auto-style1 {
            width: 230px;
            font-size:20px;
            font-weight:bolder;
        }
        .auto-style2 {
            margin-left: 3px;
            width:70%;
        }
        #btn {
            background-color: rgb(32,147,255);
            font-weight: bolder;
            color: white;
            padding: 8px 20px;
            border: none;
            cursor: pointer;
        }
        .nme
        {
            color: coral;
            font-size:15px;
            font-weight:bold;
            padding:5px;

        }
        .auto-style4 {
            width: 37px;
        }
        .comm
        {
            font-weight:bolder;
            color:black;
            padding:5px;
        }
        #emt
        {
            color:red;
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

      <div><img src="welcome.jpg" alt="Welcome" style="width:100%"/></div>  
      <div>
      <ul>
        <li><a href="Home.aspx">Home</a></li>
        <li><a href="complete_exam.aspx">Completed Exams</a></li>
        <li><a class="active">Discussion Form</a></li>
        <li><a href="resources.aspx">Resources</a></li>
        </ul></div><hr/>
        <div style="overflow:hidden">
        <table style="margin-left:5px" class="auto-style3">
            <tr>
                <td class="auto-style1">
                    Give your Comment:  
                </td>
                <td>
                    <asp:TextBox ID="CommentBox" runat="server" textmode="MultiLine" CssClass="auto-style2" Width="244px" Rows="5"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:Button ID="btn" runat="server" Text="Comment" OnClick="btn_Click"/>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="emt" runat="server"></asp:Label></td>
            </tr>
        </table></div>
        <asp:Repeater ID="Repeater1" runat ="server">
            <ItemTemplate>
                <br />
                <asp:Label ID="nme" CssClass="nme" runat="server" Text='<%#Eval ("Name") %>'></asp:Label>
                <asp:Label ID="dte" runat="server" Text='<%#Eval ("Date") %>'></asp:Label>
                <br />
                <asp:Label ID="comnt" CssClass="comm" runat="server" Text='<%#Eval ("Comment") %>'></asp:Label><br />
            </ItemTemplate>
        </asp:Repeater>
        
        <div id="footer"><hr style="width:80%"/>
            <h1 class="name">Examart</h1>
            <a href="contact_us.aspx" class="extralink" style="color:black">Contact us</a><br/>
            <a href="about_us.aspx" class="extralink" style="color:black">About</a>
        </div>
    </form>
</body>
</html>
