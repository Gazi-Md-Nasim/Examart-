<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="WebApplication1.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="icon.png" type="image/x-icon"/>
    <title>Profile</title>
    <style type="text/css">
        body
        {
            margin:5px;
            padding:0;
            background:url("newprofile.jpg") no-repeat;
            background-size:cover;
            background-attachment:fixed;
            color:white;
            font-size:20px;
        }
        #logo {
            margin-top: 5px;
            margin-left:0;
            margin-bottom:10px;
            text-align: left;
            color: rgb(32, 147, 255);
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            font-size: 30px;
            font-style: italic;
            font-weight: bold;
            text-decoration:none;
            cursor:pointer;
        }
        .btn
        {
            width: 300px;
            height:35px;
            padding: 3px;
            background-color: #1affd1;
            cursor: pointer;
            border: 1px solid #ffffff;
            border:none;
        }
        .btn:hover
        {
            background-color: #007ff8;
            transition:0.5s ease;
        }
        
        .auto-style1 {
            text-align: center;
        }
        .info{
            width:70px;
        }
                
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
        <a href="Home.aspx" id="logo">Examart</a><br /> </div><br /><br />

            <asp:Table ID="Table" runat="server" HorizontalAlign="Center" Width="700px">
                <asp:TableRow>
                    <asp:TableCell RowSpan="5" HorizontalAlign="Left"><asp:Image ID="image" runat="server" Height="200px" /></asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left"><asp:Label ID="Label1" Text="Name: " runat="server"></asp:Label></asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left"><asp:Label ID="name" runat="server"></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left"><asp:Label ID="Label2" Text="Email" runat="server"></asp:Label></asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left"><asp:Label ID="email" runat="server"></asp:Label></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left"><asp:Label ID="Label3" Text="Department" runat="server"></asp:Label></asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left"><asp:Label ID="dept" runat="server"></asp:Label></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left"><asp:Label ID="Label4" Text="University" runat="server"></asp:Label></asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left"><asp:Label ID="varsity" runat="server"></asp:Label></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left"><asp:Label ID="Label5" Text="Address" runat="server"></asp:Label></asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left"><asp:Label ID="adrs" runat="server"></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center" ColumnSpan="3"><asp:Button cssclass="btn" ID="upload" runat="server" Text="Upload image" OnClick="upload_Click" /></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center" ColumnSpan="3"><asp:Button cssclass="btn" ID="btn" runat="server" Text="Update Info" OnClick="btn_Click" /></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center" ColumnSpan="3"><asp:Button cssclass="btn" ID="out" runat="server" Text="Log Out" OnClick="out_Click" /></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center" ColumnSpan="3"><asp:Button cssclass="btn" ID="delete" runat="server" Text="Delete Account" OnClick="delete_Click" /></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
    </form>
</body>
</html>
