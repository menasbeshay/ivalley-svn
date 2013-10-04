<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Inquiry.aspx.cs" Inherits="website.Inquiry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        $("#mi4").css("color", "#F6E2A5"); 
                  
    });
 </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<table align="center" cellpadding="2" class="style2" cellspacing="2" width="90%">
   
        <tr>
            <td colspan="3" style="text-align: left">
                &nbsp;</td>
        </tr>
   
        <tr>
            <td colspan="3" style="text-align: left">
                <h2 >Inquiry  </h2></td>
        </tr>
   
        <tr>
            <td class="content_wight2" colspan="3" style="text-align: left">
                <asp:Label ID="uiLabelMessage" runat="server" Text="Mail successfully sent." Visible="false"></asp:Label>
            </td>
        </tr>          
        <tr>
            <td class="style3" valign="top">
                Name</td>
            <td class="style4">
                <asp:TextBox ID="uiTextBoxName" runat="server" 
                    ValidationGroup="ReservationForm" Width="400px"></asp:TextBox>
            </td>
            <td class="content_wight2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="uiTextBoxName" ErrorMessage="*" 
                    ValidationGroup="ReservationForm" ForeColor="Red" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3" valign="top">
                Mail</td>
            <td class="style4">
                <asp:TextBox ID="uiTextBoxMail" runat="server" 
                    ValidationGroup="ReservationForm" Width="400px"></asp:TextBox>
            </td>
            <td class="content_wight2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="uiTextBoxMail" ErrorMessage="*" 
                    ValidationGroup="ReservationForm" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="uiTextBoxMail" ErrorMessage="*" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="ReservationForm" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        
        <tr>
            <td class="style3" valign="top">
                Message</td>
            <td class="style4">
                <asp:TextBox ID="uiTextBoxSubject" runat="server" Height="96px" TextMode="MultiLine" 
                    Width="400px" ValidationGroup="ReservationForm"></asp:TextBox>
&nbsp;</td>
            <td class="content_wight2" valign="top">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="uiTextBoxSubject" ErrorMessage="*" 
                    ValidationGroup="ReservationForm" ForeColor="Red"></asp:RequiredFieldValidator>
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
</asp:Content>
