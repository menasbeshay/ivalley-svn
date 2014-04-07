<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="AddAccount.aspx.cs" Inherits="Chat2Connect.Admin.AddAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="modal-content">
        <div class="modal-header">
            <h3 id="myModalLabel1">حساب مميز</h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal blockBox validationGroup">
                <div class="form-group">
                    <div class="col-sm-12 control-label pull-right">
                        <asp:Label ID="ErrorMessage" runat="server" EnableViewState="False" Visible="false" ForeColor="red"></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4 control-label pull-right">
                        <label>إسم المستخدم</label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:TextBox ID="UserName" runat="server" onkeypress="return validChars(event);" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="من فضلك أدخل إسم المستخدم ." ToolTip="من فضلك أدخل إسم المستخدم ." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="valPassword" runat="server" ControlToValidate="UserName" ErrorMessage="يجب أن يكون اسم المستخدم مكون من 5 إلى 17 حرف." ValidationExpression=".{5,17}.*" Display="Dynamic" ForeColor="Red" />
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="إسم المستخدم غير مطابق للشروط" ClientValidationFunction="isValid" ControlToValidate="UserName" Display="Dynamic" ForeColor="Red"></asp:CustomValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-4 control-label pull-right">
                        <label>كلمة المرور</label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="من فضلك أدخل كلمة المرور." ToolTip="من فضلك أدخل كلمة المرور." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
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
                    <div class="col-sm-4 control-label pull-right">
                        <label>البريد الإلكترونى</label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="من فضلك أدخل البريد الإلكترونى." ToolTip="من فضلك أدخل البريد الإلكترونى." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4 control-label pull-right">
                        <label>السؤال السرى</label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:DropDownList ID="Question" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">اختر السؤال السرى</asp:ListItem>
                            <asp:ListItem> اين ولدت</asp:ListItem>
                            <asp:ListItem>اقرب صديق اليك</asp:ListItem>
                            <asp:ListItem>اين تسكن</asp:ListItem>
                            <asp:ListItem>افضل مدينه زرتها</asp:ListItem>
                            <asp:ListItem>سيارة تتمنى اقتنائها</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4 control-label pull-right">
                        <label>إجابة السوال السرى</label>
                    </div>
                    <div class="col-sm-8 pull-right">
                        <asp:TextBox ID="Answer" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="من فضلك أدخل إجابة السؤال السرى." ToolTip="من فضلك أدخل إجابة السؤال السرى." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6 pull-left">
                        <asp:Button ID="btnRegister" runat="server" Text="إشترك" CssClass="btn btn-warning " ValidationGroup="CreateUserWizard1" Style="width: 100px;" OnClick="btnRegister_Click" />
                    </div>
                </div>

            </div>
        </div>

    </div>
</asp:Content>
