<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="icon.png" type="image/x-icon"/>
    <meta charset="utf-8" />
    <link href="Home.css" rel="stylesheet" />
    <title>Home</title>
    <style type="text/css">
        .table{
            padding:10px;
            border-radius:5px;
            margin:10px;
            background-color:#e4e4e4;
            box-shadow:5px 5px 5px grey;
        }
        .sectionlist{
            width:320px;
            padding:15px;
            margin:10px;
        }
        .viewlink {
            text-decoration: none;
            color: black;
            font-family: 'Times New Roman';
            font-size: 25px;
        }

        .table:hover {
            background-color: #acacac;
            transition: ease;
        }
        .tabaddbutton{
            background-color:#1763ff;
            border:none;
            font-size:20px;
            font-weight:bold;
            color:white;
            cursor:pointer;
            font-family:'Comic Sans MS';
        }
        .tabdelbutton{
            background-color:#d70000;
            border:none;
            font-size:20px;
            font-weight:bold;
            color:white;
            cursor:pointer;
            font-family:'Comic Sans MS';
        }
        .tab{
            border-radius:10px;
            box-shadow:5px 5px 5px grey;
            font-family:'Times New Roman';
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
        #searchbtn:hover{
            background-color:#0c5bb1;
            transition: 0.5s ease;
            border-radius:0px;
        }
        .searchtab{
            margin-bottom: 10px;
            padding:10px;
            border-radius: 10px;
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

      <div><img src="welcome.jpg" alt="Welcome" style="width: 100%"/></div> 
      <div>
      <ul>
        <li><a class="active">Home</a></li>
        <li><a href="complete_exam.aspx">Completed Exams</a></li>
        <li><a href="feed_back.aspx">Discussion Form</a></li>
        <li><a href="resources.aspx">Resources</a></li>
        </ul></div><hr/>

        <asp:Table ID="Tab" CssClass="tab" runat="server" HorizontalAlign="Center" Width="700px" BackColor="#CCCCCC">
            <asp:TableHeaderRow><asp:TableHeaderCell ColumnSpan="2" Font-Size="25px">Add Sections</asp:TableHeaderCell></asp:TableHeaderRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Right">Section Name:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="secName" runat="server" Height="50px" Width="200px" MaxLength="100" Rows="5"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Right">Add Link:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="secLink" runat="server" Height="50px" Width="200px" MaxLength="100" Rows="5"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Right">Background Image:</asp:TableCell>
                <asp:TableCell>
                    <asp:FileUpload ID="imgup" runat="server" accept="image/*"/></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                    <asp:Button ID="secaddbtn" runat="server" CssClass="tabaddbutton" Text="Add" Width="80%" Height="40px" OnClick="secaddbtn_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableHeaderRow><asp:TableHeaderCell ColumnSpan="2" Font-Size="25px">Delete Sections</asp:TableHeaderCell></asp:TableHeaderRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Right">Section Name:</asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="delSection" runat="server" Height="50px" Width="200px" MaxLength="100" Rows="5"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
              <asp:TableRow>
                <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                    <asp:Button ID="secdelbtn" runat="server" CssClass="tabdelbutton" Text="Delete" Width="80%" Height="40px" OnClick="secdelbtn_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                    <asp:Label ID="secMessage" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table><br />
            <asp:Table ID="Table1" CssClass="searchtab" runat="server" Width="510px" HorizontalAlign="Center" Height="100px" BackColor="#CCCCCC">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="searchtext" runat="server" placeholder="Insert sector name" Height="35px" Width="400px" MaxLength="100"></asp:TextBox></asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="searchbtn" runat="server" Text="Search" Height="35px"  OnClick="searchbtn_Click"/></asp:TableCell>
            </asp:TableRow>
        </asp:Table><br />

        <p style="font-family:'Times New Roman';text-align:center;font-weight:bolder;font-size:45px;">Sectors</p>
        <br />
       
        <asp:ListView ID="ListView" runat="server" GroupItemCount="5" GroupPlaceholderID="groupPlaceHolder1" ItemPlaceholderID="itemPlaceHolder1">
            <LayoutTemplate>
                <table>
                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            <GroupTemplate>
                    <tr>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                    </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td>
                <div class="sectionlist">
                <a href='<%#Eval("link") %>' class="viewlink">
                    <asp:Table ID="Table" runat="server" CssClass="table" Height="300px" Width="350px">
                        <asp:TableHeaderRow><asp:TableHeaderCell HorizontalAlign="Center" VerticalAlign="Middle">
                            <asp:Label ID="sectionHead" runat="server" Text='<%#Eval("Name") %>'></asp:Label></asp:TableHeaderCell></asp:TableHeaderRow>
                        <asp:TableRow><asp:TableCell HorizontalAlign="Center" VerticalAlign="Middle">
                            <asp:Image ID="sectionPicture" runat="server" ImageAlign="Middle" Width="300px" ImageUrl='<%#Eval("picture") %>' Height="200px" /></asp:TableCell></asp:TableRow>
                    </asp:Table>
                </a></div></td>
            </ItemTemplate>
        </asp:ListView>

        <div id="footer"><hr style="width: 80%"/>
            <h1 class="name">Examart</h1>
            <a href="contact_us.aspx" class="extralink" style="color:black">Contact us</a><br/>
            <a href="about_us.aspx" class="extralink" style="color: black">About</a><br />
            <asp:HyperLink ID="HyperLink1" CssClass="extralink" runat="server" NavigateUrl="~/memberlist.aspx" ForeColor="Black">Member List</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" CssClass="extralink" runat="server" NavigateUrl="~/adminlist.aspx" ForeColor="Black">Admin List</asp:HyperLink>
        </div>
    </form>
</body>
</html>
