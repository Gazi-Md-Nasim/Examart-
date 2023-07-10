<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createNew.aspx.cs" Inherits="WebApplication1.createNew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="icon.png" type="image/x-icon"/>
    <title>Examart</title>
    <style type="text/css">
         body
        {
            margin:0;
            padding:0;
            background:url('AI.jpg') no-repeat;
            background-size:cover;
            background-attachment:fixed;
        }
        #mess {
            width: 560px;
            padding: 40px;
            border-radius: 40px;
            background-color: rgba(1, 68, 207, 0.4);
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-50%);
            color: white;
            border-radius: 3px;
        }
        #logo {
            margin-top: 10px;
            text-align: center;
            color: rgb(32, 147, 255);
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            font-size: 60px;
            font-style: italic;
            font-weight: bold;
        }
        .input {
            float: right;
            background: white;
            width: 100%;
            border: 0;
            padding: 5px 0;
            color: black;
            font-weight:bolder;
        }

        #btn {
            float: left;
            width: 100%;
            padding: 3px;
            background-color: #1affd1;
            cursor: pointer;
            border: 1px solid #ffffff;
        }
        #message {
            width: 100%;
            font-size: 20px;
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="mess">
            <p id="logo">Examart</p>
            <asp:Table ID="Table1" BorderWidth ="0" runat="server" Width="100%" Style="text-align:right">
                <asp:TableRow>
                    <asp:TableCell>Name:</asp:TableCell>
                    <asp:TableCell><asp:TextBox cssclass="input" ID="name" runat="server" placeholder="Enter your name"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Email:</asp:TableCell>
                    <asp:TableCell><asp:TextBox cssclass="input" ID="email" runat="server" placeholder="Enter your email"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Department:</asp:TableCell>
                    <asp:TableCell><asp:TextBox cssclass="input" ID="department" runat="server" placeholder="Department Name"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>University:</asp:TableCell>
                    <asp:TableCell><asp:TextBox cssclass="input" ID="varsity" runat="server" placeholder="Enter your institute name"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Address:</asp:TableCell>
                    <asp:TableCell><asp:TextBox cssclass="input" ID="address" runat="server" placeholder="Enter your Address"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Password:</asp:TableCell>
                    <asp:TableCell><asp:TextBox cssclass="input" ID="pass" runat="server" placeholder="Enter the password" type="password"></asp:TextBox></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>Re-Enter Password:</asp:TableCell>
                    <asp:TableCell><asp:TextBox cssclass="input" ID="repass" runat="server" placeholder="Re-enter the password" type="password"></asp:TextBox></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">
                        <asp:Button ID="btn" runat="server" Text="Submit" OnClick="btn_Click"/></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2"><asp:Label ID="message" runat="server"></asp:Label></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
