<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Careers.aspx.cs" Inherits="Taqwa.Website.Careers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent">
<div class="style24">
    <asp:Literal ID="uiLiteralTitle" runat="server"></asp:Literal>
</div>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>

    <div class="clear" style="height:5px;"></div>
     <div class="Right" style="width: 200px">
        
    </div>
    <div class="Middle">
        <asp:Label ID="uiLabelMessage" runat="server" Visible="false"></asp:Label>
    </div>
    <div class="Left">
    </div>
    <div class="clear"></div>
     <div class="Right" style="width: 200px">
        <asp:Label ID="Label2" runat="server" Text="الإسم :" CssClass="Label"></asp:Label>
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
        <asp:Label ID="Label3" runat="server" Text="البريد الإلكترونى :" 
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
        <asp:Label ID="Label1" runat="server" Text="قم بتحميل السيرة الذاتية الخاصة بك : " CssClass="Label"></asp:Label>
    </div>
    <div class="Middle">
        <asp:FileUpload ID="uiFileUpload" runat="server" />
    </div>
    <div class="Left">&nbsp;
    </div>
    <div class="clear"></div>
     <div class="Right" style="width: 200px">
        &nbsp;
    </div>
    <div class="Middle">
       <asp:Button ID="uiButtonUpload" runat="server" 
            onclick="uiButtonUpload_Click" Text="أرسل" BackColor="#33CC33" 
            Font-Bold="True" ForeColor="White" Width="75px" />
    </div>
    <div class="Left">&nbsp;
    </div>
    <div class="clear"></div>
</div>
</div>
</asp:Content>
