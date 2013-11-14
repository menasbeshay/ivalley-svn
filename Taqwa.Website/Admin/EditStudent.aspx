<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditStudent.aspx.cs" Inherits="Taqwa.Website.Admin.EditStudent" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register src="Controls/ucMonthlyReport.ascx" tagname="ucMonthlyReport" tagprefix="uc1" %>
<%@ Register src="Controls/ucAttendanceReport.ascx" tagname="ucAttendanceReport" tagprefix="uc2" %>
<%@ Register src="Controls/ucFees.ascx" tagname="ucFees" tagprefix="uc3" %>
<%@ Register src="Controls/ucInstallment.ascx" tagname="ucInstallment" tagprefix="uc4" %>
<%@ Register src="Controls/ucresults.ascx" tagname="ucresults" tagprefix="uc5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery-ui-1.8.20.custom.min.js" type="text/javascript"></script>
    <link href="../css/jquery-ui-1.8.20.custom.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<div class="clear"></div>
    
<div class="AdminMain" id="Main">
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
    
    <asp:BoundField  HeaderText="إسم الطالب " DataField="ArStudentName" />
    
    <asp:BoundField  HeaderText="إسم الأب " DataField="ArFatherName" />
    <asp:CheckBoxField HeaderText="نشط" DataField="IsActive" />
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="EditStudent" ToolTip="تعديل"><img src="../images/icons/edit.gif" /></asp:LinkButton>
    <asp:LinkButton ID="uiLinkButtonMonthlyReport" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="EditMonthlyReport" ToolTip="التقرير الشهرى"><img src="../images/icons/reports.gif" /></asp:LinkButton>
    <asp:LinkButton ID="uiLinkButtonAttendanceReport" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="EditAttedanceReport" ToolTip="تقرير الغياب الشهرى"><img src="../images/icons/reports.gif" /></asp:LinkButton>
    <asp:LinkButton ID="uiLinkButtonFees" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="EditFees" ToolTip="المصروفات الدراسية"><img src="../images/icons/fees.gif" /></asp:LinkButton>
    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="EditInstallments" ToolTip="أقساط المصروفات الدراسية"><img src="../images/icons/installment.gif" /></asp:LinkButton>
    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="EditResultsFHMT" ToolTip="نتائج نصف الفصل الدراسى الأول "><img src="../images/icons/natiga.gif" /></asp:LinkButton>
    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="EditResultsFHF" ToolTip="نتائج نصف العام "><img src="../images/icons/natiga.gif" /></asp:LinkButton>
    <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="EditResultsSHMT" ToolTip="نتائج نصف الفصل الدراسى الثانى "><img src="../images/icons/natiga.gif" /></asp:LinkButton>
    <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="EditResultsSHF" ToolTip="نتائج نهاية العام "><img src="../images/icons/natiga.gif" /></asp:LinkButton>
    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("StudentID") %>' CommandName="DeleteStudent"  OnClientClick="return confirm('Are you want to delete this record?');" ToolTip="حذف"><img src="../images/icons/delete.gif" /></asp:LinkButton>

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
   
    
        <asp:Panel ID="uiPanelMonthlyReport" runat="server" Visible="false">
        <div class="dialog-modal" id="monthlyreportdiag" title="تعديل التقرير الشهرى للطالب">            
            <uc1:ucMonthlyReport ID="ucMonthlyReport1" runat="server" />
        </div>

        </asp:Panel>


        <asp:Panel ID="uiPanelAttendanceReport" runat='server' Visible="false" >
        
        <div class="dialog-modal" id="AttendanceReportdiag" title="تعديل أيام الغياب الخاصة بالطالب ">                        
            <uc2:ucAttendanceReport ID="ucAttendanceReport1" runat="server" />
        </div>
        </asp:Panel>


        <asp:Panel ID="uiPanelFees" runat='server' Visible="false"  >
        
        <div class="dialog-modal" id="Feesdiag" title="تعديل مصروفات الطالب ">                        
            <uc3:ucFees ID="ucFees1" runat="server" />
        </div>
        </asp:Panel>

         <asp:Panel ID="uiPanelInstallments" runat='server' Visible="false"  >
        
        <div class="dialog-modal" id="installmentdiag" title="تعديل أقساط المصروفات الدراسية للطالب ">                        
            <uc4:ucInstallment ID="ucInstallment1" runat="server" />            
        </div>
        </asp:Panel>

        <asp:Panel ID="uiPanelResults" runat='server' Visible="false"  >
        
        <div class="dialog-modal" id="resultsdiag" title="تعديل النتائج ">                                    
            <uc5:ucresults ID="ucresults1" runat="server" />
        </div>
        </asp:Panel>
    

     <script type="text/javascript">

        // Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
         
             $('.ui-widget-overlay').remove();

             $("#monthlyreportdiag").dialog({             
                 modal: true,
                 width: 650,
                 open: function (type, data) { $(this).parent().appendTo("#Main"); }
                 /*close: function (event, ui) {
                     //this.html('');
                     $(this).dialog('close');
                     $('.ui-widget-overlay').remove();
                 }*/
             });

             $("#AttendanceReportdiag").dialog({
                 modal: true,
                 width: 650,
                 open: function (type, data) { $(this).parent().appendTo("#Main"); }
                /* close: function (event, ui) {
                     //this.html('');
                      $(this).dialog('close');
                     $('.ui-widget-overlay').remove();
                 }*/
             });

              $("#Feesdiag").dialog({
                 modal: true,
                 width: 650,
                 open: function (type, data) { $(this).parent().appendTo("#Main"); }
                /* close: function (event, ui) {
                     //this.html('');
                      $(this).dialog('close');
                     $('.ui-widget-overlay').remove();
                 }*/
             });

              $("#installmentdiag").dialog({
                 modal: true,
                 width: 650,
                 open: function (type, data) { $(this).parent().appendTo("#Main"); }
                /* close: function (event, ui) {
                     //this.html('');
                      $(this).dialog('close');
                     $('.ui-widget-overlay').remove();
                 }*/
             });

             $("#resultsdiag").dialog({
                 modal: true,
                 width: 650,
                 open: function (type, data) { $(this).parent().appendTo("#Main"); }
                 /* close: function (event, ui) {
                 //this.html('');
                 $(this).dialog('close');
                 $('.ui-widget-overlay').remove();
                 }*/
             });
         
        // });

    </script>

    <script type="text/javascript">

      /*  $(document).ready(function () {
            $(".dialog-modal").dialog({
                autoOpen: false,
                modal: true,
                open: function (type, data) { $(this).parent().appendTo("form"); }
            });
        });*/
    </script>
</asp:Content>
