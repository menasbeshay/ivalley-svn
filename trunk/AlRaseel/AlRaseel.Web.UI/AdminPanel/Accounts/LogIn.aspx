<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Web.UI.AdminPanel.Accounts.LogIn" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>--%>

<!DOCTYPE html>
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head runat="server">
    <!-- BEGIN META SECTION -->
    <meta charset="utf-8">
    <title>Pixit - Responsive Boostrap3 Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="" name="description" />
    <meta content="themes-lab" name="author" />
    <!-- END META SECTION -->
    <!-- BEGIN MANDATORY STYLE -->
    <link href="../assets/css/icons/icons.min.css" rel="stylesheet">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/plugins.min.css" rel="stylesheet">
    <link href="../assets/css/style.min.css" rel="stylesheet">
    <!-- END  MANDATORY STYLE -->
    <!-- BEGIN PAGE LEVEL STYLE -->
    <link href="../assets/css/animate-custom.css" rel="stylesheet">
    <!-- END PAGE LEVEL STYLE -->
    <script src="../assets/plugins/modernizr/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <style>
        .chekremmeberme {
            float: left;
            width: 15px;
            margin-top: 5px;
        }

        .btnlogin {
            margin-left: 185px;
        }
    </style>
</head>

<body class="login fade-in" data-page="login">
    <form id="frmLogin" runat="server">

        <!-- BEGIN LOGIN BOX -->
        <div class="container" id="login-block">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-sm-offset-3 col-md-offset-4">
                    <div class="login-box clearfix animated flipInY">
                        <div class="page-icon animated bounceInDown">
                            <img src="../assets/img/account/user-icon.png" alt="Key icon">
                        </div>
                        <div class="login-logo">
                            <a href="#">
                                <img src="../assets/img/ivallryLogo.png" alt="Company Logo">
                            </a>

                        </div>
                        <hr>
                        <div class="login-form">
                            <!-- BEGIN ERROR BOX -->
                            <div class="alert alert-danger hide">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <h4>Error!</h4>
                                Your Error Message goes here
                       
                            </div>
                            <!-- END ERROR BOX -->
                            <asp:TextBox ID="txtUserName" placeholder="Username" CssClass="input-field form-control user" runat="server" />
                            <%--<input type="text" placeholder="Username" class="input-field form-control user" />--%>
                            <asp:TextBox ID="txtPassword" placeholder="Password" TextMode="Password" CssClass="input-field form-control password" runat="server" />
                            <%--<input type="password" placeholder="Password" class="input-field form-control password" />--%>
                            <div class="">
                                <div style="margin-left: 50px;">
                                    <div style="width: 20px; float: left; margin-top: 30px;">
                                        <asp:CheckBox ID="chkRememberMe" CssClass="cheremmeberme checkbox" runat="server" />
                                    </div>
                                    <label style="float: left; margin-top: 25px;">
                                        Remember Me
                                    </label>
                                </div>
                                <div style="float: right; margin-right: 55px;">
                                    <asp:Button ID="btnLogin" Text="Login" CssClass=" btn btn-login left btnlogin" runat="server" OnClick="btnLogin_Click" />
                                </div>
                            </div>
                            <%--<button type="submit" class="btn btn-login">Login</button>--%>
                            <%--<div class="login-links">
                                <a href="password_forgot.html">Forgot password?</a>
                                <br>
                                <a href="signup.html">Don't have an account? <strong>Sign Up</strong></a>
                            </div>--%>
                        </div>
                    </div>
                    <%--<div class="social-login row">
                        <div class="fb-login col-lg-6 col-md-12 animated flipInX">
                            <a href="#" class="btn btn-facebook btn-block">Connect with <strong>Facebook</strong></a>
                        </div>
                        <div class="twit-login col-lg-6 col-md-12 animated flipInX">
                            <a href="#" class="btn btn-twitter btn-block">Connect with <strong>Twitter</strong></a>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
        <!-- END LOCKSCREEN BOX -->
        <!-- BEGIN MANDATORY SCRIPTS -->
        <script src="../assets/plugins/jquery-1.11.js"></script>
        <script src="../assets/plugins/jquery-migrate-1.2.1.js"></script>
        <script src="../assets/plugins/jquery-ui/jquery-ui-1.10.4.min.js"></script>
        <script src="../assets/plugins/bootstrap/bootstrap.min.js"></script>
        <!-- END MANDATORY SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="../assets/plugins/backstretch/backstretch.min.js"></script>
        <script src="../assets/js/account.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
    </form>
</body>







