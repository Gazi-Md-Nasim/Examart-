<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminlist.aspx.cs" Inherits="WebApplication1.adminlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="icon.png" type="image/x-icon"/>
    <link href="Home.css" rel="stylesheet" />
    <title>Admin List</title>
    <style type="text/css">
        .table
        {
            margin-bottom: 10px;
            padding:10px;
            border-radius: 10px;
            box-shadow:5px 5px 5px grey;
        }
        .labeldesign{
            width:100%;
            text-align:left;
            font-family: 'Times New Roman';
            font-size: 20px;
            color:black;
        }
        .delbtn{
            width:80%;
            height:40px;
            border:1px black;
            background-color:#0850d1;
            font-family: 'Times New Roman';
            font-size: 25px;
            color:white;
            border-radius: 10px;
            cursor:pointer;
        }
        #searchbtn{
            height:40px;
            border:1px black;
            background-color:#0850d1;
            font-family: 'Times New Roman';
            font-size: 25px;
            color:white;
            cursor:pointer;
            border-radius: 10px;
        }
        #searchbtn:hover,.delbtn:hover{
            background-color:#0c5bb1;
            transition: 0.5s ease;
            border-radius:0px;
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

      <div style="font-family:'Times New Roman';font-size:100px; font-weight:bolder; text-align:center; background-color:#78b4ff; width:100%;">Admin List</div> 
      <div>
      <ul>
        <li><a href="Home.aspx">Home</a></li>
        <li><a href="complete_exam.aspx">Completed Exams</a></li>
        <li><a href="feed_back.aspx">Discussion Form</a></li>
        <li><a href="resources.aspx">Resources</a></li>
        </ul></div><hr/><br />

        <asp:Table ID="Table1" CssClass="table" runat="server" Width="300px" HorizontalAlign="Center" Height="100px" BackColor="#CCCCCC">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="searchtext" runat="server" placeholder="Insert Name" Height="35px" Width="200px" MaxLength="100"></asp:TextBox></asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="searchbtn" runat="server" Text="Search" Height="35px"  OnClick="searchbtn_Click"/></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />

        <asp:Repeater ID="Repeat" runat="server">
            <ItemTemplate>
                <asp:Table ID="Table" CssClass="table" runat="server" Width="800px" HorizontalAlign="Center" BackColor="#CCCCCC">
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Right" RowSpan="6" Width="160px">
                            <asp:Image ID="propic" runat="server" ImageUrl='<%#Eval("ProfilePic") %>' Width="150px"/></asp:TableCell>
                        <asp:TableCell HorizontalAlign="Left">
                            <asp:Label ID="stuname" CssClass="labeldesign" runat="server" Text='<%#Eval("Name") %>'></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Left"><asp:Label ID="department" CssClass="labeldesign" runat="server" Text='<%#Eval("Department") %>'></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Left"><asp:Label ID="varsity" CssClass="labeldesign" runat="server" Text='<%#Eval("University") %>'></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Left"><asp:Label ID="address" CssClass="labeldesign" runat="server" Text='<%#Eval("Address") %>'></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Left"><asp:Label ID="Email" CssClass="labeldesign" runat="server" Text='<%#Eval("Email") %>'></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Left">
                            <asp:Button ID="delbtn" CssClass="delbtn" Text="Remove from Admin" runat="server" CommandArgument='<%#Eval("LogInID") %>' OnClick="delbtn_Click"/></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </ItemTemplate>
        </asp:Repeater>


      <div id="footer"><hr style="width: 80%"/>
            <h1 class="name">Examart</h1>
            <a href="contact_us.aspx" class="extralink" style="color:black">Contact us</a><br/>
            <a href="about_us.aspx" class="extralink" style="color: black">About</a><br />
          <a href="memberlist.aspx" class="extralink" style="color: black">Member List</a><br />
        </div>
    </form>
</body>
</html>
