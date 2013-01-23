<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="YMC_Website.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        $(document).ready(
            function () {
                $("#mi10").addClass("current");
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="AdminMain" style="direction:rtl;">
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
            <div class="clear" style="height:5px;">
            </div>
            <div class="AdminRight" style="width: 120px">
            </div>
            <div class="AdminMiddle" id="divmsg" runat="server" visible="false" style="border:1px solid green;padding:30px;text-align:center;">
                <asp:Label ID="uiLabelMsg" runat="server" Font-Bold="True" ForeColor="Green" Text="تم إرسال طلبك بنجاح.<br />وتم إرسال رسالة تأكيد على بريد الإلكترونى "></asp:Label>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear" style="height: 5px;">
            </div>
            <div class="AdminRight">
                <asp:Label ID="Label1" runat="server" Text="الإسم : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxName" Display="Dynamic" 
                    ValidationGroup="EditPage" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="clear" style="height:5px;">
            </div>
            <div class="AdminRight">
                <asp:Label ID="Label2" runat="server" Text="البريد الإلكترونى :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxEmail" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxEmail" Display="Dynamic" 
                    ValidationGroup="EditPage" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="clear" style="height:5px;">
            </div>
            <div class="AdminRight">
                <asp:Label ID="Label3" runat="server" Text="الموبايل :" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxMobile" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear" style="height:5px;">
            </div>
            <div class="AdminRight">
                <asp:Label ID="Label9" runat="server" Text="التفاصيل :" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxComments" runat="server" ValidationGroup="EditPage" Width="500px"
                    Height="140px" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear" style="height:5px;">
            </div>
            <div class="AdminRight">
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
            <div class="clear" style="height:5px;">
            </div>
            <div class="clear10">
            </div>
            
        </div>
    </div>
    </div>
</asp:Content>
