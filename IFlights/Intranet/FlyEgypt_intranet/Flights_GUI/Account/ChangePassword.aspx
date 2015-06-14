<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/MasterPages/ExceptionLight.Master" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs" Inherits="Flights_GUI.Account.ChangePassword" %>
<%@ MasterType VirtualPath="~/MasterPages/ExceptionLight.Master" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    
    <p>
        Use the form below to change your password.
    </p>
    <p>
        New passwords are required to be a minimum of <%= Membership.MinRequiredPasswordLength %> characters in length.
    </p>
    <asp:ChangePassword ID="ChangeUserPassword" runat="server" CancelDestinationPageUrl="~/" EnableViewState="false" RenderOuterTable="false" 
         SuccessPageUrl="ChangePasswordSuccess.aspx">
        <ChangePasswordTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            
            <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" CssClass="failureNotification box error-box " 
                 ValidationGroup="ChangeUserPasswordValidationGroup"/>
            
            <div class="accountInfo">
                <fieldset class="changePassword">
                    <legend>Account Information</legend>
                    <div class="cell-12 clearfix">
                        <div class="cell-2">
                        <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Old Password:</asp:Label>
                            </div>
                        <div class="cell-3 ">
                        <asp:TextBox ID="CurrentPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" 
                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Old Password is required." 
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                            </div>
                    </div>
                    <div class="clearfix margin-bottom-10"></div>
                    <div class="cell-12 clearfix">
                         <div class="cell-2 ">
                        <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label>
                        </div>
                        <div class="cell-3 ">
                        <asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" 
                             CssClass="failureNotification" ErrorMessage="New Password is required." ToolTip="New Password is required." 
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                            </div>
                    
                    </div>
                    <div class="clearfix margin-bottom-10"></div>
                    <div class="cell-12 clearfix">
                        <div class="cell-2 ">
                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                            </div>
                        <div class="cell-3 ">
                        <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="Confirm New Password is required."
                             ToolTip="Confirm New Password is required." ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry."
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
                            </div>
                    </div>
                    <div class="clearfix margin-bottom-10"></div>
                    <div class="cell-12 clearfix">
                        <div class="cell-2 "></div>
                        <div class="cell-4 ">
                    <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn"/>&nbsp;
                    <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Change Password" CssClass="btn"
                         ValidationGroup="ChangeUserPasswordValidationGroup"/>
                            </div>
                </div>
                </fieldset>
                
            </div>
        </ChangePasswordTemplate>
    </asp:ChangePassword>
</asp:Content>
