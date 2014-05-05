<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/All.Master" AutoEventWireup="true"
    CodeBehind="login.aspx.cs" Inherits="E3zemni_WebGUI.login" %>

<%@ MasterType VirtualPath="~/MasterPages/All.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <div class="row ">
        <div class="col-md-12 ">
            <asp:Panel ID="uiPanelLoginMain" runat="server" DefaultButton="uiLinkButtonMainLogin">
                <div class="contactform">
                <div class="row">
                    <div class="grid_6" style="border-right:2px solid #ccc;">
                          <h2 class="title">
                        Login
                    </h2>
                    <div class="row">
                        <div class="col-md-8">
                            <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="Error. please try again"
                                Visible="False"></asp:Label>
                        </div>
                        <div class="col-md-5">
                            <div class="form-group">
                                <asp:TextBox ID="uiTextBoxUserName" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                                    ControlToValidate="uiTextBoxUserName" Font-Bold="true" Display="Dynamic" ForeColor="Red"
                                    ValidationGroup="MainUserLogin"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="uiTextBoxPassword" runat="server" CssClass="form-control" placeholder="Password"
                                    TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                                    ControlToValidate="uiTextBoxPassword" Font-Bold="true" Display="Dynamic" ForeColor="Red"
                                    ValidationGroup="MainUserLogin"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <asp:LinkButton ID="uiLinkButtonMainLogin" runat="server" CssClass="btn btn-success"
                                ValidationGroup="MainUserLogin" OnClick="uiLinkButtonMainLogin_Click">Login</asp:LinkButton>
                            &nbsp;&nbsp; <a href="register.aspx" class="btn btn-default">Register new account</a>
                        </div>
                    </div>
                    </div>
                     <div class="grid_6" >
                         <h2 class="title">
                            Login with facebook
                        </h2>
                        <a href="#" onclick="return fblogin();" id="fbloginlink" class="fb_button_ps"><img src="../images/facebook.gif" alt="Connect with Facebook" /></a>    
                    </div>
                </div>
                  
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
