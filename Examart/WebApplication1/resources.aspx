<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resources.aspx.cs" Inherits="WebApplication1.resources" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="icon.png" type="image/x-icon"/>
    <link href="Home.css" rel="stylesheet" />
    <title>Resources</title>
    <style type="text/css">
        #addfile{
            width: 80%;
            background-color:#3366FF;
            color: white;
            height:50px;
            cursor:pointer;
            border:none;
        }
        #deletefile {
            width: 80%;
            background-color:#ff0000;
            color: white;
            height: 50px;
            cursor: pointer;
            border: none;
        }
        #addfile:hover{
            background-color:deepskyblue;
        }
        #deletefile:hover {
            background-color: #ff3300;
        }
        .link{
            text-decoration:none;
            color:black;
            font-family:'Times New Roman';
            font-weight:bolder;
            font-size:25px;
            padding-left: 20px;
            padding-right: 10px;
            margin-bottom:5px;
            cursor:pointer;
        }
        .dept{
            text-decoration:none;
            color:rgb(56, 59, 252);
            font-family:'Times New Roman';
            font-weight:bolder;
            font-size:20px;
            padding: 5px;
        }
        .link:hover{
            color:coral;
        }
        .booklist {
            color: black;
            font-family: 'Times New Roman';
            font-weight: bolder;
            font-size: 45px;
            padding:10px;
        }
        .tab{
            border-radius:10px;
            box-shadow:5px 5px 5px grey;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
        <li><a href="feed_back.aspx">Discussion Form</a></li>
        <li><a class="active">Resources</a></li>
        </ul></div><hr/>
        </div>
        <asp:Table ID="Table" runat="server" CssClass="tab" BackColor="#CCCCCC" CaptionAlign="Right" Width="700px" HorizontalAlign="Center">
            <asp:TableRow>
                <asp:TableHeaderCell ColumnSpan="2"><h1>Add File</h1></asp:TableHeaderCell>
                <asp:TableHeaderCell ColumnSpan="2"><h1>Delete File</h1></asp:TableHeaderCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Right"><h3>Subject Name:</h3></asp:TableCell>
                <asp:TableCell><asp:TextBox ID="subnameadd" runat="server" Rows="5" MaxLength="100" BorderStyle="Solid" Columns="25" Wrap="False" Height="50px" Width="200px"></asp:TextBox></asp:TableCell>
                <asp:TableCell RowSpan="3" HorizontalAlign="Right"><h3>Subjct Name:</h3></asp:TableCell>
                <asp:TableCell RowSpan="3"><asp:TextBox ID="subnamedel" runat="server" Rows="5" MaxLength="100" BorderStyle="Solid" Columns="25" Wrap="False" Height="50px" Width="200px"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Right"><h3>Department:</h3></asp:TableCell>
                <asp:TableCell><asp:TextBox ID="deptadd" runat="server" Rows="5" MaxLength="100" BorderStyle="Solid" Columns="25" Wrap="False" Height="50px" Width="200px"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Right"><h3>Upload File:</h3></asp:TableCell>
                <asp:TableCell>
                    <asp:FileUpload ID="fileup" runat="server" accept="pdf/*"/></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2" HorizontalAlign="Center"><asp:Button ID="addfile" runat="server" Text="Add" Font-Bold="True" OnClick="addfile_Click" /></asp:TableCell>
                <asp:TableCell ColumnSpan="2" HorizontalAlign="Center"><asp:Button ID="deletefile" runat="server" Text="Delete" Font-Bold="True" OnClick="deletefile_Click" /></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <br />
        <asp:Label ID="booklist" runat="server" Text="Book List:" CssClass="booklist"></asp:Label><br /><br />
        
        <asp:Repeater ID="Repeater1" runat ="server">
            <ItemTemplate>
                <br />
                <asp:LinkButton ID="Link" href='<%#Eval ("Location") %>' runat="server" Text='<%#Eval ("Name") %>' target="_blank" CssClass="link"></asp:LinkButton>
                <asp:Label ID="Label1" runat="server" Text="Department:" CssClass="dept"></asp:Label>
                <asp:Label ID="dept" runat="server" Text='<%#Eval ("Department") %>' CssClass="dept"></asp:Label>
                <br />
            </ItemTemplate>
        </asp:Repeater>
        <br />
        <div id="footer"><hr style="width:80%"/>
            <h1 class="name">Examart</h1>
            <a href="contact_us.aspx" class="extralink" style="color: black">Contact us</a><br/>
            <a href="about_us.aspx" class="extralink" style="color:black">About</a>
        </div>
    </form>
</body>
</html>
