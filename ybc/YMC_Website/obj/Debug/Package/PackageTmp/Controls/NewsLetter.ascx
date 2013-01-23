<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsLetter.ascx.cs" Inherits="YMC_Website.NewsLetter" %>
<div id="mailsent">
    <div class="maintext" id="textofmail">
        النشرة الاليكترونية</div>
    <div id="mailsentA">
        <div style="margin-top:20px;margin-left:15px;">
            <asp:TextBox ID="uiTextBoxMail" runat="server" ValidationGroup="NewsLetter"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="uiTextBoxMail" Display="Dynamic" ErrorMessage="*" 
                ForeColor="Red" ValidationGroup="NewsLetter"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="uiTextBoxMail" Display="Dynamic" ErrorMessage="*" 
                ForeColor="Red" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="NewsLetter"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="uiLabelMsg" runat="server" ForeColor="#33CC33" 
                Text="تم الإشتراك بنجاح" Visible="False"></asp:Label>
        </div>
        <div style="margin-top: 10px; text-align:center;">
            <asp:Button ID="uiButtonSubscrip" runat="server" Text="إشترك" 
                onclick="uiButtonSubscrip_Click" ValidationGroup="NewsLetter" /></div>
    </div>
</div>
