<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="website.Default" %>
<%@ Register src="UC/ProjectSlider.ascx" tagname="ProjectSlider" tagprefix="uc1" %>
<%@ Register src="UC/ProductSlider.ascx" tagname="ProductSlider" tagprefix="uc2" %>
<%@ Register src="UC/EPCSlider.ascx" tagname="EPCSlider" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="news">
        <h1>
            About Us</h1>
        <marquee direction="up" height="90" width="309" scrolldelay="1" scrollamount="1"
            onmouseover="this.stop()" onmouseout="this.start()">
                                
                                <div class="news-titolo">
                                <strong>EGEMECH</strong></div>
                                <div class="news-descrizione">Has made its presence in the business of supply, testing
and commissioning of electro-mechanical solutions, airconditioning,
smoke management and ventilation systems.</div>
                                
                                
                                <div class="news-titolo">
                                <strong>EGEMECH</strong></div>
                                <div class="news-descrizione">Is committed to provide total engineering solution with
stiff attention to quality, reliability, value, design services
and electromechanical supply services providing special
facilities for the onshore and offshore oil and gas industry.</div>
                                
                                
                                <div class="news-titolo">
                                <strong>EGEMECH</strong></div>
                                <div class="news-descrizione">Erects a task force adapted to the targets of the project,
in terms of process requirements, costs and delivery time.</div>
                                

                                <div class="news-titolo">
                                <strong>EGEMECH</strong></div>
                                <div class="news-descrizione">Is an electromechanical Egyptian shareholding company
and we are now the authorized distributors for DUNHAM
BUSH, DYNAIR and ATS.</div></marquee>
        <div class="news-leggi">
            &raquo; <a href="#">About Us</a></div>
    </div>
    <uc1:ProjectSlider ID="ProjectSlider1" runat="server" />


<!-- products -->

    <uc2:ProductSlider ID="ProductSlider1" runat="server" />
    

<!-- EPC --->

    <uc3:EPCSlider ID="EPCSlider1" runat="server" />

    <div id='cerca'>
        <strong>Search</strong>
        <form name='cercaform' action='cerca.php' method='post'>
        <input onfocus="if (this.value == 'Search in website...') { this.value=''; this.style.color = '#666'; };"
            name='strricerca' id='strricerca' value='Search in website...' type='text' class='ricerca'
            tabindex='1'>
        <input type='image' class='entra' src='../images/cerca.jpg' />
        <input type='hidden' name='js_autodetect_results' value='SMPREF_JS_OFF'>
        <input type='hidden' name='just_logged_in' value='1'>
        <div id='avanzata'>
            <div id='slider2'>
                <div class='pulsante' id='one-header'>
                    &raquo; Advanced search
                </div>
               
            </div>
        </div>
        </form>
        <a href="#">
            <img src="../images/design.jpg" alt="design" border="0" /></a></div>
    <div id="bannerHome">
        <div id="focus">
            <h2>
                focus</h2>
            <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr>
                        <td valign="center" width="45" height="40">
                            <img src="../images/ERP.jpg" alt="" width="30" height="30" />
                        </td>
                        <td valign="center">
                            <a href="#"> The European Directive 2009/125/UE  </a>
                        </td>
                    </tr>
                    <tr>
                        <td valign="center" height="40">
                            <a href="#">
                                <img src="../images/ico_incendio.jpg" alt="" width="30" height="30" /></a>
                        </td>
                        <td valign="center">
                            <a href="#">High temperature and car park ventilation</a>
                        </td>
                    </tr>
                    
                </tbody>
            </table>
        </div>
        <a href="#">
            <img src="../images/cdHome.jpg" alt="blowdyn" border="0" /></a> <a href="#">
                <img src="../images/bannerHome2.png" alt="" /></a>
    </div>
    
    
</asp:Content>
