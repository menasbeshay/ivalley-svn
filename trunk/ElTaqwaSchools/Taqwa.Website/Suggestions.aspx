<%@ Page Title="" Language="C#" MasterPageFile="~/NewDesign.Master" AutoEventWireup="true" CodeBehind="Suggestions.aspx.cs" Inherits="Taqwa.Website.Suggestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="mainContent" style="background:#fff;width:980px;">
<div class="style24">
    <asp:Literal ID="uiLiteralTitle" runat="server"></asp:Literal>
</div>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    <div class="Right" style="width: 200px">
        
    </div>
    <div class="Middle">
        <asp:Label ID="uiLabelMessage" runat="server" Visible="false"></asp:Label>
    </div>
    <div class="Left">
    </div>
    <div class="clear"></div>
    <div class="Right" style="width: 200px">
        <asp:Label ID="Label1" runat="server" Text="الإسم :" CssClass="Label"></asp:Label>
    </div>
    <div class="Middle">
        <asp:TextBox ID="uiTextBoxName" runat="server" Width="200px" 
            ValidationGroup="Suggest"></asp:TextBox>
    </div>
    <div class="Left">&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
            runat="server" ControlToValidate="uiTextBoxName" Display="Dynamic" 
            ErrorMessage="*" ValidationGroup="Suggest"></asp:RequiredFieldValidator>
    </div>
    <div class="clear"></div>
    <div class="Right" style="width: 200px">
        <asp:Label ID="Label2" runat="server" Text="البريد الإلكترونى :" 
            CssClass="Label"></asp:Label>
    </div>
    <div class="Middle">
        <asp:TextBox ID="uiTextBoxEmail" runat="server" Width="200px" 
            ValidationGroup="Suggest"></asp:TextBox>
    </div>
    <div class="Left">&nbsp;<asp:RegularExpressionValidator 
            ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="uiTextBoxEmail" Display="Dynamic" ErrorMessage="*" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ValidationGroup="Suggest"></asp:RegularExpressionValidator>
    </div>
    <div class="clear"></div>
    <div class="Right" style="width: 200px">
        <asp:Label ID="Label3" runat="server" Text="المقترح :" CssClass="Label"></asp:Label>
    </div>
    <div class="Middle">
        <asp:TextBox ID="uiTextBoxSugg" runat="server" Width="400px" Rows="10" 
            TextMode="MultiLine" ValidationGroup="Suggest"></asp:TextBox>
    </div>
    <div class="Left">&nbsp;</div>
    <div class="clear"></div>
    <div class="Right" style="width: 200px">
    </div>
    <div class="Middle">
    </div>
    <div class="Left">&nbsp;<asp:Button ID="uiButtonSubmit" runat="server" 
            onclick="uiButtonUpload_Click" Text="أرسل" ValidationGroup="Suggest" />
    </div>
    <div class="clear"></div>
</div>
</div>
</asp:Content>
