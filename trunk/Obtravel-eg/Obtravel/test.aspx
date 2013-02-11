<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Obtravel.test" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html >
<head runat="server">
<link href="style/default/default.css" rel="stylesheet" type="text/css" media="screen" />
    <%--<link rel="stylesheet" href="style/pascal/pascal.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="style/orman/orman.css" type="text/css" media="screen" />--%>
    <link href="style/nivo-slider.css" rel="stylesheet" type="text/css" media="screen" />
   <%-- <link href="style/reset.css" rel="stylesheet" type="text/css" media="screen" />--%>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <div class="slider-wrapper theme-default">
            <div class="ribbon"></div>
            <div id="slider" class="nivoSlider">
                <img src="../images/banner_img_1_en.gif" />
                <img src="../images/banner-2.gif" />
                <img src="../images/banner-3.gif" />
                <img src="../images/banner-4.gif" />
            </div>
        </div>
    </div>
   
        <script src="Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.nivo.slider.pack.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $('#slider').nivoSlider();
        });
</script>
    </form>
</body>
</html>
