<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARBannerMaster.Master" AutoEventWireup="true" CodeBehind="CompanyProfile.aspx.cs" Inherits="Obtravel.Arabic.CompanyProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="Aboutus">
<div class="left">
    <table width="100%" cellpadding="0" cellspacing="0" class="aboutTable" >
        <tbody>
            <tr>
                <td  width="10%">
                    <img src="../images/btn_over_ar.png" alt="{short description of image}" width="30" >
                </td>
                <td>
                    <b><a href="CompanyProfile.aspx" class="lintop">من نحن</a></b>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <table cellpadding="0" cellspacing="0" width="100%" class="text" border="0">
                        <tbody>
                            <tr>
                                <td valign="MIDDLE"  width="10%">
                                    <img src="../images/btn_over_ar.png" alt="{short description of image}" width="20">
                                </td>
                                <td valign="MIDDLE">
                                    <a href="CompanyProfile.aspx">نبذة عن الشركة</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="../images/btn_over_ar.png" alt="{short description of image}" width="20">
                                </td>
                                <td>
                                    <a href="MissionAndVision.aspx">الرؤية والرسالة</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="../images/btn_over_ar.png" alt="{short description of image}" width="20" >
                                </td>
                                <td>
                                    <a href="KeyPersons.aspx">Key Persons</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
           
            <tr>
                <td colspan="2" height="3">
                </td>
            </tr>
        </tbody>
    </table>
    <br />
    <img src="../images/about-us.jpg" width="250" height"294"/>
</div>
<div class="right" style="width:600px">
<h2 style="height:10px;"><asp:Label ID="uiLabelTitle" runat="server"></asp:Label></h2>
<hr />
<asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
</div>
</div>
</asp:Content>
