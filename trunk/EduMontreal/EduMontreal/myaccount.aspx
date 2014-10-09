<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EduMaster.Master" AutoEventWireup="true" CodeBehind="myaccount.aspx.cs" Inherits="EduMontreal.myaccount" %>
<%@ MasterType VirtualPath="~/MasterPages/EduMaster.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.datetimepicker').datetimepicker({
            format: 'dd/MM/yyyy',
            pick12HourFormat: false,
            pickSeconds: false,
            language: 'en'
        });
    });
</script>
    
    <style type="text/css">
        .radio {
            float:left;
        }
        .radio input{
            margin-left:0px !important;
            margin-right:5px;
            float:left;
        }
        .radio label{                       
            margin-top:5px !important;
            float:left;
            display:inline-block;
            margin-right:15px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="form-horizontal">
        <div class="form-body">
        <div class="form-group">					
					<div class="col-md-3">						
                        <asp:Label ID="uiLabelCountryError" runat="server" Text="Please select your country." ForeColor="Red" Font-Bold="true" Visible="false"></asp:Label>                        
                        <asp:Label ID="uiLabelUserExist" runat="server" Text="This mail already used before." ForeColor="Red" Font-Bold="true" Visible="false"></asp:Label>                        
                        <asp:Label ID="uiLabelCaptcha" runat="server" Text="Please enter characters in images correctly." ForeColor="Red" Font-Bold="true" Visible="false"></asp:Label>                        
					</div>                     
				</div>
        <div class="form-group">
					<div class="col-md-3">
						<label class="control-label">Family name <span class="required">* </span></label>
                        <asp:TextBox ID="uiTextBoxFamilyName" runat="server" Cssclass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxFamilyName" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
					</div>
					<div class="col-md-3">
						<label class="control-label">First name <span class="required">* </span></label>
						<asp:TextBox ID="uiTextBoxFirstName" runat="server" Cssclass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxFirstName" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
					</div>
                     <div class="col-md-3">
						<label class="control-label">Middle name <span class="required">* </span></label>
                         <asp:TextBox ID="uiTextBoxMiddleName" runat="server" Cssclass="form-control"></asp:TextBox>						
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxMiddleName" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
					</div>
				</div>
        <div class="form-group">
					<div class="col-md-3">
                        <div class="input-append datetimepicker">
							<label class="control-label">Date of birth  <span class="required">* </span></label>
							<asp:TextBox ID="uiTextBoxDOB" runat="server" Cssclass="form-control dateinput" style="width:225px;"></asp:TextBox>
							<span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar" class="icon-calendar"></i></span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxDOB" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
						</div>
                                                
					</div>
					<div class="col-md-3">
						<label class="control-label">Place of birth<span class="required">* </span></label>
						<asp:TextBox ID="uiTextBoxPOB" runat="server" Cssclass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxPOB" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
					</div>
                     <div class="col-md-3">
						<label class="control-label">Gender <span class="required">* </span></label>
                         <div class="separator"></div>
                         <asp:RadioButtonList ID="uiRadioButtonListGender" runat="server" CssClass="radio" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow">                                                          
                         </asp:RadioButtonList> 
					</div>
				</div>
        <div class="form-group">					
					<div class="col-md-3">
						<label class="control-label">Citizenship <span class="required">* </span></label>
                        <asp:DropDownList ID="uiDropDownListCountry" runat="server" Cssclass="form-control" style="width:256px;"></asp:DropDownList>                        
					</div>
                     <div class="col-md-3">
						<label class="control-label">Cell phone number <span class="required">* </span></label>
                         <asp:TextBox ID="uiTextBoxMobile" runat="server" Cssclass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxMobile" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                runat="server" Display="Dynamic" ErrorMessage="Numbers only"
                    ValidationGroup="signup" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxMobile"
                    ForeColor="Red"></asp:RegularExpressionValidator>
					</div>
				</div>
        <div class="form-group last">					
					<div class="col-md-3">
						<label class="control-label">Email (username) <span class="required">* </span></label>
                        <asp:TextBox ID="uiTextBoxEmail" runat="server" Cssclass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxEmail" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="invalid email format" ValidationGroup="signup" ForeColor="Red" ControlToValidate="uiTextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
					</div>
                     <div class="col-md-3">
						<label class="control-label">Password <span class="required">* </span></label>
                         <asp:TextBox ID="uiTextBoxPassword" runat="server" Cssclass="form-control" TextMode="Password"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxPassword" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
					</div>
                    
				</div>
        
         <div class="form-actions fluid">					
					<div class="col-md-3">						
                        <asp:LinkButton ID="uiLinkButtonSignUp" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonSignUp_Click" ValidationGroup="signup">Save</asp:LinkButton>
					</div>                     
				</div>
            </div>
    </section>
</asp:Content>
