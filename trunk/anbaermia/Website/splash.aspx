<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="splash.aspx.cs" Inherits="Website.splash" %>

<%@ Register src="Controls/NewsTicker.ascx" tagname="NewsTicker" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>الموقع الرسمى لنيافة الحبر الجليل الأنبا إرميا</title>
    
    <link rel="stylesheet" href="css/newstyle.css" type="text/css" media="screen" />    
    <link rel="stylesheet" href="css/social-icons.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="js/prettyPhoto/css/prettyPhoto.css" type="text/css"
        media="screen" />
    <!--[if IE]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
    
    <script src="js/jquery.js" type="text/javascript"></script>    
    <script src="js/jquery.ticker.js" type="text/javascript"></script>      
   <script type="text/javascript">
       $(document).ready(function () {
           $("#readLink").click(function () {
               $("#readingpopup").css("display", "block");
           });

           $("#readingclose").click(function () {
               $("#readingpopup").css("display", "none");
           });

           $("#verseLink").click(function () {
               $("#versepopup").css("display", "block");
           });

           $("#verseclose").click(function () {
               $("#versepopup").css("display", "none");
           });

           $("#sayingLink").click(function () {
               $("#sayingpopup").css("display", "block");
           });

           $("#sayingclose").click(function () {
               $("#sayingpopup").css("display", "none");
           });

           $("#qoutesLink").click(function () {
               $("#quotespopup").css("display", "block");
           });

           $("#quoteclose").click(function () {
               $("#quotespopup").css("display", "none");
           });

       });
   </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="main">
    <div class="newsHolder">        
        <uc1:NewsTicker ID="NewsTicker1" runat="server" />
    </div>
    <div class="mainTitles"></div>
    <div class="clear"></div>
    <div class="Daily">
    
      <ul >
    <li id="readLink">قراءات اليوم</li>
    <li id="verseLink">آية اليوم</li>
    <li id="sayingLink">أقوال الآباء القديسين</li>
    <li id="qoutesLink">كلمــات</li>
    </ul>

    
    <div class="popupbg" id="versepopup">
    <div class="close" id="verseclose"></div>
    <div class="popuptext">
        <asp:Literal ID="uiLiteralverse" runat="server" ></asp:Literal>
        </div>
    </div>
    <div class="popupbg" id="sayingpopup">
    <div class="close" id="sayingclose"></div>
    <div class="popuptext">
        <asp:Literal ID="uiLiteralsaying" runat="server" ></asp:Literal>
        </div>
    </div>
    <div class="popupbg" id="quotespopup">
    <div class="close" id="quoteclose"></div>
    <div class="popuptext">
        <asp:Literal ID="uiLiteralquotes" runat="server" ></asp:Literal>
        </div>
    </div>
    <div class="popupbg" id="readingpopup">
        <div class="close" id="readingclose"></div>
        <div class="popuptext">
        <asp:Literal ID="uiLiteralreading" runat="server" ></asp:Literal>
        </div>
    </div>
    
</div>
    
    <div class="Mainmenu_1">
    
        <div>
            <a href="Default.aspx" class="homelink"></a></div>
        <div class="clear"></div>
        <div>
         <a href="viewpage.aspx?pid=14" class="popelink"></a></div>
        <div class="clear"></div>
        <div>
         <a href="Videos.aspx" class="multilink"></a>
        </div>
        <div class="clear"></div>
        <div> <a href="ViewNews.aspx" class="newslink"></a></div>
        <div class="clear"></div>
        <div>
         <a href="viewpage.aspx?pid=10" class="churchlink"></a>
        </div>
    
    </div>
    <div class="middle"> 
    <div class="logo2"></div>
    <div class="saydna"></div>
    <div class="clear"></div>
    <div class="Title">
    <a href="viewpage.aspx?pid=4" class="titleLink"></a>
    </div>
    <div class="clear"></div>

    <div class="relatedlink">
        <ul>
         <li><a href="http://www.mesat.tv">
                            
                        موقع قناة مارمرقس الفضائية
                            
                        </a>
                        
                        
        </li>
        <li>
        <a href="http://www.copticocc.org" class="ccenter">
                            
                            موقع المركز الثقافي القبطي الأرثوذكسي 
                            </a>
        </li>
        </ul>
    </div>

    <div class="clear"></div>

    <div class="mainmenu_2">

     <div> <a href="viewpage.aspx?pid=1" class="serviceslink"></a></div>
        <div class="clear"></div>
        <div>
         <a href="viewpage.aspx?pid=13" class="contactlink"></a>
        </div>
    
    </div>

    <div class="mesatholder">
    <a href="http://mesat.tv" class="mesatlink"></a>
    </div>
    
    </div>

    <div class="socials">
    <ul>
    <li>
        <a href="http://www.twitter.com/anba_ermia" class="twitter">                             
                            </a>
        </li>
    <li>
        <a href="http://www.facebook.com/BishopErmia" class="facebook">
                            </a>
        </li>
        
    </ul>
    </div>
    
    <div class="clear"></div>
    <div style="direction:ltr;margin-top:-20px;margin-left:40px;font-weight:bold;">
    Powered by &nbsp;
                <a href="http://I-valley.com">
                <img src="images/IValley.png" title="I-VALLEY software solutions" style="vertical-align: middle;"
                    alt="I-VALLEY software solutions" /></a>
    </div>
    
    </div>
    </form>
</body>
</html>
