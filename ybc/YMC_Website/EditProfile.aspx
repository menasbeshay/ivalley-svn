<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="YMC_Website.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MContent" runat="server">
    <div class="ContentLeftDiv" style="direction:rtl;">
        <h1>
            تعديل الأعضاء</h1>
        <div class="clear" style="height: 15px;">
        </div>
        <div class="AdminDetails728">
            <div class="AdminRight">
            </div>
            <div class="AdminMiddle">
                <asp:Label ID="uiLabelSucc" runat="server" Font-Bold="True" ForeColor="Green" Text="تم تحديث البيانات بنجاح ."
                    Visible="False"></asp:Label></div>
            <div class="AdminLeft">
            </div>
            <div class="clear" style="height: 10px;">
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
                <asp:Label ID="Label2" runat="server" Text="إسم المستخدم  : " CssClass="Label" ></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxUserName" runat="server" ValidationGroup="EditPage" Width="400px" ReadOnly="true"></asp:TextBox></div>
            <div class="AdminLeft">                
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
                    <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                        OnClick="uiLinkButtonUpdate_Click"></asp:LinkButton></div>
                &nbsp; &nbsp; &nbsp;
                <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
</asp:Content>
