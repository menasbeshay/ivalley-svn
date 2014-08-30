<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="archiplan.contactus" %>
<%@ MasterType VirtualPath="~/MasterPages/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
            border-collapse: collapse;
            text-align:left;
        }
        .style3
        {
            font-family: Tahoma;
            color: #C0C0C0;
            font-size: 12;
            width: 120px;
        }
        .style4
        {
            font-family: Tahoma;
            color: #C0C0C0;
            font-size: 12;
            width: 312px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tittle_wight" style="padding:0px 5px;text-align:left;width:110%;position:relative;z-index:999;">
    <div style="width:48%;float:right;margin-left:10px;">
        <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>    
    </div>
    <div style="width:48%;float:left;margin-right:10px;margin-left:10px;">
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d13821.176129544398!2d31.434805674773184!3d29.99971248766137!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2s!4v1387281887247" width="400" height="300" frameborder="0" style="border:0"></iframe>
    </div>
    <br />
    <table align="center" cellpadding="2" class="style2" cellspacing="2">
   
        <tr>
            <td colspan="3" style="text-align: left">
                &nbsp;</td>
        </tr>
   
        <tr>
            <td class="content_wight2" colspan="3" style="text-align: left">
                <asp:Label ID="uiLabelMessage" runat="server" Text="Mail successfully sent." 
                    Visible="False" ForeColor="Lime"></asp:Label>
            </td>
        </tr>          
        <tr>
            <td class="style3" valign="top">
                Name</td>
            <td class="style4">
                <asp:TextBox ID="uiTextBoxName" runat="server" 
                    ValidationGroup="ReservationForm"></asp:TextBox>
            </td>
            <td class="content_wight2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="uiTextBoxName" ErrorMessage="*" 
                    ValidationGroup="ReservationForm"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3" valign="top">
                Mail</td>
            <td class="style4">
                <asp:TextBox ID="uiTextBoxMail" runat="server" 
                    ValidationGroup="ReservationForm"></asp:TextBox>
            </td>
            <td class="content_wight2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="uiTextBoxMail" ErrorMessage="*" 
                    ValidationGroup="ReservationForm"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="uiTextBoxMail" ErrorMessage="*" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="ReservationForm"></asp:RegularExpressionValidator>
            </td>
        </tr>
        
        <tr>
            <td class="style3" valign="top">
                Message</td>
            <td class="style4">
                <asp:TextBox ID="uiTextBoxSubject" runat="server" Height="96px" TextMode="MultiLine" 
                    Width="219px" ValidationGroup="ReservationForm"></asp:TextBox>
&nbsp;</td>
            <td class="content_wight2" valign="top">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="uiTextBoxSubject" ErrorMessage="*" 
                    ValidationGroup="ReservationForm"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3" valign="top">
                &nbsp;</td>
            <td class="style4">
                <asp:Button ID="uiButtonSubmit" runat="server" onclick="uiButtonSubmit_Click" 
                    Text="Submit" ValidationGroup="ReservationForm" />
            </td>
            <td class="content_wight2">
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>
