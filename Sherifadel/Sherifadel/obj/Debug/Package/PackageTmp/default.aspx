<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Sherifadel._default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta http-equiv="Content-Type" content="text/html; charset=windows-1256" />
<title>Engineering Group:hotels,commarcial,interior,office 
buliding,resedential,villa</title>
<meta name="keywords" content="Engineering group,hotels,commarcial,inerior,office buliding,resedential,villa,3aqarat, عقارات ,التشييد, البناء"/>
<meta name="description" content="Engineering Group Consultant Architect Eng/Sherif Adel tel. 24140762 "/>
    <link href="themes/default/default.css" rel="stylesheet" type="text/css" />
    <link href="themes/nivo-slider.css" rel="stylesheet" type="text/css" />
    <link href="themes/StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        function bgChange() {
            //debugger
            var _newCount
            var _currentCount = parseInt(document.getElementById("lblCurrentCount").value);

            if (_currentCount == 10)
                _newCount = 0;
            else
                _newCount = _currentCount;

            document.getElementById("lblCurrentCount").value = _newCount + 1;

            document.body.background = 'Images/gallery/Image' + document.getElementById("lblCurrentCount").value + '.jpg';
            //document.getElementById('content').style.backgroundImage = 'Images/gallery/Image' + document.getElementById("lblCurrentCount").value + '.jpg';
            startBGNavigation();
        }

        function startBGNavigation() {
            setTimeout("bgChange();", 10000);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="maincontent" class="maincontent">
        <div id="content" class="content">
        <img src="images/logo-watermark.png" /><br />
        <br />
&nbsp;<asp:Label ID="uiLabelBrief" runat="server" Text="This site is optimized for viewing on a screen  <br />
resolution of 1280x850 or higher. You need to<br />
have Scripting enabled in order to access all<br />
elements on the site.<br />
Please click enters to launch the site." Font-Names="Tahoma" Font-Size="12px" 
                ForeColor="#999999"></asp:Label>

            <br />
            <br />
            <asp:HyperLink ID="uiHyperLinkEnter" runat="server" NavigateUrl="~/Page.aspx">Enter Website</asp:HyperLink>

        <br />

        <%--<div id="slider" class="nivoSlider">
            <asp:Literal ID="uiLiteralBody" runat="server"></asp:Literal>
            
        </div>--%>
        </div>
    </div>
    </form>
    <input type="hidden" name="lblCurrentCount" id="lblCurrentCount" value="1" />
    <script type="text/javascript">
        /*$(window).load(function () {
        $('#slider').nivoSlider({
        directionNav: false,
        controlNav: false
        });
        });
        $(document).ready(function () {
        $('#slider').nivoSlider({
        directionNav: false,
        controlNav: false
        });
        });*/
        bgChange();
    </script>
</body>
</html>
