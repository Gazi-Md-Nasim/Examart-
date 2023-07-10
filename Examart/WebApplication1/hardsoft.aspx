<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hardsoft.aspx.cs" Inherits="WebApplication1.hardsoft" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="icon.png" type="image/x-icon"/>
    <title>Hardware and Software</title>
    <style type="text/css">
        #Button1,#Button2
        {
            border:none;
            color:white;
            background-color:rgb(7, 161, 239);
            font-weight:bold;
            font-size:20px;
            width:200px;
            margin-left:50%;
            margin-bottom:10px;
            transform:translate(-50%);
            cursor:pointer;
            padding:10px 0px;
            margin-bottom:10px;
        }
        #Button1:hover
        {
            box-shadow: 0 0 30px rgb(76, 161, 241);
        }
        #LinkButton2 {
            color: white;
            border-radius: 5px;
            background-color: rgb(7, 161, 239);
            font-weight: bold;
            font-size: 20px;
            width: 200px;
            cursor: pointer;
            padding: 10px 10px;
            text-decoration: none;
            margin-right: 5px;
            float: right;
        }
        #Label7 {
            color: black;
            background-color: rgb(255,255,255);
            font-weight: bold;
            font-size: 20px;
            width: 120px;
            height:25px;
            padding: 10px 10px;
            text-decoration: none;
            position:fixed;
            top: 5px;
            right:10px;
        }

        table {
            width: 100%;
        }

        body {
            margin: 0;
            padding: 0;
            color: black;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        #head {
            margin: 5px;
            padding: 15px 0;
            font-size: 20px;
            background-color: rgb(143, 217, 250);
            text-align: center;
        }
#question {
    border: 1px solid black;
    margin: 5px;
    padding: 5px;
    font-size: 20px;

}
.name {
    margin-top: 5px;
    text-emphasis: none;
    text-decoration: none;
    margin-left: 5px;
    color: rgb(18, 131, 254);
    font-size: 30px;
    font-weight: bold;
    font-style: italic;
}

.examname {
    margin-top: 5px;
    text-emphasis: none;
    text-decoration: none;
    margin-left: 5px;
    color:#000000;
    font-size: 30px;
    font-weight: bold;
    font-style: italic;
}
       .passfail{
           font-weight:bolder;
       }
       #Label6{
            color: black;
            font-weight: bold;
            font-size: 20px;
            padding: 10px;
            text-decoration: none;
            text-align:center;
        }
       }
    </style>
</head>
<body>

    <script type="text/javascript">

        function startCountdown(hour,minute,timeLeft)
        {
            timeLeft = hour * 3600 + minute * 60 + timeLeft + 1;
			var interval=setInterval(countdown, 1000);
			function countdown(){
				if(--timeLeft>0)
				{
					update();
				}
				else{
					clearInterval(interval);
					update();
					completed();
				}
			}
			
            function update() {
                hours = Math.floor(timeLeft / 3600);
				min = Math.floor((timeLeft%3600)/60);
				sec = timeLeft%60;
				document.getElementById('Label7').innerHTML=hours+' : '+min+' : '+sec;
			}
			
            function completed() {
                document.getElementById("<%=Button1.ClientID%>").click();
			}
        }

		</script>
    <form id="form1" runat="server">
        <div>
             <h2 class="name">
                <a href="Home.aspx" class="name">Examart</a></h2>
            <asp:Label ID="Label7" runat="server"></asp:Label>
            <div id="head">
                <table>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="ExamName" runat="server" Text="Hardware and Software" CssClass="examname"></asp:Label>
                        </td> 
                    </tr>
                    <tr>
                       <td style= "text-align:center;margin-right:3px">
                            <asp:Label ID="grades" runat="server"></asp:Label>
                      </td>
                      <td style= "text-align:center;margin-right:3px">
                            <asp:Label ID="passFail" runat="server" CssClass="passfail"></asp:Label>
                    </td> 
                     <td>
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Try again</asp:LinkButton>
                    </td>
                    </tr>
                </table>
            </div><br />
            <asp:Label ID="Label6" runat="server"></asp:Label><br />
            <div id="question">
                <asp:Label ID="Ques1" runat="server"></asp:Label><br />
                <asp:RadioButtonList ID="Option1" runat="server">
                    <asp:ListItem Text="Latin scripts" Value="1"></asp:ListItem>
                    <asp:ListItem Text="English scripts" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Complex scripts" Value="3"></asp:ListItem>
                    <asp:ListItem Text="None of above" Value="4"></asp:ListItem>
                </asp:RadioButtonList><br />
                <asp:Label ID="Label1" runat="server" ></asp:Label><br />

                <asp:Label ID="Ques2" runat="server"></asp:Label><br />
                <asp:RadioButtonList ID="Option2" runat="server">
                    <asp:ListItem Text="Standard keys" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Function keys" Value ="2"></asp:ListItem>
                    <asp:ListItem Text="Navigation keys" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Special purpose key" Value="4"></asp:ListItem>
                </asp:RadioButtonList><br />
                <asp:Label ID="Label2" runat="server" ></asp:Label><br />


                <asp:Label ID="Ques3" runat="server"></asp:Label><br />
                <asp:RadioButtonList ID="Option3" runat="server">
                    <asp:ListItem Text="Keyboard" Value="1"></asp:ListItem>
                    <asp:ListItem Text="SSD" Value="2"></asp:ListItem>
                    <asp:ListItem Text="HDD" Value="3"></asp:ListItem>
                </asp:RadioButtonList><br />
                <asp:Label ID="Label3" runat="server"></asp:Label><br />

                <asp:Label ID="Ques4" runat="server"></asp:Label><br />
                <asp:RadioButtonList ID="Option4" runat="server">
                    <asp:ListItem Text="Access point" Value="1"></asp:ListItem>
                    <asp:ListItem Text="NIC card" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Analog Modem" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Firewire" Value="4"></asp:ListItem>
                </asp:RadioButtonList><br />
                <asp:Label ID="Label4" runat="server"></asp:Label><br />

                <asp:Label ID="Ques5" runat="server"></asp:Label><br />
                <asp:RadioButtonList ID="Option5" runat="server">
                    <asp:ListItem Text="Supercomputer" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Personal computer" Value="2"></asp:ListItem>
                    <asp:ListItem Text="PLC" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Automobile" Value="4"></asp:ListItem>
                </asp:RadioButtonList><br />
                <asp:Label ID="Label5" runat="server"></asp:Label><br />
            </div>
            <asp:Label ID="Message" runat="server"></asp:Label>  <br /> 
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click"/><br />
        </div>
    </form>
</body>
</html>
