

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Flights_GUI._Default" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
    $(function () {
        $("#mi1").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <h4>
        Welcome to MidWest AirLines Sysetm
    </h4>
    <div class="Details900">
       <p style="text-align:center">  <img src="images/SU-MWD.jpg" style="float:none;display:inline;"/>
       </p>
       
       <asp:Login ID="Login1" runat="server" Width="100%" VisibleWhenLoggedIn="False">
           <LayoutTemplate>   
           <asp:Panel ID="uiPanelLogin" runat="server" DefaultButton="LoginButton">        
               <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;width:100%;text-align:center" >
                   <tr>
                       <td > 
                       
                           <table cellpadding="0" align="center" >                               
                               <tr>
                                   <td align="right">
                                       <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" 
                                           Font-Bold="True">User Name:</asp:Label>
                                   </td>
                                   <td>
                                       <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                           ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                           ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                   </td>
                               </tr>
                               <tr>
                                   <td align="right">
                                       <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" 
                                           Font-Bold="True">Password:</asp:Label>
                                   </td>
                                   <td>
                                       <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                           ControlToValidate="Password" ErrorMessage="Password is required." 
                                           ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                   </td>
                               </tr>
                               <tr>
                               <td></td>
                                   <td >
                                       <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                   </td>
                               </tr>
                               <tr>
                                   <td align="center" colspan="2" style="color:Red;">
                                       <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                   </td>
                               </tr>
                               <tr>
                                   <td align="right" colspan="2">
                                   <div class="SearchBtn" style="float:right;">
                                       <asp:LinkButton ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                           ValidationGroup="Login1" >
                                           </asp:LinkButton>
                                           </div>
                                   </td>
                               </tr>
                           </table>
                          
                       </td>
                   </tr>
               </table>
               </asp:Panel>
           </LayoutTemplate>
    </asp:Login>
    
           </div>
</asp:Content>
