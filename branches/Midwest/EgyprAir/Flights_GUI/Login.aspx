<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Flights_GUI.Login" %>


<!DOCTYPE html>
<!--
Template Name: Admin Lab Dashboard build with Bootstrap v2.3.1
Template Version: 1.2
Author: Mosaddek Hossain
Website: http://thevectorlab.net/
-->
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>Login page</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style_responsive.css" rel="stylesheet" />
    <link href="css/style_default.css" rel="stylesheet" id="style_color" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body id="login-body">
    <form id="form1" runat="server">
    <div class="login-header">
        <!-- BEGIN LOGO -->
        <div id="logo" class="center">
            <img src="img/logo2.png" alt="logo" class="center" />
        </div>
        <!-- END LOGO -->
    </div>
    <!-- BEGIN LOGIN -->
    <div id="login">
                <div class="lock">
                            <i class="icon-lock"></i>
                        </div>
                        <asp:login id="Login1" runat="server">
        <LayoutTemplate>
                        <div class="control-wrap">
                            <h4>
                                User Login</h4>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-user"></i></span>
                                        <%--<input id="input-username" type="text" placeholder="Username" />--%>
                                        <asp:TextBox ID="UserName" runat="server" placeholder="Username"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                        ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <div class="input-prepend">
                                        <span class="add-on"><i class="icon-key"></i></span>
                                        <%--<input id="input-password" type="password"  />--%>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="mtop10">
                                        <div class="block-hint pull-left small">
                                            <asp:CheckBox ID="RememberMe" runat="server" Text="" /> Remember Me                                            
                                        </div>
                                        <div class="block-hint pull-right">
                                            <a href="javascript:;" class="" id="forget-password">Forgot Password?</a>
                                        </div>
                                    </div>
                                    <div class="clearfix space5">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" CssClass="btn btn-block login-btn"/>
                         </LayoutTemplate>
    </asp:login>
            
    </div>
    <!-- END LOGIN -->
    <!-- BEGIN COPYRIGHT -->
    <div id="login-copyright">
        2013 &copy; 
    </div>
    <!-- END COPYRIGHT -->
    <!-- BEGIN JAVASCRIPTS -->
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery.blockui.js"></script>
    <script src="js/scripts.js"></script>
    <script>
        jQuery(document).ready(function () {
            App.initLogin();
        });
    </script>
    <!-- END JAVASCRIPTS -->
    </form>
</body>
<!-- END BODY -->
</html>
