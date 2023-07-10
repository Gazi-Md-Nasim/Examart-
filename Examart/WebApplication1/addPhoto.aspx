<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addPhoto.aspx.cs" Inherits="WebApplication1.addPhoto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="icon.png" type="image/x-icon"/>
    <title>Examart</title>
    <script src="SimpleImage.js" type="text/javascript"></script>
    <script type="text/javascript">
        var image = null;
        function Upload() {
            var canvas = document.getElementById("image");
            var input = document.getElementById("fin");
            image = new SimpleImage(input);
            const imh = parseInt(image.getHeight());
            const imw = parseInt(image.getWidth());
             var x=0;
             var y=0;
            if(imh>=imw)
             {
             x = imh / 200;
             y = imw/x;
             canvas.style.height = "200px";
             canvas.style.width=y+"px";
                    }
            else
                  {
             x = imw/200;
             y = imh/x;
             canvas.style.height=y+"px";
             canvas.style.width="200px";
            }
            image.drawTo(canvas);
        }

    </script>
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
        #fin
        {
           float: left;
            background-color: #1affd1;
            width: 100%;
            border: 0;
            padding: 5px 0;
            color: black;
        }
        .btn {
            float: left;
            width: 100%;
            padding: 3px;
            margin-top:5px;
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
    #image{
        border:none;
    }
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div id="mess" class="auto-style1">
            <p id="logo">Examart</p>
             <canvas id="image"></canvas>
             <asp:FileUpload ID="fin" runat="server" onchange="Upload()" accept="image/*"/><br />
             <asp:Button cssclass="btn" ID ="Button" runat="server" Text="Done" OnClick="Button_Click" /><br />
             <asp:Label ID="message" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
