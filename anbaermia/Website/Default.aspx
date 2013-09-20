<%@ Page Title="" Language="C#" MasterPageFile="~/newTheme.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Website.Default" %>

<%@ MasterType VirtualPath="~/newTheme.Master" %>
<%@ Register src="Controls/NewsSlider.ascx" tagname="NewsSlider" tagprefix="uc2" %>

<%@ Register src="Controls/ViewDayVerse.ascx" tagname="ViewDayVerse" tagprefix="uc4" %>

<%@ Register src="Controls/ViewReading.ascx" tagname="ViewReading" tagprefix="uc5" %>

<%@ Register src="Controls/ViewFathersQuote.ascx" tagname="ViewFathersQuote" tagprefix="uc6" %>

<%@ Register src="Controls/ViewQuotes.ascx" tagname="ViewQuotes" tagprefix="uc7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script src="js/script.js" type="text/javascript"></script>
 
     <script type="text/javascript">
         $(document).ready(function () {
             $('#jslidernews2').lofJSidernews({ interval: 5000,
                 easing: 'easeInOutQuad',
                 duration: 1200,
                 auto: true,
                 mainWidth: 520,
                 mainHeight: 240,
                 navigatorHeight: 78,
                 navigatorWidth: 300,
                 maxItemDisplay: 3
             });


         });

    </script>
    <link href="css/style2.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="newsSliderHolder">
     <uc2:NewsSlider ID="NewsSlider1" runat="server" />
</div>
<div class="sydna"></div>
<div class="clear" style="height:10px;"></div>
<div class="dailyTips">
<div class="box-container">
                                <img src="images/mono-icons/article32.png" class="box-icon" alt="pic" />
                                <h6>
                                    قراءات اليوم</h6>
                                <div class="box-divider">
                                </div>
                                <uc5:ViewReading ID="ViewReading1" runat="server" />                                
                            </div>
    
                            <div class="box-container">
                                <img src="images/mono-icons/boxupload32.png" class="box-icon" alt="pic" />
                                <h6>
                                    آية اليوم</h6>
                                <div class="box-divider">
                                </div>
                                <uc4:ViewDayVerse ID="ViewDayVerse1" runat="server" />
                                
                            </div>
                            <div class="box-container">
                                <img src="images/mono-icons/bargraph32.png" class="box-icon" alt="pic" />
                                <h6>
                                    من أقوال الآباء القديسين
                                </h6>
                                <div class="box-divider">
                                </div>
                                <uc6:ViewFathersQuote ID="ViewFathersQuote1" runat="server" />                                
                            </div>
                            
 </div>
<div class="socialHolder">
<a class="twitter-timeline" href="https://twitter.com/Anba_Ermia" data-widget-id="345102310994747392"
                                data-tweet-limit="1" data-border-color="#000" data-chrome="nofooter">
                                Tweets by @Anba_Ermia</a>
                            <script>                                !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + "://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } } (document, "script", "twitter-wjs");</script>
                            <div class="clear" style="height:2px;"></div>
<div style="background:#fff;border:1px solid #ccc;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;">
<fb:like-box href="https://www.facebook.com/BishopErmia" width="220" height="40"
                                show_faces="false" colorscheme="light" border_color="#fff" header="false">
                            </fb:like-box></div>
                            
                            
</div>
</asp:Content>
