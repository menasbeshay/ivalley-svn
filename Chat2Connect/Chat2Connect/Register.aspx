<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Chat2Connect.Register" %>
<%@ MasterType VirtualPath="~/MasterPages/Home.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:100%;padding:2%;">
    <div style="width:43%;float:right;">
        <div class="form-horizontal blockBox">
            
                    تسجيل البيانات الرئيسية
            <hr style="color:#F6D355;width:80%;background-color:#F6D355;"/>
            <h4>ادخل عالما جديدا من الأصدقاء</h4>
            <div class="form-group">
                <div class="col-sm-12 control-label pull-right">
                <asp:Label ID="ErrorMessage" runat="server" EnableViewState="False" Visible="false" ForeColor="red"></asp:Label>
                    </div>
            </div>
                <div class="form-group">
                    <div class="col-sm-4 control-label pull-right">
                        <Label>إسم المستخدم</Label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:TextBox ID="UserName" runat="server" onkeypress="return validChars(event);"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="من فضلك أدخل إسم المستخدم ." ToolTip="من فضلك أدخل إسم المستخدم ." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valPassword" runat="server" ControlToValidate="UserName" ErrorMessage="الحد الأدنى لإسم المستخدم 17 حرف" ValidationExpression=".{17}.*" Display="Dynamic" ForeColor="Red"/>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="إسم المستخدم غير مطابق للشروط" ClientValidationFunction="isValid" ControlToValidate="UserName" Display="Dynamic" ForeColor="Red"></asp:CustomValidator>
                    </div>
                 </div>

            <div class="form-group">
                    <div class="col-sm-4 control-label pull-right">
                        <Label>كلمة المرور</Label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="من فضلك أدخل كلمة المرور." ToolTip="من فضلك أدخل كلمة المرور." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>
                    </div>
                 </div>
             <div class="form-group">
                    <div class="col-sm-4 control-label pull-right">
                        <Label>تأكيد كلمة المرور</Label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="من فضلك قم بإعادة كلمة المرور." ToolTip="من فضلك قم بإعادة كلمة المرور." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="كلمة المرور غير متطابقة." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                    </div>
                 </div>
             <div class="form-group">
                    <div class="col-sm-4 control-label pull-right">
                        <Label>البريد الإلكترونى</Label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="من فضلك أدخل البريد الإلكترونى." ToolTip="من فضلك أدخل البريد الإلكترونى." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red" ></asp:RequiredFieldValidator>
                    </div>
                 </div>
             <div class="form-group">
                    <div class="col-sm-4 control-label pull-right">
                        <Label>السؤال السرى</Label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="من فضلك أدخل السؤال السرى." ToolTip="من فضلك أدخل السؤال السرى." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                 </div>
             <div class="form-group">
                    <div class="col-sm-4 control-label pull-right">
                        <Label>إجابة السوال السرى</Label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="من فضلك أدخل إجابة السؤال السرى." ToolTip="من فضلك أدخل إجابة السؤال السرى." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                 </div>
            <div class="form-group">
                    <div class="col-sm-12 control-label pull-right">
                        
                            <asp:CheckBox ID="uiCheckBoxAgree" runat="server" CssClass="AcceptedAgreement" Text="أوافق على شروط إستخدام الموقع"/>
                        <br />
                        <asp:CustomValidator runat="server" ID="CheckBoxRequired" EnableClientScript="true" ValidationGroup="CreateUserWizard1"                        
                        ClientValidationFunction="CheckBoxRequired_ClientValidate" Display="Dynamic" ForeColor="Red">يجب إختيار 'أوافق على شروط إستخدام الموقع'</asp:CustomValidator>
                    </div>
                 </div>
             <div class="form-group">
                <div class="col-sm-offset-2 col-sm-6 pull-left">
                    <asp:Button ID="uiButtonRegister" runat="server" Text="إشترك" CssClass="btn-large " ValidationGroup="CreateUserWizard1"  style="width:100px;" OnClick="uiButtonRegister_Click" />
                </div>
              </div>

        </div>
        
    </div>
    <div style="width:55%;float:left;">
        <img src="images/reg.png" />
    </div>
        </div>

                    
                
       
</asp:Content>
