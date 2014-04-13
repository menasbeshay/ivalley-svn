<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Ar.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="E3zemni_WebGUI.ar.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div class="row ">
    <div class="col-md-12 ">
    <asp:Panel ID="uiPanelLoginMain" runat="server" DefaultButton="uiLinkButtonMainLogin">
        <div class="contactform">
        <h2 class="title">الدخول </h2>
          <div class="row">
          <div class="col-md-8 pull-right">
            <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="خطأ . حاول مرة أخرى" Visible="False"></asp:Label>
          </div>
           <div class="col-md-5 pull-right">
           <div class="form-group">
                      <asp:TextBox ID="uiTextBoxUserName" runat="server" CssClass="form-control" placeholder="اسم المستخدم"></asp:TextBox> 
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="مطلوب" ControlToValidate="uiTextBoxUserName" Font-Bold="true" Display="Dynamic" ForeColor="Red" ValidationGroup="MainUserLogin"></asp:RequiredFieldValidator>                   
                  </div>
                  <div class="form-group">               
                    <asp:TextBox ID="uiTextBoxPassword" runat="server" CssClass="form-control" placeholder="كلمة المرور" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="مطلوب" ControlToValidate="uiTextBoxPassword" Font-Bold="true" Display="Dynamic" ForeColor="Red" ValidationGroup="MainUserLogin"></asp:RequiredFieldValidator>                   
                  </div>                  
                    </div>
               
          </div>
          <div class="row">
            <div class="col-md-5 pull-right">
              <asp:LinkButton ID="uiLinkButtonMainLogin" runat="server" 
                    CssClass="btn btn-success" ValidationGroup="MainUserLogin" 
                    onclick="uiLinkButtonMainLogin_Click">دخول</asp:LinkButton>
                    &nbsp;&nbsp;
                    <a href="register.aspx" class="btn btn-default">إنشاء حساب جديد</a>
            </div>
            
          </div>
        
      </div>
      </asp:Panel>
    </div>
   </div>
</asp:Content>
