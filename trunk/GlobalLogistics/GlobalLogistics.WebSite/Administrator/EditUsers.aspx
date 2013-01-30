<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="EditUsers.aspx.cs" Inherits="GlobalLogistics.WebSite.Administrator.EditUsers" %>

<%@ Register Src="../Controls/AlphaLinks.ascx" TagName="AlphaLinks" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(function () {
        $("#mi20").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelViewUsers" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    المستخدمين الحاليين
                </h1>
                <div class="Details675">
                    <div class="AdminRight" style="width: 130px">
                        <div class="AdminMore">
                            <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة مستخدم جديد </asp:LinkButton>
                        </div>
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch" Direction="RightToLeft">
                        <div class="AdminRight">
                            &nbsp;</div>
                        <div class="AdminMiddle">
                            <asp:Label ID="Label5" runat="server" Text="بحث : " CssClass="Label"></asp:Label>
                            &nbsp;&nbsp;
                            <asp:TextBox ID="uiTextBoxSearch" runat="server" Width="300px"></asp:TextBox>
                            &nbsp;&nbsp;
                            <asp:Button ID="uiButtonSearch" runat="server" Text="بحث" OnClick="uiButtonSearch_Click"
                                Width="60px" Style="display: none;" />
                            <div class="SearchBtn">
                                <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiButtonSearch_Click">بحث</asp:LinkButton>
                            </div>
                        </div>
                        <div class="AdminLeft">
                        </div>
                        <div class="clear10">
                        </div>
                    </asp:Panel>
                    <div class="AdminMiddle" style="text-align: center; width: 100%;">
                        <uc1:AlphaLinks ID="AlphaLinks1" runat="server" />
                        <div class="clear10">
                        </div>
                        <div class="clear10">
                        </div>
                        <asp:GridView ID="uiGridViewUsers" runat="server" AutoGenerateColumns="false" AllowPaging="True"
                            AllowSorting="True" PageSize="4" OnPageIndexChanging="uiGridViewUsers_PageIndexChanging"
                            HorizontalAlign="Center" Width="95%" OnRowCommand="uiGridViewUsers_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="UserName" HeaderText="إسم المستخدم" />
                                <asp:TemplateField HeaderText="إجراءات">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("UserName") %>'
                                            CommandName="EditUser">تعديل</asp:LinkButton>&nbsp;
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("UserName") %>'
                                            CommandName="DeleteUser" OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                            <PagerStyle HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                    <div class="clear10">
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelEdit" runat="server">
            <div class="ContentLeftDiv">
                <h6>
                    تعديل المستخدمين
                </h6>
                <div class="AdminDetails728">
                    <div class="AdminRight" style="width: 150px">
                    </div>
                    <div class="AdminMiddle">
                        <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" Text="حدث خطأ . من فضلك حاول مرة أخرى."
                            Visible="False" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 150px">
                        <asp:Label ID="Label6" runat="server" CssClass="Label" Text="إسم المستخدم :"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxUserName" runat="server" Width="250px" ValidationGroup="EditUser"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxUserName" Display="Dynamic" ValidationGroup="EditUser"></asp:RequiredFieldValidator>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 150px">
                        <asp:Label ID="Label7" runat="server" CssClass="Label" Text="كلمة المرور :"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxPassword" runat="server" Width="250px" ValidationGroup="EditUser"
                            TextMode="Password"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                            ControlToValidate="uiTextBoxPassword" Display="Dynamic" ValidationGroup="EditUser"></asp:RequiredFieldValidator>
                        &nbsp;<asp:LinkButton ID="uiLinkButtonEditPassword" runat="server" 
                            onclick="uiLinkButtonEditPassword_Click">تعديل كلمة المرور</asp:LinkButton>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 150px">
                        <asp:Label ID="Label8" runat="server" CssClass="Label" Text="تأكيد كلمة المرور :"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxConfirm" runat="server" Width="250px" ValidationGroup="EditUser"
                            TextMode="Password"></asp:TextBox>
                        &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*"
                            ControlToCompare="uiTextBoxPassword" ControlToValidate="uiTextBoxConfirm" Display="Dynamic"
                            ValidationGroup="EditUser">كلمة المرور غير متطابقة</asp:CompareValidator>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 150px">
                        <asp:Label ID="Label9" runat="server" CssClass="Label" Text="البريد الإلكترونى :"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxMail" runat="server" Width="250px" ValidationGroup="EditUser"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ErrorMessage="*" ControlToValidate="uiTextBoxMail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ValidationGroup="EditUser"></asp:RegularExpressionValidator>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 150px">
                        <asp:Label ID="Label10" runat="server" CssClass="Label" Text="الصلاحيات :"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:CheckBoxList ID="uiCheckBoxListRoles" runat="server" CellPadding="2" CellSpacing="2"
                            RepeatColumns="2">
                        </asp:CheckBoxList>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 150px">
                        &nbsp;
                    </div>
                    <div class="AdminMiddle">
                        <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                        <div class="SearchBtn">
                            <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditUser"
                                OnClick="uiButtonUpdate_Click"></asp:LinkButton></div>
                        &nbsp; &nbsp; &nbsp;
                        <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                        <div class="SmallBtn">
                            <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click"></asp:LinkButton></div>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 150px">
                    </div>
                    <div class="AdminMiddle">
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelPassword" runat="server">
            <div class="ContentLeftDiv">
                <h1>
                    تغيير كلمة المرور
                </h1>
                <div class="Details675">
                    <div class="AdminRight" style="width: 160px">
                    </div>
                    <div class="AdminMiddle" style="text-align: right;">
                        <asp:Label ID="uiLabelMessage" runat="server" CssClass="Label" ForeColor="Red"></asp:Label>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 160px">
                        <asp:Label ID="Label14" runat="server" Text=" كلمة المرور الجديدة :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle" style="text-align:right;">
                        <asp:TextBox ID="uiTextBoxMainPassword" runat="server" ValidationGroup="Password"
                            TextMode="Password" Width="230px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="uiTextBoxMainPassword"
                            Display="Dynamic" ErrorMessage="*" ValidationGroup="Password"></asp:RequiredFieldValidator>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 160px">
                        <asp:Label ID="Label1" runat="server" Text=" إعادة كلمة المرور الجديدة :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle" style="text-align:right;">
                        <asp:TextBox ID="uiTextBoxRePassword" runat="server" ValidationGroup="Password" TextMode="Password"
                            Width="230px"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="uiTextBoxMainPassword"
                            ControlToValidate="uiTextBoxRePassword" Display="Dynamic" ErrorMessage="كلمة المرور غير متطابقة"
                            ValidationGroup="Password"></asp:CompareValidator>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                    <div class="AdminRight" style="width: 160px">
                    &nbsp;
                    </div>
                    <div class="AdminMiddle" style="text-align:right;">
                        <div class="SmallBtn">
                            <asp:LinkButton ID="uiButtonDone" runat="server" Text="تغيير" OnClick="uiButtonDone_Click"
                                ValidationGroup="Password"></asp:LinkButton></div>
                                &nbsp;  &nbsp; &nbsp;
                                <div class="SmallBtn">
                            <asp:LinkButton ID="uiLinkButtonSkip" runat="server" Text="إلغاء" OnClick="uiLinkButtonSkip_Click"
                                ></asp:LinkButton></div>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear5">
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
