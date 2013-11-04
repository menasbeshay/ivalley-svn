<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditStudent.aspx.cs" Inherits="Taqwa.Website.Admin.EditStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<div class="clear"></div>
<div class="AdminMain">
<asp:Panel ID="uiPanelCurrentStudents" runat="server" Visible= "true"  style="direction:rtl;padding-right:20px;">
<div><h3>الطلاب الحاليين</h3></div>

<div>
<div class="AdminLeft">
        <asp:Label ID="Label9" runat="server" CssClass="Label">الصف :</asp:Label>
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListClasses" runat="server" 
                AutoPostBack="True" 
                onselectedindexchanged="uiDropDownListClasses_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>
        <div class="AdminLeft">
        <asp:Label ID="Label10" runat="server" CssClass="Label">الفصل :</asp:Label>
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListClassRooms" runat="server">
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>
        <div class="AdminLeft">
        <asp:Label ID="Label11" runat="server" CssClass="Label">Search text :</asp:Label>
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:TextBox ID="uiTextBoxSearchText" runat="server" Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight">
            &nbsp;<asp:Button ID="uiButtonSearch" runat="server" Text="Search" 
                onclick="uiButtonSearch_Click" />
    </div>
        <div class="clear"></div>
        <div class="AdminLeft"></div>
        <div class="AdminMiddle">
        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" 
        onclick="uiLinkButtonAdd_Click" style="font-size:15px;">إضافة طالب جديد </asp:LinkButton>

        </div>
        <div class="AdminRight">

    
        </div>
        <div class="clear"></div>

    <asp:GridView ID="uiGridViewStudents" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" 
        onrowcommand="uiGridViewStudents_RowCommand" AllowPaging="True" 
        onpageindexchanging="uiGridViewStudents_PageIndexChanging" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="إسم الطالب بالإنجليزية" DataField="ENStudentName" />
    <asp:BoundField  HeaderText="إسم الطالب بالعربية" DataField="ArStudentName" />
    <asp:BoundField  HeaderText="إسم الأب بالإنجليزية" DataField="ENFatherName" />
    <asp:BoundField  HeaderText="إسم الأب بالعربية" DataField="ArFatherName" />
    <asp:CheckBoxField HeaderText="نشط" DataField="IsActive" />
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="EditStudent" >تعديل</asp:LinkButton>
    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="DeleteStudent"  OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>

    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
        <RowStyle HorizontalAlign="Center" />
        <EmptyDataTemplate>
    عفواً ، لا توجد بيانات .
    </EmptyDataTemplate>
    </asp:GridView>
    <div class="clear"></div>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelCurrent" runat="server"  style="direction:rtl;padding-right:20px;">
    <div><h3>تعديل بيانات الطالب</h3></div>
        <div class="AdminLeft">
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelMessage" runat="server"></asp:Label>
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>
        <div class="AdminLeft" style="width: 195px">
        <asp:Label ID="Label15" runat="server" CssClass="Label">الصف :</asp:Label>
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListStudentClass" runat="server" 
                AutoPostBack="True" 
                onselectedindexchanged="uiDropDownListStudentClass_SelectedIndexChanged" 
                Width="200px">
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>
        <div class="AdminLeft" style="width: 195px">
        <asp:Label ID="Label29" runat="server" CssClass="Label">الفصل :</asp:Label>
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListStudentClassRoom" runat="server" 
                Width="200px">
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>
        <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="uiLabelEnglishTitle" runat="server" CssClass="Label" 
                Text="إسم الطالب بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxEnName" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="uiTextBoxEnName" ErrorMessage="*" 
                ValidationGroup="UpdatePage"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="uiLabelArabicTitle" runat="server" CssClass="Label" 
                Text="إسم الطالب بالعربية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxArName" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="uiTextBoxArName" ErrorMessage="*" 
                ValidationGroup="UpdatePage"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label1" runat="server" CssClass="Label" 
                Text="إسم الأب بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxENFatherName" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label2" runat="server" CssClass="Label" 
                Text="إسم الأب بالعربية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxARFatherName" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label3" runat="server" CssClass="Label" 
                Text="الرقم القومى للأب :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxNationalNo" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                runat="server" ErrorMessage="أرقام فقط"
                    ValidationGroup="UpdatePage" ValidationExpression="^[-+]?(\d)+$" ControlToValidate="uiTextBoxNationalNo"
                    ForeColor="#ff0000" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label4" runat="server" CssClass="Label" 
                Text="وظيفة الأب :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxJobDesc" runat="server" ValidationGroup="UpdatePage" 
                Width="400px" Height="60px" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label5" runat="server" CssClass="Label" 
                Text="البريد الإلكترونى :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxEmail" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" 
                runat="server" ControlToValidate="uiTextBoxEmail" Display="Dynamic" 
                ErrorMessage="أدخل البريد الإلكترونى بشكل صحيح" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
        </div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label6" runat="server" CssClass="Label" 
                Text="رقم التليفون :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxTele" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" 
                runat="server" ControlToValidate="uiTextBoxTele" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
        </div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label12" runat="server" CssClass="Label" 
                Text="رقم الموبايل :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxMobile" runat="server" ValidationGroup="UpdatePage" 
                Width="400px"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                runat="server" ControlToValidate="uiTextBoxMobile" Display="Dynamic" 
                ErrorMessage="أرقام فقط" ForeColor="#ff0000" 
                ValidationExpression="^[-+]?(\d)+$" ValidationGroup="UpdatePage"></asp:RegularExpressionValidator>
        </div>
        <div class="clear"></div>

        <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label13" runat="server" CssClass="Label" 
                Text="نشط :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:CheckBox ID="uiCheckBoxIsActive" runat="server" Text=" " 
                ValidationGroup="UpdatePage" />
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label7" runat="server" CssClass="Label" 
                Text="عنوان الطالب :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxAddress" runat="server" ValidationGroup="UpdatePage" 
                Width="400px" Height="84px" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

        
         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label14" runat="server" CssClass="Label" 
                Text="إسم المستخدم :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxUsername" runat="server" ValidationGroup="UpdatePage" 
                Width="400px" ></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>


         <div class="AdminLeft" style="width: 195px">
        </div>
        <div class="AdminMiddle">
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>         

        <div class="AdminLeft" style="width: 195px">
        &nbsp;
        </div>
        <div class="AdminMiddle">
            <asp:Button ID="uiButtonUpdate" runat="server" onclick="uiButtonUpdate_Click" 
                Text="إضافة / تعديل" ValidationGroup="UpdatePage" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                Text="إلغاء" />
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>
        </asp:Panel>

        <asp:Panel ID="uiPanelPrint" runat="server" >
        <script type="text/javascript">
            function PrintAll() {
                document.getElementById('<%= uiButtonPrint.ClientID %>').style.display = "none";
                document.getElementById('<%= uiButtonCancelPrint.ClientID %>').style.display = "none";
                window.print();
                document.getElementById('<%= uiButtonPrint.ClientID %>').style.display = "block";
                document.getElementById('<%= uiButtonCancelPrint.ClientID %>').style.display = "block";
            }
    </script>
    <div style="direction:rtl; padding-right:20px;"><h3>بيانات الطالب</h3></div>
        <div class="AdminLeft">
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="Label8" runat="server"></asp:Label>
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>

        <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label16" runat="server" CssClass="Label" 
                Text="إسم الطالب بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelEnName" runat="server"></asp:Label>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label17" runat="server" CssClass="Label" 
                Text="إسم الطالب بالعربية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelArName" runat="server"></asp:Label>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label18" runat="server" CssClass="Label" 
                Text="إسم الأب بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelEnFatherName" runat="server"></asp:Label>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label19" runat="server" CssClass="Label" 
                Text="إسم الأب بالعربية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelArFatherName" runat="server"></asp:Label>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label20" runat="server" CssClass="Label" 
                Text="الرقم القومى للأب :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelNationalNumber" runat="server"></asp:Label>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label21" runat="server" CssClass="Label" 
                Text="وظيفة الأب :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelJobDesc" runat="server"></asp:Label>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label22" runat="server" CssClass="Label" 
                Text="البريد الإلكترونى :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelMail" runat="server"></asp:Label>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label23" runat="server" CssClass="Label" 
                Text="رقم التليفون :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelTele" runat="server"></asp:Label>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label24" runat="server" CssClass="Label" 
                Text="رقم الموبايل :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelMobile" runat="server"></asp:Label>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

        <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label25" runat="server" CssClass="Label" 
                Text="نشط :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:CheckBox ID="uiCheckBoxact" runat="server" Text=" " 
                ValidationGroup="UpdatePage" onClick="javascript: return false;"/>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label26" runat="server" CssClass="Label" 
                Text="عنوان الطالب :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelAddress" runat="server"></asp:Label>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>

        
         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label27" runat="server" CssClass="Label" 
                Text="إسم المستخدم :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelUsername" runat="server" Text="Label"></asp:Label>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>


         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label28" runat="server" CssClass="Label" 
                Text="الرقم السرى :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelSecertCode" runat="server"></asp:Label>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>         

        <div class="AdminLeft" style="width: 195px">
        &nbsp;
        </div>
        <div class="AdminMiddle">
            <asp:Button ID="uiButtonPrint" runat="server" 
                Text="طباعة" OnClientClick="PrintAll();" />
            &nbsp;<asp:Button ID="uiButtonCancelPrint" runat="server" onclick="uiButtonCancel_Click" 
                Text="إلغاء" />
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>
        </asp:Panel>
    </div>

</asp:Content>
