<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Carrers.aspx.cs" Inherits="website.Carrers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
        <h1>
            إتصل بنا</h1>
        <div class="Details675">
            <div class="AdminRight" style="width: 120px">
            </div>
            <div class="AdminMiddle">
                <asp:Label ID="uiLabelMessage" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى ."
                    Visible="False"></asp:Label>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label1" runat="server" Text="الإسم : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxName" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label2" runat="server" Text="البريد الإلكترونى :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxEmail" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxEmail" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label3" runat="server" Text="الموبايل :" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxMobile" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label4" runat="server" Text="الشركة :" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxCompany" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label5" runat="server" Text="الموقع الالكترونى : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxWebsite" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label6" runat="server" Text="العنوان :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxAddress" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label7" runat="server" Text="التليفون :" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxTele" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label8" runat="server" Text="الفاكس :" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxFax" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label9" runat="server" Text="التفاصيل :" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxComments" runat="server" ValidationGroup="EditPage" Width="400px"
                    Height="80px" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                &nbsp;
            </div>
            <div class="AdminMiddle">
                <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                <div class="SearchBtn">
                    <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="إرسال" ValidationGroup="EditPage"
                        OnClick="uiButtonUpdate_Click"></asp:LinkButton></div>
                &nbsp; &nbsp; &nbsp;
                <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <hr />
            <div class="clear10">
            </div>
            <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
        </div>
    </div>
</asp:Content>
