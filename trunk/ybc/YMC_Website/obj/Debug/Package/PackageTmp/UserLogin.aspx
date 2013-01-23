<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="YMC_Website.UserLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="AdminMain" style="direction: rtl">
        <div class="ContentLeftDiv">
            <h1>
                دخول الأعضاء</h1>
            <div class="AdminDetails728">
                <div class="AdminRight">
                </div>
                <div class="AdminMiddle">
                    <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى ."
                        Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="uiLabelNotApproved" runat="server" Font-Size="10px" ForeColor="Red"
                        Text="لم يتم تفعيل حسابك، من فضلك أعد المحاولة لاحقاً" Visible="False"></asp:Label>
                </div>
                <div class="AdminLeft">
                </div>
                <div class="clear">
                </div>
                <div class="AdminRight">
                    <asp:Label ID="Label2" runat="server" Text="إسم المستخدم  : " CssClass="Label"></asp:Label>
                </div>
                <div class="AdminMiddle" style="width: 210px">
                    <asp:TextBox ID="uiTextBoxUserName" runat="server" ValidationGroup="EditPage" 
                        Width="200px"></asp:TextBox></div>
                <div class="AdminLeft">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                        ControlToValidate="uiTextBoxUserName" Display="Dynamic" ValidationGroup="EditPage"
                        Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="clear" style="height: 5px;">
                </div>
                <div class="AdminRight">
                    <asp:Label ID="Label3" runat="server" Text="كلمة المرور  : " CssClass="Label"></asp:Label>
                </div>
                <div class="AdminMiddle" style="width: 210px">
                    <asp:TextBox ID="uiTextBoxPassword" runat="server" ValidationGroup="EditPage" Width="200px"
                        TextMode="Password"></asp:TextBox></div>
                <div class="AdminLeft">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                        ControlToValidate="uiTextBoxPassword" Display="Dynamic" ValidationGroup="EditPage"
                        Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="clear" style="height: 5px;">
                </div>
                <div class="AdminRight">
                    &nbsp;
                </div>
                <div class="AdminMiddle">
                    <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                    <div class="SearchBtn">
                        <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="دخول" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click"></asp:LinkButton></div>
                    &nbsp; &nbsp; &nbsp;
                    <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                </div>
                <div class="AdminLeft">
                </div>
                <div class="clear" style="height: 5px;">
                </div>
            </div>
            </div>
            </div>
</asp:Content>
