<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="AddAccount.aspx.cs" Inherits="Chat2Connect.Admin.AddAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
    <script src="../js/commonfunc.js"></script>
    <script src="../js/jquery.tokeninput.js"></script>
    <link href="../css/token-input-facebook.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {            
            setupAutoComplete();
        });

        function setupAutoComplete() {
            $("#<%= uiTextBoxUsername.ClientID%>").tokenInput("../Services/Services.asmx/SearchMembersForTypes", {
                theme: "facebook",
                preventDuplicates: true,
                hintText: "",
                noResultsText: "لا يوجد",
                searchingText: "بحث فى الحسابات...",
                tokenLimit: 1,
                onAdd: function (item) {
                    $('#<%= hdnMember.ClientID%>').val(item.id);
                },
            });
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-lg-12" style="padding:0px">
        <div class="col-lg-6 pull-right">
            <div class="modal-content">
        <div class="modal-header">
            <h3 id="myModalLabel1">إنشاء حساب مميز </h3>
        </div>
        <div class="modal-body">
            <asp:Panel runat="server" ID="uiPanelRegister">
                <div class="form-horizontal blockBox validationGroup">
                    <div class="form-group">
                        <div class="col-lg-12 control-label pull-right">
                            <asp:Label ID="ErrorMessage" runat="server" EnableViewState="False" Visible="false" ForeColor="red"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3 control-label pull-right">
                            <label>إسم المستخدم</label>
                        </div>
                        <div class="col-lg-5 pull-right">
                            <asp:TextBox ID="UserName" runat="server" onkeypress="return validChars(event);" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="من فضلك أدخل إسم المستخدم ." ToolTip="من فضلك أدخل إسم المستخدم ." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-lg-3 control-label pull-right">
                            <label>كلمة المرور</label>
                        </div>
                        <div class="col-lg-5 pull-right">
                            <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="من فضلك أدخل كلمة المرور." ToolTip="من فضلك أدخل كلمة المرور." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3 control-label pull-right">
                            <label>تأكيد كلمة المرور</label>
                        </div>
                        <div class="col-lg-5 pull-right">
                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="من فضلك قم بإعادة كلمة المرور." ToolTip="من فضلك قم بإعادة كلمة المرور." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="كلمة المرور غير متطابقة." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3 control-label pull-right">
                            <label>البريد الإلكترونى</label>
                        </div>
                        <div class="col-lg-5 pull-right">
                            <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="من فضلك أدخل البريد الإلكترونى." ToolTip="من فضلك أدخل البريد الإلكترونى." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3 control-label pull-right">
                            <label>السؤال السرى</label>
                        </div>
                        <div class="col-lg-5 pull-right">
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
                        <div class="col-lg-3 control-label pull-right">
                            <label>إجابة السوال السرى</label>
                        </div>
                        <div class="col-lg-5 pull-right">
                            <asp:TextBox ID="Answer" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="من فضلك أدخل إجابة السؤال السرى." ToolTip="من فضلك أدخل إجابة السؤال السرى." ValidationGroup="CreateUserWizard1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3 control-label pull-right">
                            <label>نوع الترقية</label>
                        </div>
                        <div class="col-lg-8 pull-right">
                            <asp:RadioButtonList ID="lstTypes" runat="server" RepeatDirection="Horizontal" CssClass="form-control radio-inlineMain" RepeatLayout="Table">
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3 control-label pull-right">
                            <label>مدة الترقية</label>
                        </div>
                        <div class="col-lg-2 pull-right">
                            <asp:DropDownList ID="lstTypeDuration" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="col-lg-2 pull-right">
                            شهر
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3 control-label pull-right">
                            </div>
                        <div class=" col-lg-6 pull-right">
                            <asp:Button ID="btnRegister" runat="server" Text="إصدار" CssClass="btn btn-warning " ValidationGroup="CreateUserWizard1" Style="width: 100px;" OnClick="btnRegister_Click" />
                        </div>
                    </div>

                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="uiPanelDone">
                <div class="form-horizontal">
                    <div class="col-lg-12 control-label pull-right alert alert-success">
                        تم إنشاء الحساب بنجاح
                        <br />
                        <asp:LinkButton Text="إنشاء حساب أخر" runat="server" CssClass="btn btn-main" ID="uiLinkButtonCreateNew" OnClick="uiLinkButtonCreateNew_Click" />
                    </div>
                </div>

            </asp:Panel>
            <div class="clear"></div>
        </div>

    </div>
        </div>
        <div class="col-lg-6 pull-left">
            <div class="modal-content">
        <div class="modal-header">
            <h3 id="myModalLabel2">ترقية حساب حالى</h3>
        </div>
        <div class="modal-body">
            <asp:Panel runat="server" ID="uiPanelUpgrade">
                 <input type="hidden" id="hdnMember" runat="server" />
                <div class="form-horizontal blockBox validationGroup">
                    <div class="form-group">
                        <div class="col-lg-12 control-label pull-right">
                            <asp:Label ID="uiLabelError" runat="server" EnableViewState="False" Visible="false" ForeColor="red"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3 control-label pull-right">
                            <label>إسم المستخدم المراد ترقيته</label>
                        </div>
                        <div class="col-lg-5 pull-right">
                            <asp:TextBox ID="uiTextBoxUsername" runat="server" onkeypress="return validChars(event);" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" ErrorMessage="من فضلك أدخل إسم المستخدم ." ToolTip="من فضلك أدخل إسم المستخدم ." ValidationGroup="SearchMembers" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-lg-3 control-label pull-right">
                            <label>إسم المستخدم المميز الجديد</label>
                        </div>
                        <div class="col-lg-5 pull-right">
                            <asp:TextBox ID="uiTextBoxNewName" runat="server" onkeypress="return validChars(event);" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserName" ErrorMessage="من فضلك أدخل إسم المستخدم المميز ." ToolTip="من فضلك أدخل إسم المستخدم ." ValidationGroup="SearchMembers" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3 control-label pull-right">
                            <label>نوع الترقية</label>
                        </div>
                        <div class="col-lg-8 pull-right">
                            <asp:RadioButtonList ID="uiRadioButtonListTypes" runat="server" RepeatDirection="Horizontal" CssClass="form-control radio-inlineMain" RepeatLayout="Table">
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="يجب إختيار نوع الترقية" Display="Dynamic" ForeColor="Red" Font-Bold="true" ControlToValidate="uiRadioButtonListTypes"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3 control-label pull-right">
                            <label>مدة الترقية</label>
                        </div>
                        <div class="col-lg-2 pull-right">
                            <asp:DropDownList ID="uiDropDownListTypeDuration" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="col-lg-2 pull-right">
                            شهر
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3 control-label pull-right">
                            </div>
                        <div class=" col-lg-6 pull-right">
                            <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonSaveMember" Style="text-decoration: none;" OnClick="uiLinkButtonSaveMember_Click">حفظ</asp:LinkButton>
                        </div>
                    </div>

                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="uiPanelUpgradeSuccess" Visible="false">
                <div class="alert alert-success">
                    <asp:Label ID="uiLabelsuccess" runat="server" Text="تم تمييز الحساب بنجاح"></asp:Label>
                    <br />
                        <asp:LinkButton Text="ترقية حساب أخر" runat="server" CssClass="btn btn-main" ID="uiLinkButtonUpgradeNew" OnClick="uiLinkButtonUpgradeNew_Click" />
                </div>
            </asp:Panel>
            <div class="clear"></div>
        </div>

    </div>

        </div>
    </div>
    


</asp:Content>
