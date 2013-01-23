<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SendPassword.aspx.cs" Inherits="YMC_Website.SendPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="direction: rtl;">
        <h1>
            إستعادة كلمة المرور</h1>
        <div class="clear" style="height: 20px;">
        </div>
        <div class="AdminRight">
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى ."
                Visible="False"></asp:Label>
            <br />
            <asp:Label ID="uiLabelMsg" runat="server" Font-Bold="True" ForeColor="#009933" 
                Text="تم إرسال كلمة السر الخاصة بك." Visible="False"></asp:Label>
        </div>
        <div class="AdminLeft">
        </div>
        <div class="clear">
        </div>
        <div class="AdminRight">
            <asp:Label ID="Label2" runat="server" Text="البريد الإلكترونى   : " CssClass="Label"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxEmail" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox></div>
        <div class="AdminLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                ControlToValidate="uiTextBoxEmail" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="أدخل البريد الإلكترونى بشكل صحيح"
                Display="Dynamic" ValidationGroup="EditPage" ControlToValidate="uiTextBoxEmail"
                Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
        <div class="clear" style="height:10px;">
        </div>
        
        <div class="AdminRight">
        </div>
        <div class="AdminMiddle" style="text-align: center">
            <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
            <div class="SearchBtn" style="width: 30px;">
                <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="إرسال" ValidationGroup="EditPage"
                    OnClick="uiLinkButtonUpdate_Click"></asp:LinkButton></div>
            &nbsp; &nbsp; &nbsp;
            <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
            <div class="SearchBtn" style="width: 30px;">
            </div>
        </div>
        <div class="AdminLeft">
        </div>
        <div class="clear">
        </div>
        </div>
</asp:Content>
