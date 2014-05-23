<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="I_Stock.Login" %>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>الدخول</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <%--<link href="assets/bootstrap-rtl/css/bootstrap-rtl.min.css" rel="stylesheet" />--%>
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style_responsive.css" rel="stylesheet" />
    <link href="css/style_default.css" rel="stylesheet" id="style_color" />
</head>
<body id="login-body">
    <form id="form1" runat="server">
    <div class="login-header">
        <!-- BEGIN LOGO -->
        <div id="logo" class="center">
            <img src="img/logo2.png" alt="logo" class="center" style="height:35px;" />
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
                    <h4>
                        دخول المستخدمين</h4>
                    <div class="control-group">
                        <div class="controls">
                            <div class="input-prepend">
                                <span class="add-on"><i class="icon-user"></i></span>                                
                                <asp:TextBox ID="UserName" runat="server"  style="padding:20px;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                                    ErrorMessage="Password is required." ToolTip="أدخل اسم المسنخدم." ValidationGroup="Login1">*</asp:RequiredFieldValidator>                             
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <div class="input-prepend">
                                <span class="add-on"><i class="icon-key"></i></span>                                
                                <asp:TextBox ID="Password" TextMode="Password" runat="server" 
                                    Style="padding: 20px;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password"
                                    ErrorMessage="Password is required." ToolTip="ادخل كلمة المرور." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="mtop10">
                                <div class="block-hint pull-left small">
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text="" />
                                    تذكرنى
                                </div>
                                <div class="block-hint pull-right">
                                    <a href="javascript:;" class="" id="forget-password">لا أتذكر كلمة المرور </a>
                                </div>
                            </div>

                            <div class="mtop10">
                                <asp:Literal ID="Literal1" runat="server" EnableViewState="False"></asp:Literal>
                            </div>
                            <div class="clearfix space5">
                            </div>
                        </div>
                    </div>
                </div>          
                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="الدخول" ValidationGroup="Login1"
                    CssClass="btn btn-block login-btn" />                                                               
            </LayoutTemplate>
        </asp:Login>        
        </div>
        <!-- END LOGIN FORM -->
        <!-- BEGIN FORGOT PASSWORD FORM 
       
        <p class="center">
            Enter your e-mail address below to reset your password.</p>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                    <span class="add-on"><i class="icon-envelope"></i></span>
                    <input id="input-email" type="text" placeholder="Email" />
                </div>
            </div>
            <div class="space20">
            </div>
        </div>
        <input type="button" id="forget-btn" class="btn btn-block login-btn" value="Submit" />
        
        END FORGOT PASSWORD FORM -->
    </div>
    <!-- END LOGIN -->
    <!-- BEGIN COPYRIGHT -->
    <div id="login-copyright">
        2013 &copy; 
        <img src="img/Ivalley.png" style="vertical-align:middle;"/>.
    </div>
    <!-- END COPYRIGHT -->
    <!-- BEGIN JAVASCRIPTS -->
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="assets/bootstrap-rtl/js/bootstrap.min.js"></script>
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
</html>
