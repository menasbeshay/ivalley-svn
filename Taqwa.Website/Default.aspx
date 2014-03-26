<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Taqwa.Website.Default" %>

<%@ Register src="~/Controls/News.ascx" tagname="News" tagprefix="uc1" %>

<%@ Register src="Controls/JoinTerms.ascx" tagname="JoinTerms" tagprefix="uc2" %>

<%@ Register src="Controls/Vision.ascx" tagname="Vision" tagprefix="uc3" %>

<%@ Register src="Controls/Mission.ascx" tagname="Mission" tagprefix="uc4" %>
<%@ Register src="Controls/TeamWork.ascx" tagname="TeamWork" tagprefix="uc5" %>

<%@ Register src="Controls/HomeMain.ascx" tagname="HomeMain" tagprefix="uc6" %>

<%@ Register src="Controls/HomeFooter.ascx" tagname="HomeFooter" tagprefix="uc7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table width="980" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td height="5" colspan="3">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="11">
                                                    </td>
                                                    <td width="313" style="vertical-align:top;">
                                                         <uc2:JoinTerms ID="JoinTerms1" runat="server" />
                                                    </td>
                                                    <td width="656" rowspan="2" style="vertical-align:top;">
                                                        <table width="644" height="213" border="1" align="center" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td height="211">
                                                                    <table width="624" border="0" align="center" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td dir="rtl">                                                                                
                                                                                <uc6:HomeMain ID="HomeMain1" runat="server" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <table width="624" border="0" align="center" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                        <td width="250"  colspan="3" >
                                                                            <uc3:Vision ID="Vision1" runat="server" />
&nbsp;</td>
                                                                           
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <table width="624" border="0" align="center" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <td width="258" align="right" style="width: 300px">
                                                                            &nbsp;
                                                                                <uc5:TeamWork ID="TeamWork1" runat="server" />
                                                                            </td>
                                                                            <td width="11">
                                                                            </td>
                                                                            <td width="258" align="right" style="width: 300px">  
                                                                            &nbsp;                                                                              
                                                                                <uc4:Mission ID="Mission1" runat="server" />
                                                                            </td>
                                                                        </tr>
                                                                        </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td >
                                                    </td>
                                                    <td style="vertical-align:top;">

                                                        
                                                        <uc1:News ID="News1" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" >
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                       
                                                    </td>
                                                    <td colspan="2">
                                                        <table width="967" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="690" rowspan="2">
                                                                    <table width="685" border="1" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td>
                                                                                <table width="667" border="0" align="center" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td colspan="2" height="10">
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="667" colspan="2">                                                                                        
                                                                                            <uc7:HomeFooter ID="HomeFooter1" runat="server" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="10">
                                                                    &nbsp;
                                                                </td>
                                                                <td width="268">
                                                                    <img src="images/time.jpg" width="268" height="103" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <img src="images/tell.jpg" width="268" height="87" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" height="10">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
                                                            width="980" height="184">
                                                            <param name="movie" value="images/Flash_Button.swf" />
                                                            <param name="quality" value="high" />
                                                            <embed src="images/Flash_Button.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer"
                                                                type="application/x-shockwave-flash" width="980" height="184"></embed>
                                                        </object>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" height="10">
                                                    </td>
                                                </tr>
                                            </table>
</asp:Content>
