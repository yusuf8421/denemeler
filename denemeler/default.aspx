<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="denemeler._default" %>

<%@ Register Assembly="DevExpress.XtraReports.v19.2.Web.WebForms, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Dashboard.v19.2.Web.WebForms, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
     <meta name="viewport" content="width=device-width, initial-scale=1"><link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css'>
    <link href="style.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

   <%-- <script>
        $(function () {
            $("#btn").click(function () {
                document.getElementById("txt1").innerText = y;
            })
        }
        )
    </script>--%>

</head>

<body>
    <form id="form1" runat="server">
       <%-- <div>
            <p>Click the button to get your coordinates.</p>
            <p id="demo"></p>
           
       <button id="btn" type="button" onclick="weather()">Try it</button>
            <asp:TextBox ID="txt1" runat="server"></asp:TextBox>  
            <asp:TextBox ID="txt2" runat="server"></asp:TextBox>
        </div>--%>
 
         <div class='container-fluid'>
  <div class='row'>
   <div class='col-lg-12'>
    <h1 class='text-center'>Local Weather with Dark Sky API</h1>
   </div>
  </div>
  <div class='row' id='location'>
   <div class='col-lg-12' id='address'>
   </div>
  </div>
  <div class='row'>
   <div class='col-lg-4'></div>
   <div class='col-lg-4' style = 'margin-left: 5%'>
		 <canvas id = 'icon'></canvas>
		</div>
   <div class='col-lg-4'></div>
  </div>
  <div class='row'>
   <div class='col-lg-5'></div>
   <div class='col-lg-1' id='temp'>
   </div>
   <div class='col-lg-1' id='toggleScale'>
       <a href='#'>
     <span id='far'> f </span>
           <dx:ASPxTextBox ID="txt1" runat="server" Width="170px">

           </dx:ASPxTextBox>
    </a>
    <span> | </span>
    <a href='#'>
        <dx:ASPxTextBox ID="txt2" runat="server" Width="170px">

        </dx:ASPxTextBox>
     <span id='cel'> c </span>
    </a>
   </div>
   <div class='col-lg-5'></div>
  </div>
 </div>
    </form>
     
</body>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
<script src='https://gitcdn.link/cdn/darkskyapp/skycons/master/skycons.js'></script>

<script src="script.js"></script>
</html> 