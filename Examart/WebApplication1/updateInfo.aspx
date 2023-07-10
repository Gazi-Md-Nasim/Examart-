<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateInfo.aspx.cs" Inherits="WebApplication1.updateInfo" %>

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
            width: 380px;
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
            float: left;
            background: white;
            width: 100%;
            border: 1px solid black;
            padding: 5px 0;
            color: black;
        }

        .btn {
            float: left;
            width: 100%;
            padding: 3px;
            background-color: rgb(59, 133, 237);
            cursor: pointer;
            border: 1px solid #ffffff;
        }
        #message {
            width: 100%;
            font-size: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="mess">
            <p id="logo">Examart</p>
            <table width="100%">
                <tr>
                    <td colspan="2"><asp:Button cssclass="btn" ID="btnName" runat="server" Text="Update your Name" OnClick="btnName_Click" /></td>
                </tr>
                <tr>
                    <td><asp:TextBox cssclass="input" ID="nameBox" runat="server" placeholder="Enter the Name"></asp:TextBox></td>
                    <td><asp:Button cssclass="btn" ID="btnChangeName" runat="server" Text="Change" OnClick="btnChangeName_Click" /></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Button cssclass="btn" ID="dept" runat="server" Text="Update your Deprtment Name" OnClick="btnDept_Click" /></td>
                </tr>
                <tr>
                    <td><asp:TextBox cssclass="input" ID="deptbox" runat="server" placeholder="Department"></asp:TextBox></td>
                    <td><asp:Button cssclass="btn" ID="deptchangebtn" runat="server" Text="Change" OnClick="btnChangeDept_Click" /></td>
                </tr>

                <tr>
                    <td colspan="2"><asp:Button cssclass="btn" ID="varsity" runat="server" Text="Update your Universuty Name" OnClick="btnVarsity_Click" /></td>
                </tr>
                <tr>
                    <td><asp:TextBox cssclass="input" ID="varsitybox" runat="server" placeholder="University"></asp:TextBox></td>
                    <td><asp:Button cssclass="btn" ID="varsitychangebtn" runat="server" Text="Change" OnClick="btnChangevarsity_Click" /></td>
                </tr>

                <tr>
                    <td colspan="2"><asp:Button cssclass="btn" ID="adrs" runat="server" Text="Update your Address" OnClick="btnAdrs_Click" /></td>
                </tr>
                <tr>
                    <td><asp:TextBox cssclass="input" ID="adrsbox" runat="server" placeholder="Address"></asp:TextBox></td>
                    <td><asp:Button cssclass="btn" ID="adrschangebtn" runat="server" Text="Change" OnClick="btnChangeAdrs_Click" /></td>
                </tr>

                <tr>
                    <td colspan="2"><asp:Button cssclass="btn" ID="btnPass" runat="server" Text="Update Password" OnClick="btnPass_Click" /></td>
                </tr>
                <tr>
                    <td><asp:TextBox type="password" cssclass="input" ID="passBox" runat="server" placeholder ="Enter old password"></asp:TextBox></td>
                    <td rowspan="3"><asp:Button cssclass="btn" ID="btnChangePass" runat="server" Text="Change" OnClick="btnChangePass_Click" /></td>
                </tr>
                <tr>
                    <td><asp:TextBox type="password" cssclass="input" ID="newPassBox" runat="server" placeholder ="Enter new password"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td><asp:TextBox type="password" cssclass="input" ID="reNewPassBox" runat="server" placeholder ="Re enter old password"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td colspan="2"><asp:Label ID="message" runat="server" ></asp:Label><br /></td>
                </tr>
            </table>
 <br />
             <a href ="profile.aspx" style="text-decoration:underline;color:white">Go to profile</a>
        </div>
    </form>
</body>
</html>
