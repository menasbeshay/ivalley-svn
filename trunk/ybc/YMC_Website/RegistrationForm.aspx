<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="YMC_Website.RegistrationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        $(document).ready(
            function () {
                $("#mi9").addClass("current");
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="AdminMain" style="direction:rtl">
    <div class="ContentLeftDiv">
        <h1>
            إستمارة طلب عضوية</h1>
        <div class="AdminDetails728">
            <div class="AdminRight" style="width: 120px">
            </div>
            <div class="AdminMiddle" id="divmsg" runat="server" visible="false" style="border: 1px solid green;
                padding: 30px; text-align: center;">
                <asp:Label ID="uiLabelMsg" runat="server" Font-Bold="True" ForeColor="Green" Text=".<br />وتم إرسال رسالة تأكيد على بريد الإلكترونى "></asp:Label>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear" style="height: 5px;">
            </div>
            <div class="AdminRight">
            </div>
            <div class="AdminMiddle">
                <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى ."
                    Visible="False"></asp:Label></div>
            <div class="AdminLeft">
            </div>
            <div class="clear">
            </div>
            <div class="AdminRight">
                <asp:Label ID="Label2" runat="server" Text="إسم المستخدم  : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxUserName" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox></div>
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
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxPassword" runat="server" ValidationGroup="EditPage" Width="400px"
                    TextMode="Password"></asp:TextBox></div>
            <div class="AdminLeft">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxPassword" Display="Dynamic" ValidationGroup="EditPage"
                    Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="clear" style="height: 5px;">
            </div>
            <div class="AdminRight">
                <asp:Label ID="Label1" runat="server" Text="تأكيد كلمة المرور  : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxConfirm" runat="server" ValidationGroup="EditPage" Width="400px"
                    TextMode="Password"></asp:TextBox></div>
            <div class="AdminLeft">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxConfirm" Display="Dynamic" ValidationGroup="EditPage"
                    Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp;
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ErrorMessage="كلمة المرور غير متطابقة" ControlToCompare="uiTextBoxPassword" 
                    ControlToValidate="uiTextBoxConfirm" Display="Dynamic" Font-Bold="True" 
                    ForeColor="Red" ValidationGroup="EditPage"></asp:CompareValidator>
            </div>
            <div class="clear" style="height: 5px;">
            </div>
            <div class="AdminRight">
                <asp:Label ID="Label5" runat="server" Text="الإسم بالكامل  : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxFullName" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox></div>
            <div class="AdminLeft">
            </div>
            <div class="clear" style="height: 5px;">
            </div>
            <div class="AdminRight">
                <asp:Label ID="Label6" runat="server" Text="البريد الإلكترونى  : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxMail" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox></div>
            <div class="AdminLeft">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="أدخل البريد الإلكترونى بشكل صحيح"
                    Display="Dynamic" ValidationGroup="EditPage" ControlToValidate="uiTextBoxMail"
                    Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div class="clear" style="height: 5px;">
            </div>
            <div class="AdminRight">
                <asp:Label ID="Label7" runat="server" Text="التليفون  : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxTele" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox></div>
            <div class="AdminLeft">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="uiTextBoxTele"
                    ErrorMessage="أرقام فقط." ValidationExpression="^\d*\.?\d*$" ValidationGroup="EditPage"
                    Font-Bold="True" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div class="clear" style="height: 5px;">
            </div>
            <div class="AdminRight">
                <asp:Label ID="Label8" runat="server" Text="الوظيفة  : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxJob" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox></div>
            <div class="AdminLeft">
            </div>
            <div class="clear" style="height: 5px;">
            </div>
            <div class="AdminRight">
                <asp:Label ID="Label9" runat="server" Text="معلومات أخرى  : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxInfo" runat="server" ValidationGroup="EditPage" Width="400px"
                    Height="100px" TextMode="MultiLine"></asp:TextBox></div>
            <div class="clear" style="height: 5px;">
            </div>            
            
            <div class="clear" style="height: 10px;">
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
    </div>
</div>
</asp:Content>
