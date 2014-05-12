<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Ar.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="E3zemni_WebGUI.ar.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div class="container">
  <div class="row">
    <div class="col-md-12">
        <div class="contactform">
        <h2 class="title">إنشاء حساب جديد</h2>
        
          <div class="row">
            <div class="clear" style="height:5px;"></div><div class="col-md-8 pull-right">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxFN" runat="server" CssClass="form-control" placeholder="الإسم بالكامل*"></asp:TextBox>   
              </div>
              <div class="col-md-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="مطلوب" Display="Dynamic" Font-Bold="true" ForeColor="Red" ValidationGroup="register" ControlToValidate="uiTextBoxFN"></asp:RequiredFieldValidator>
                </div>
                <div class="clear" style="height:5px;"></div><div class="col-md-8 pull-right">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxUN" runat="server" CssClass="form-control" placeholder="اسم المستخدم*"></asp:TextBox>   </div>
              <div class="col-md-4">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="مطلوب" Display="Dynamic" Font-Bold="true" ForeColor="Red" ValidationGroup="register" ControlToValidate="uiTextBoxUN"></asp:RequiredFieldValidator>
              </div>
              <div class="clear" style="height:5px;"></div><div class="col-md-8 pull-right">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxEmail" runat="server" CssClass="form-control" placeholder=" البريد الإلكترونى*"></asp:TextBox>   
              </div>
              <div class="col-md-4">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="مطلوب" Display="Dynamic" Font-Bold="true" ForeColor="Red" ValidationGroup="register" ControlToValidate="uiTextBoxEmail"></asp:RequiredFieldValidator>
              </div>
              <div class="clear" style="height:5px;"></div><div class="col-md-8 pull-right">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxPassword" runat="server" CssClass="form-control" placeholder="كلمة المرور*" TextMode="Password"></asp:TextBox>   
              </div>
              <div class="col-md-4">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="مطلوب" Display="Dynamic" Font-Bold="true" ForeColor="Red" ValidationGroup="register" ControlToValidate="uiTextBoxPassword"></asp:RequiredFieldValidator>
              </div>
              <div class="clear" style="height:5px;"></div><div class="col-md-8 pull-right">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxAddress" runat="server" CssClass="form-control" placeholder="العنوان"></asp:TextBox>   
              </div>
              
              <div class="clear" style="height:5px;"></div><div class="col-md-8 pull-right">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxSAddress" runat="server" CssClass="form-control" placeholder="عنوان الشحن"></asp:TextBox>   
              </div>
              
              <div class="clear" style="height:5px;"></div><div class="col-md-8 pull-right">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxMobile" runat="server" CssClass="form-control" placeholder="الموبايل"></asp:TextBox>   
              </div>
              <div class="clear" style="height:5px;"></div><div class="col-md-8 pull-right">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxLandLine" runat="server" CssClass="form-control" placeholder="تليفون أرضى"></asp:TextBox>   
             
            </div>
            
          </div>
          <div class="clear" style="height:5px;"></div>
          <div class="row">
            <div class="col-md-5">
                <asp:LinkButton ID="uiLinkButtonRegister" runat="server"  
                    CssClass="btn btn-success pull-right" ValidationGroup="register" 
                    onclick="uiLinkButtonRegister_Click">سجل </asp:LinkButton>              
            </div>
          </div>
        
      </div>
    </div>
   </div>
</div>
</asp:Content>
