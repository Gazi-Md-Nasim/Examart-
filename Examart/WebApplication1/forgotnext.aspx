<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotnext.aspx.cs" Inherits="WebApplication1.forgotnext" %>

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
            width: 280px;
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
        }

        .btn {
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
            A code is sent in your Email<br />Enter the code<br />
            <asp:TextBox cssclass="input" ID="box" runat="server" placeholder="Enter the code"></asp:TextBox><br />
            <asp:Button cssclass="btn" ID="btn2" runat="server" Text="Submit" OnClick="btn2_Click" />
            <asp:Label ID="message" runat="server" ></asp:Label><br />
            <asp:Button cssclass="btn" ID="Button1" runat="server" Text="Re-send code" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
