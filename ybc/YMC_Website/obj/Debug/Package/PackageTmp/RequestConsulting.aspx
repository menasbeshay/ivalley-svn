<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RequestConsulting.aspx.cs" Inherits="YMC_Website.RequestConsulting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        $(document).ready(
            function () {
                $("#mi8").addClass("current");
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="direction:rtl;">
    <h1>
       طلب إستشارة</h1>
    <div class="clear" style="height: 20px;">
    </div>
    <table align="right">
        <tbody>
        <tr>
        <td colspan="3">
            <div class="AdminMiddle" id="divmsg" runat="server" visible="false" style="border: 1px solid green;
                padding: 30px; text-align: center;">
                <asp:Label ID="uiLabelmsge" runat="server" Font-Bold="True" ForeColor="Green" Text=".<br />وتم إرسال رسالة تأكيد على بريد الإلكترونى "></asp:Label>
            </div>
        </td>
        </tr>
            <tr>
                <td colspan="3" align="right">
                    في حال وجود أي عوائق أو استفسار يمكنك طلب استشاره من أحد المسؤولين عبر تعبئة الإستماره
                    و إرسالها إلى أقرب لجنة.
                </td>
            </tr>
            <tr>
                <td>
                    اللجنة :
                    <br>
                    <asp:DropDownList ID="uiDropDownListCommitte" runat="server" Width="220px">
                        <asp:ListItem Text="-- اختار --" Value="0"></asp:ListItem>
                        <asp:ListItem Text="لجنة شباب الأعمال بغرفة عرعر" Value="لجنة شباب الأعمال بغرفة عرعر"></asp:ListItem>
                        <asp:ListItem Text="لجنة شباب الاعمال بغرفة أبها" Value="لجنة شباب الاعمال بغرفة أبها"></asp:ListItem>
                        <asp:ListItem Text="لجنة شباب الأعمال بغرفة بالمدينة المنورة" Value="لجنة شباب الأعمال بغرفة بالمدينة المنورة"></asp:ListItem>
                        <asp:ListItem Text="لجنة شباب الأعمال بغرفة حائل" Value="لجنة شباب الأعمال بغرفة حائل"></asp:ListItem>
                        <asp:ListItem Text="لجنة شباب الأعمال بغرفة جيزان" Value="لجنة شباب الأعمال بغرفة جيزان"></asp:ListItem>
                        <asp:ListItem Text="لجنه شباب الأعمال بغرفة نجران" Value="لجنه شباب الأعمال بغرفة نجران"></asp:ListItem>
                        <asp:ListItem Text="لجنه شباب الأعمال بغرفة تبوك" Value="لجنه شباب الأعمال بغرفة تبوك"></asp:ListItem>
                        <asp:ListItem Text="لجنه شباب الأعمال بغرفة الخرج" Value="لجنه شباب الأعمال بغرفة الخرج"></asp:ListItem>
                        <asp:ListItem Text="لجنه شباب الأعمال بغرفة مكة المكرمة" Value="لجنه شباب الأعمال بغرفة مكة المكرمة"></asp:ListItem>
                        <asp:ListItem Text="لجنه شباب الأعمال بغرفة بجدة" Value="لجنه شباب الأعمال بغرفة بجدة"></asp:ListItem>
                        <asp:ListItem Text="لجنه شباب الأعمال بغرفة الأحساء" Value="لجنه شباب الأعمال بغرفة الأحساء"></asp:ListItem>
                        <asp:ListItem Text="لجنه شباب الأعمال بغرفة الرياض" Value="لجنه شباب الأعمال بغرفة الرياض"></asp:ListItem>
                        <asp:ListItem Text="لجنة شباب الأعمال بغرفة القصيم" Value="لجنة شباب الأعمال بغرفة القصيم"></asp:ListItem>
                        <asp:ListItem Text="لجنه شباب الأعمال بغرفة الشرقية" Value="لجنه شباب الأعمال بغرفة الشرقية"></asp:ListItem>
                    </asp:DropDownList>                    
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ControlToValidate="uiDropDownListCommitte" Display="Dynamic" 
                        ForeColor="Red" InitialValue="0" ValidationGroup="Req"></asp:RequiredFieldValidator>
                </td>
                <td>
                    نوع الاستشارة :
                    <br>
                    <asp:DropDownList ID="uiDropDownListType" runat="server">
                    <asp:ListItem Text="-- اختار --" Value="0"></asp:ListItem>
                        <asp:ListItem Text="ادارية" Value="ادارية"></asp:ListItem>
                        <asp:ListItem Text="تمويل" Value="تمويل"></asp:ListItem>
                        <asp:ListItem Text="مالية" Value="مالية"></asp:ListItem>
                        <asp:ListItem Text="موارد بشرية" Value="موارد بشرية"></asp:ListItem>
                        <asp:ListItem Text="اجراءات حكومية" Value="اجراءات حكومية"></asp:ListItem>
                        <asp:ListItem Text="اخرى" Value="اخرى"></asp:ListItem>                       
                    </asp:DropDownList>
                    &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                        ControlToValidate="uiDropDownListType" Display="Dynamic" ForeColor="Red" InitialValue="0"
                        ValidationGroup="Req"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    الاسم :
                    <br>
                    <asp:TextBox ID="uiTextBoxName" runat="server" Width="180px"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                        ControlToValidate="uiTextBoxName" Display="Dynamic" ForeColor="Red" 
                        ValidationGroup="Req"></asp:RequiredFieldValidator>
                </td>
                <td>
                    عنوان الاستشارة :
                    <br>
                    <asp:TextBox ID="uiTextBoxAdd" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                        ControlToValidate="uiTextBoxAdd" Display="Dynamic" ForeColor="Red" ValidationGroup="Req"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    البريد الالكترونى :
                    <br>
                    <asp:TextBox ID="uiTextBoxMail" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                        ControlToValidate="uiTextBoxMail" Display="Dynamic" ForeColor="Red" ValidationGroup="Req"></asp:RequiredFieldValidator>
                </td>
                <td rowspan="3" valign="top">
                    نص الاستشارة :
                    <br>
                    <asp:TextBox ID="uiTextBoxContent" runat="server" TextMode="MultiLine" 
                        Height="120px" Width="400px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                        ControlToValidate="uiTextBoxContent" Display="Dynamic" ForeColor="Red" ValidationGroup="Req"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    رقم الاتصال :
                    <br>
                    <asp:TextBox ID="uiTextBoxTele" runat="server" Width="180px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                        ControlToValidate="uiTextBoxTele" Display="Dynamic" ForeColor="Red" ValidationGroup="Req"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    الشركة :
                    <br>
                    <asp:TextBox ID="uiTextBoxCompany" runat="server" Width="180px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                        ControlToValidate="uiTextBoxCompany" Display="Dynamic" ForeColor="Red" ValidationGroup="Req"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 323px">
                    <asp:Label ID="uiLabelSuccess" runat="server" ForeColor="#00CC00" 
                        Text="تم الإرسال بنجاح" Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="uiLabelMsg" runat="server" ForeColor="Red" 
                        Text="حدث خطأ ، من فضلك أعد المحاولة" Visible="False"></asp:Label>
                </td>
                <input class="button" name="ss" type="hidden" value="0">
                <td align="left" style="width: 323px">
                    <asp:Button ID="uiButtonSend" runat="server" Text="ارسال" ValidationGroup="Req" 
                        onclick="uiButtonSend_Click" />
                </td>
                <td align="right">
                    &nbsp;
                </td>
            </tr>
        </tbody>
    </table>
        <div class="clear" style="height: 10px;">
    </div>
        <div class="clear" style="height: 1px;"></div>
        </div>
</asp:Content>
