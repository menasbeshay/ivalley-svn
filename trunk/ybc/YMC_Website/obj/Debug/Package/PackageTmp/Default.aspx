<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="YMC_Website._Default" %>

<%@ Register src="Controls/NewsLetter.ascx" tagname="NewsLetter" tagprefix="uc1" %>

<%@ Register src="Controls/Login.ascx" tagname="Login" tagprefix="uc2" %>

<%@ Register src="Controls/PageLinks.ascx" tagname="PageLinks" tagprefix="uc3" %>

<%@ Register src="Controls/Skills.ascx" tagname="Skills" tagprefix="uc4" %>

<%@ Register src="Controls/News.ascx" tagname="News" tagprefix="uc5" %>

<%@ Register src="Controls/ImpLinks.ascx" tagname="ImpLinks" tagprefix="uc6" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div class="leftCol">

        <uc2:Login ID="Login1" runat="server" />
        <div class="clear">
        </div>       

        <uc5:News ID="News1" runat="server" />
        <div class="clear">
        </div>
        
        <uc6:ImpLinks ID="ImpLinks1" runat="server" />
        <div class="clear">
            </div>
               
    </div>
    <div class="content">
        <div style="margin-top: 15px; border: 1px dashed black;">
            <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
        </div>
    </div>
    <div class="rightCol">
        <uc1:NewsLetter ID="NewsLetter1" runat="server" />
        <div class="clear">
            
        </div>
        <uc3:PageLinks ID="PageLinks1" runat="server" />
        <div class="clear">
        </div>        
        <uc4:Skills ID="Skills1" runat="server" />
    </div>
    <div class="clear"></div>
    <div class="leftCol">
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
            width="200"  id="UserFiles/flash/advleft.swf" align="">
            <param name="movie" value="UserFiles/flash/advleft.swf">
            <param name="quality" value="high">
            <param name="bgcolor" value="#fff">
            <embed src="UserFiles/flash/advleft.swf" quality="high" bgcolor="#fff" width="200"
                 name="Yourfilename" align="" type="application/x-shockwave-flash"
                pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>
        </object>
    </div>
    <div class="content">
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
            width="535" id="Object1" align="">
            <param name="movie" value="UserFiles/flash/advmidlle.swf">
            <param name="quality" value="high">
            <param name="bgcolor" value="#fff">            
            <embed src="UserFiles/flash/advmidlle.swf" quality="high" bgcolor="#fff" width="535"
                 name="Yourfilename" align="" type="application/x-shockwave-flash"
                pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>
        </object>
    </div>
    <div class="rightCol">
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
            width="200" id="Object2" align="">
            <param name="movie" value="UserFiles/flash/advright.swf">
            <param name="quality" value="high">
            <param name="bgcolor" value="#fff">
            <embed src="UserFiles/flash/advright.swf" quality="high" bgcolor="#fff" width="200"
                 name="Yourfilename" align="" type="application/x-shockwave-flash"
                pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>
        </object>
    </div>
    <div class="clear">
    </div>
</asp:Content>
