<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Company_Login.aspx.cs"
    Inherits="Pricing_GUI.Company_Login" %>

<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head runat="server">
    <title>Company Login</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
  <meta content="" name="description" />
  <meta content="" name="author" />  
  <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />
  <link href="css/style_responsive.css" rel="stylesheet" />
  <link href="css/style_navy-blue.css" rel="stylesheet" id="style_color" />
</head>
<body id="login-body">
    <div class="login-header">
      <!-- BEGIN LOGO -->
      <div id="logo" class="center">
          Company Login
      </div>
      <!-- END LOGO -->
  </div>
    <form id="form1" runat="server">
    
    <div id="login">
    <!-- BEGIN LOGIN FORM -->
     <asp:Label runat="server" ID="lblResult" ForeColor="Maroon" Font-Size="Large"></asp:Label>
    <div id="loginform" class="form-vertical no-padding no-margin" >
      <div class="lock">
          <i class="icon-lock"></i>
      </div>
      <div class="control-wrap">
          <h4>Company Login</h4>
          <div class="control-group">
              <div class="controls">
                  <div class="input-prepend">
                      <span class="add-on"><i class="icon-user"></i></span>
                      <asp:TextBox runat="server" ID="input_username" ClientIDMode="Static" placeholder="company code" ></asp:TextBox> 
                      <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ErrorMessage="*"
                        ForeColor="Red" ControlToValidate="input_username" Display="Static"></asp:RequiredFieldValidator>                     
                  </div>
              </div>
          </div>
          <div class="control-group">
              <div class="controls">
                  <div class="input-prepend">
                      <span class="add-on"><i class="icon-key"></i></span>
                       <asp:TextBox runat="server" ID="input_password" TextMode="Password"  ClientIDMode="Static" placeholder="Password"></asp:TextBox>                      
                       <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ErrorMessage="*"
                        ForeColor="Red" ControlToValidate="input_password" Display="Static"></asp:RequiredFieldValidator>
                  </div>
                  <div class="mtop10">
                      <div class="block-hint pull-left small">
                          
                      </div>
                      <div class="block-hint pull-right">
                          <a href="javascript:;" class="" id="forget-password">Forgot Password?</a>
                      </div>
                  </div>

                  <div class="clearfix space5"></div>
              </div>

          </div>
      </div>
       <asp:Button runat="server" ID="login_btn" Text="Login" 
                        onclick="btnLogin_Click" CssClass="btn btn-block login-btn"/>
      
    </div>
    <!-- END LOGIN FORM -->        
    
  </div>


    <%--<center>
    <asp:Label runat="server" ID="lblTitle" Text="Companies Login ..." 
            Font-Size="XX-Large" Font-Names="Sakkal Majalla"></asp:Label>
            <br /><br />
    <div style=" width: 75%">
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblUserName" Text="Company Code"></asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtCompanyCode" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ID="rquiredCompanyCode" ErrorMessage="*"
                        ForeColor="Red" ControlToValidate="txtCompanyCode" Display="Static"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="Label1" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="*"
                        ForeColor="Red" ControlToValidate="txtPassword" Display="Static"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="right">
                    <asp:Button runat="server" ID="btnLogin" Text="Login" Width="90px" 
                        onclick="btnLogin_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                <asp:Label runat="server" ID="lblResult" ForeColor="Maroon" Font-Size="Large"></asp:Label>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    </center>--%>
    </form>
     <div id="login-copyright">
      2013 &copy;Developed by CAPA IT Team 
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
</body>
</html>
