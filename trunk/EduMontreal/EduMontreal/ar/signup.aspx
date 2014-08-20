<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AREduMaster.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="EduMontreal.ar.signup" %>
<%@ MasterType VirtualPath="~/MasterPages/AREduMaster.Master" %>
<%@ Register Assembly="Recaptcha" Namespace="Recaptcha" TagPrefix="recaptcha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.datetimepicker').datetimepicker({
            format: 'dd/MM/yyyy',
            pick12HourFormat: false,
            pickSeconds: false,
            language: 'ar'
        });
    });
</script>

    <style type="text/css">
        .radio {
            float:right;
        }
        .radio input{
            margin-left:5px ;
            margin-right:0px !important;
            float:right;
        }
        .radio label{                       
            margin-top:5px !important;
            float:right;
            display:inline-block;
            margin-left:15px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="form-horizontal">
        <div class="form-body">
        <div class="form-group">					
					<div class="col-md-3">						
                        <asp:Label ID="uiLabelCountryError" runat="server" Text="من فضلك إختر البلد." ForeColor="Red" Font-Bold="true" Visible="false"></asp:Label>                        
                        <asp:Label ID="uiLabelUserExist" runat="server" Text="البريد الإلكترونى مستخدم من قبل." ForeColor="Red" Font-Bold="true" Visible="false"></asp:Label>                        
                        <asp:Label ID="uiLabelCaptcha" runat="server" Text="من فضلك أدخل الكلمة الموجودة فى الصورة بشكل صحيح." ForeColor="Red" Font-Bold="true" Visible="false"></asp:Label>                        
					</div>                     
				</div>
        <div class="form-group">
					<div class="col-md-3">
						<label class="control-label">اللقب<span class="required">* </span></label>
                        <asp:TextBox ID="uiTextBoxFamilyName" runat="server" Cssclass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxFamilyName" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
					</div>
					<div class="col-md-3">
						<label class="control-label">الإسم الأول <span class="required">* </span></label>
						<asp:TextBox ID="uiTextBoxFirstName" runat="server" Cssclass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxFirstName" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
					</div>
                     <div class="col-md-3">
						<label class="control-label">إسم الأب <span class="required">* </span></label>
                         <asp:TextBox ID="uiTextBoxMiddleName" runat="server" Cssclass="form-control"></asp:TextBox>						
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxMiddleName" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
					</div>
				</div>
        <div class="form-group">
					<div class="col-md-3">
                        <div class="datetimepicker">                            
                        
							<label class="control-label">تاريخ الميلاد <span class="required">* </span></label>
                            <div class="input-group">
							<asp:TextBox ID="uiTextBoxDOB" runat="server" Cssclass="form-control dateinput datetimepicker" style="width:210px;"></asp:TextBox>
							<span class="input-group-addon add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="fa fa-calendar"></i></span>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxDOB" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
						</div>
                                                
					</div>
					<div class="col-md-3">
						<label class="control-label">مكان الميلاد<span class="required">* </span></label>
						<asp:TextBox ID="uiTextBoxPOB" runat="server" Cssclass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxPOB" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
					</div>
                     <div class="col-md-3">
						<label class="control-label">النوع <span class="required">* </span></label>
                         <div class="separator"></div>
                         <asp:RadioButtonList ID="uiRadioButtonListGender" runat="server" CssClass="radio" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow">                                                          
                         </asp:RadioButtonList> 
					</div>
				</div>
        <div class="form-group">					
					<div class="col-md-3">
						<label class="control-label">الجنسية <span class="required">* </span></label>
                        <asp:DropDownList ID="uiDropDownListCountry" runat="server" Cssclass="form-control" style="width:256px;"></asp:DropDownList>                        
					</div>
                     <div class="col-md-3">
						<label class="control-label">رقم الموبايل <span class="required">* </span></label>
                         <asp:TextBox ID="uiTextBoxMobile" runat="server" Cssclass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxMobile" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                runat="server" Display="Dynamic" ErrorMessage="أرقام فقط"
                    ValidationGroup="signup" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxMobile"
                    ForeColor="Red"></asp:RegularExpressionValidator>
					</div>
				</div>
        <div class="form-group">					
					<div class="col-md-3">
						<label class="control-label">البريد الإلكترونى (إسم المستخدم) <span class="required">* </span></label>
                        <asp:TextBox ID="uiTextBoxEmail" runat="server" Cssclass="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxEmail" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="invalid email format" ValidationGroup="signup" ForeColor="Red" ControlToValidate="uiTextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
					</div>
                     <div class="col-md-3">
						<label class="control-label">كلمة المرور <span class="required">* </span></label>
                         <asp:TextBox ID="uiTextBoxPassword" runat="server" Cssclass="form-control" TextMode="Password"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxPassword" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
					</div>
                    <div class="col-md-3">
						<label class="control-label">تأكيد كلمة المرور <span class="required">* </span></label>
                         <asp:TextBox ID="uiTextBoxCP" runat="server" Cssclass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" ErrorMessage="كلمة المرور غير متطابقة" ValidationGroup="signup" ForeColor="Red" ControlToValidate="uiTextBoxCP" ControlToCompare="uiTextBoxPassword" ></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxCP" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
					</div>
				</div>
        <div class="form-group last">					
					<div class="col-md-4" style="direction:ltr;">						
                        <recaptcha:RecaptchaControl ID="RecaptchaControl1" runat="server" PublicKey="6LcFG_gSAAAAABTH6Kh_EmlmOZOGYI_U7waVglXO" PrivateKey="6LcFG_gSAAAAAHPQ32a2A8KG-s6zUJodr_4brEcv"  Width="80%" />
					</div>                     
				</div>
         <div class="form-actions fluid">					
					<div class="col-md-3">						
                        <asp:LinkButton ID="uiLinkButtonSignUp" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonSignUp_Click" ValidationGroup="signup">إنشاء حساب</asp:LinkButton>
					</div>                     
				</div>
            </div>
    </section>
</asp:Content>
