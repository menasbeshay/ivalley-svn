<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Taqwa.Website.Admin.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="AdminMain">
        <div class="AdminLeft">
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelMessage" runat="server"></asp:Label>
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>

        <div class="AdminLeft">
            <asp:Label ID="uiLabelUserName" runat="server" CssClass="Label" 
                Text="إسم المستخدم :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxUserName" runat="server" ValidationGroup="Login"></asp:TextBox>
        </div>
        <div class="AdminRight">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="uiTextBoxUserName" ErrorMessage="*" ValidationGroup="Login"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>

        <div class="AdminLeft">
            <asp:Label ID="uiLabelPassword" runat="server" CssClass="Label" 
                Text="كلمة المرور :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxPassword" runat="server" ValidationGroup="Login" 
                TextMode="Password"></asp:TextBox>
        </div>
        <div class="AdminRight">
        &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="uiTextBoxPassword" ErrorMessage="*" ValidationGroup="Login"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>

        <div class="AdminLeft">
        &nbsp;
        </div>
        <div class="AdminMiddle">
            <asp:Button ID="uiButtonLogin" runat="server" onclick="uiButtonLogin_Click" 
                Text="دخول" ValidationGroup="Login" />
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>
    </div>


</asp:Content>
