<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetpass.aspx.cs" Inherits="Chat2Connect.resetpass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="I-VALLEY" name="author" />

    <link href="css/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/base.css" rel="stylesheet" />
    <link href="css/skeleton_subject.css" rel="stylesheet" />
    <%--<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />--%>
    <link href="css/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <%--<link media="screen" href="http://openfontlibrary.org/face/kacstpen" rel="stylesheet" type="text/css" />    --%>
    <link href="css/main.css" rel="stylesheet" />    
    <!-- end stylesheets -->

    <%--<script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>--%>
    <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/html5shiv-printshiv.js"></script>   
     <style>
        .navbar {
            margin-bottom: 0px;
        }
    </style> 
</head>
<body>
    <form id="form1" runat="server">
   <header class="row navbar-fixed-top" role="navigation">
       <div id="help" class="help">
                <a href="#">
                    <img src="../images/logo.png"></a>
                <div style="width: 1px; background-color: #D2D2D2; float: left; height: 50px; margin: 0px; margin-top: 15px; margin-right: 30px; padding: 0px; cursor: auto;"></div>

            </div>
       </header>
        <section class="MainContent row " style="margin-top: 90px !important;">
            <div style="margin: 0 auto; width: 99.5%;">
                 <div class="inner_main">
                        
                     <div class="form-horizontal blockBox validationGroup">                               
                                <h4>اكتب كلمة المرور الجديدة</h4>
                                <div class="form-group">
                                    <div class="col-sm-12 control-label pull-right">
                                        <asp:Label ID="ErrorMessage" runat="server" EnableViewState="False" Visible="false" ForeColor="red"></asp:Label>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label> كلمة المرور الجديدة</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="من فضلك أدخل كلمة المرور." ToolTip="من فضلك أدخل كلمة المرور." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Password" ErrorMessage="يجب أن تكون كلمة المرور مكونة من 4 إلى 17 حرف." ValidationExpression=".{4,17}.*" Display="Dynamic" ForeColor="Red" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>تأكيد كلمة المرور</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="من فضلك قم بإعادة كلمة المرور." ToolTip="من فضلك قم بإعادة كلمة المرور." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="كلمة المرور غير متطابقة." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-6 pull-left">
                                        <asp:Button ID="uiButtonChangePass" runat="server" Text="حفظ" CssClass="btn btn-warning " ValidationGroup="CreateUserWizard1" Style="width: 100px;" OnClick="uiButtonChangePass_Click" />
                                    </div>
                                </div>

                            </div>

                     </div>
                <div class="clearfix" style="height: 1px;"></div>
                </div>
            </section>
        <footer class="row">
                <div class="col-lg-4">
                    <asp:HyperLink ID="uiHyperLinkFB" runat="server">
                        <i class="icon-facebook-sign icon-2x"></i>
                    </asp:HyperLink>
                    &nbsp;
                    <asp:HyperLink ID="uiHyperLinkTwitter" runat="server">
                        <i class="icon-twitter-sign icon-2x"></i>
                    </asp:HyperLink>
                    &nbsp;
                    <asp:HyperLink ID="uiHyperLinkYoutube" runat="server">
                        <i class="icon-youtube-sign icon-2x"></i>
                    </asp:HyperLink>
                    &nbsp;
                    <asp:HyperLink ID="uiHyperLinkGp" runat="server">
                        <i class="icon-google-plus-sign icon-2x"></i>
                    </asp:HyperLink>
                     <div class="clear" style="height:5px;"></div>
                    <div>
                Powered by &nbsp; <a href="http://I-valley.com">
                    <img src="../images/IValley.png" title="I-VALLEY software solutions" style="vertical-align: middle;"
                        alt="I-VALLEY software solutions" /></a>

            </div>
                </div>
                
                <div class="col-lg-4 pull-right" style="text-align:right;margin-top:5px;direction:rtl;">
                    <a href="viewnode.aspx?node=privacy">سياسة الخصوصية</a>
                    &nbsp;
                    | &nbsp;
                    <a href="viewnode.aspx?node=terms">الشروط والأحكام</a>
                    <div class="clear" style="height:10px;"></div>
                &copy;
            <script type="text/javascript">document.write(new Date().getFullYear());</script>
                جميع الحقوق محفوظة لموقع دردشة تواصل.&nbsp;
                    
                    </div>
            
            </footer>
         <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/Mainjs.js" type="text/javascript"></script>
    </form>
</body>
</html>
