<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/All.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="E3zemni_WebGUI.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div class="container">
  <div class="row">
    <div class="col-md-12">
        <div class="contactform">
        <h2 class="title">Register</h2>
        
          <div class="row">
            <div class="clear" style="height:5px;"></div><div class="col-md-8">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxFN" runat="server" CssClass="form-control" placeholder="Full Name*"></asp:TextBox>   
              </div>
              <div class="col-md-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" Display="Dynamic" Font-Bold="true" ForeColor="Red" ValidationGroup="register" ControlToValidate="uiTextBoxFN"></asp:RequiredFieldValidator>
                </div>
                <div class="clear" style="height:5px;"></div><div class="col-md-8">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxUN" runat="server" CssClass="form-control" placeholder="username*"></asp:TextBox>   </div>
              <div class="col-md-4">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" Display="Dynamic" Font-Bold="true" ForeColor="Red" ValidationGroup="register" ControlToValidate="uiTextBoxUN"></asp:RequiredFieldValidator>
              </div>
              <div class="clear" style="height:5px;"></div><div class="col-md-8">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxEmail" runat="server" CssClass="form-control" placeholder="Email*"></asp:TextBox>   
              </div>
              <div class="col-md-4">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" Display="Dynamic" Font-Bold="true" ForeColor="Red" ValidationGroup="register" ControlToValidate="uiTextBoxEmail"></asp:RequiredFieldValidator>
              </div>
              <div class="clear" style="height:5px;"></div><div class="col-md-8">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxPassword" runat="server" CssClass="form-control" placeholder="Passwrod*" TextMode="Password"></asp:TextBox>   
              </div>
              <div class="col-md-4">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" Display="Dynamic" Font-Bold="true" ForeColor="Red" ValidationGroup="register" ControlToValidate="uiTextBoxPassword"></asp:RequiredFieldValidator>
              </div>
              <div class="clear" style="height:5px;"></div><div class="col-md-8">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxAddress" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>   
              </div>
              
              <div class="clear" style="height:5px;"></div><div class="col-md-8">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxSAddress" runat="server" CssClass="form-control" placeholder="Shipping address"></asp:TextBox>   
              </div>
              
              <div class="clear" style="height:5px;"></div><div class="col-md-8">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxMobile" runat="server" CssClass="form-control" placeholder="Mobile"></asp:TextBox>   
              </div>
              <div class="clear" style="height:5px;"></div><div class="col-md-8">
              <asp:TextBox ValidationGroup="register" ID="uiTextBoxLandLine" runat="server" CssClass="form-control" placeholder="LandLine"></asp:TextBox>   
             
            </div>
            
          </div>
          <div class="clear" style="height:5px;"></div>
          <div class="row">
            <div class="col-md-8">
                <asp:LinkButton ID="uiLinkButtonRegister" runat="server"  
                    CssClass="btn btn-success pull-right" ValidationGroup="register" 
                    onclick="uiLinkButtonRegister_Click">Register</asp:LinkButton>              
            </div>
          </div>
        
      </div>
    </div>
   </div>
</div>
</asp:Content>
