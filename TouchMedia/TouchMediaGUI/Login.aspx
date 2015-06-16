<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TouchMediaGUI.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="assets/bootstrap-rtl/css/bootstrap-rtl.min.css" rel="stylesheet" />
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style_gray.css" rel="stylesheet" />
    <link href="css/style_responsive.css" rel="stylesheet" />
    <title>Touch Media Login</title>
</head>
<body id="login-body">
    <form id="form1" runat="server">

        <div class="login-header">
            <!-- BEGIN LOGO -->
            <div id="logo" class="center">
                <img src="img/logo.png" alt="logo" class="center" />
            </div>
            <!-- END LOGO -->
        </div>

        <!-- BEGIN LOGIN -->
        <div id="login">
            <!-- BEGIN LOGIN FORM -->
            <div id="loginform" class="form-vertical no-padding no-margin">
                <div class="lock">
                    <i class="icon-lock"></i>
                </div>
                <asp:Login ID="Login1" runat="server">
                    <LayoutTemplate>
                        <div class="control-wrap">
                    <h4>تسجيل الدخول</h4>

                    <div class="control-group">
                        <div class="controls">
                            <div class="input-prepend">
                                <span class="add-on"><i class="icon-user"></i></span>
                                <asp:TextBox ID="UserName" runat="server" placeholder="اسم المستخدم"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                        ToolTip="User Name is required." ValidationGroup="Login1" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <div class="input-prepend">
                                <span class="add-on"><i class="icon-key"></i></span>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" placeholder="كلمة المرور"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server"
                                    ControlToValidate="Password" ErrorMessage="Password is required."
                                    ToolTip="Password is required." ValidationGroup="Login1" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
<%--                            <div class="mtop10">
                                <div class="block-hint pull-left small">
                                    <input type="checkbox" id="" />
                                    Remember Me
                                </div>
                                <div class="block-hint pull-right">
                                    <a href="javascript:;" class="" id="forget-password">Forgot Password?</a>
                                </div>
                            </div>--%>
                            <div class="clearfix space5"></div>
                        </div>
                    </div>
                </div>
                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="دخول" ValidationGroup="Login1" CssClass="btn btn-block login-btn"/>
                    </LayoutTemplate>
                </asp:Login>
                
            </div>
            <!-- END LOGIN FORM -->
            <!-- BEGIN FORGOT PASSWORD FORM -->
            <%--<div id="forgotform" class="form-vertical no-padding no-margin hide" action="index.html">
                <p class="center">Enter your e-mail address below to reset your password.</p>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-envelope"></i></span>
                            <input id="input-email" type="text" placeholder="Email" />
                        </div>
                    </div>
                    <div class="space20"></div>
                </div>
                <input type="button" id="forget-btn" class="btn btn-block login-btn" value="Submit" />
            </div>--%>
            <!-- END FORGOT PASSWORD FORM -->
        </div>
        <!-- END LOGIN -->
        <!-- BEGIN COPYRIGHT -->
        <div id="login-copyright">
            2015 &copy; I-Valley. All rights reserved
        </div>
    </form>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="assets/bootstrap-rtl/js/bootstrap.min.js"></script>
    <script src="js/jquery.blockui.js"></script>
    <script src="js/scripts.js"></script>
    <script>
        jQuery(document).ready(function () {
            App.initLogin();
        });
    </script>

</body>
</html>
