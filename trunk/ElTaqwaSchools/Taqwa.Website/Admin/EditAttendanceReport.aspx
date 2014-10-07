<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditAttendanceReport.aspx.cs" Inherits="Taqwa.Website.Admin.EditAttendanceReport" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="AdminMain">
<div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<asp:Panel ID="uiPanelCurrentStudents" runat="server" Visible= "true" style="direction:rtl;padding-right:20px;">
<div class="AdminLeft">

            </div>
            <div class="AdminMiddle">
                &nbsp;</div>
            <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
            <div class="clear">
            </div>
            <div class="AdminLeft">
                    <asp:Label ID="Label9" runat="server" CssClass="Label">الصف :</asp:Label>
                </div>
                <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListClasses" runat="server" 
                AutoPostBack="True" 
                onselectedindexchanged="uiDropDownListClasses_SelectedIndexChanged" Width="400px">
                    </asp:DropDownList>
                </div>
                <div class="AdminRight">
            &nbsp;</div>
                <div class="clear">
                </div>
                <div class="AdminLeft">
                    <asp:Label ID="Label10" runat="server" CssClass="Label">الفصل :</asp:Label>
                </div>
                <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListClassRooms" runat="server" Width="400px">
                    </asp:DropDownList>
                </div>
                <div class="AdminRight">
            &nbsp;</div>
                <div class="clear">
                </div>
                 <div class="AdminLeft">
                     <asp:Label ID="Label15" runat="server" CssClass="Label" Text="بحث :"></asp:Label>
                </div>
                <div class="AdminMiddle">
            &nbsp;<asp:TextBox ID="uiTextBoxSearchText" runat="server" Width="400px"></asp:TextBox>
                    &nbsp;<asp:Button ID="uiButtonSearch" runat="server" Text="بحث" 
                        onclick="uiButtonSearch_Click" />
                </div>
                <div class="AdminRight">
            &nbsp;</div>
                <div class="clear">
                </div>
            
<h3> الطلبة الحاليين</h3>
<div>
    <br />
    <asp:GridView ID="uiGridViewStudents" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="1" CellSpacing="3" 
        onpageindexchanging="uiGridViewStudents_PageIndexChanging" 
        onrowcommand="uiGridViewStudents_RowCommand">
        <AlternatingRowStyle HorizontalAlign="Center" />
        <Columns>
            <asp:BoundField DataField="ENStudentName" HeaderText="إسم الطالب بالإنجليزية" />
            <asp:BoundField DataField="ENFatherName" HeaderText="إسم الأب بالإنجليزية" />
            <asp:BoundField DataField="ArStudentName" HeaderText="إسم الطالب بالعربية" />
            <asp:BoundField DataField="ArFatherName" HeaderText="إسم الأب بالعربية" />
            <asp:CheckBoxField DataField="IsActive" HeaderText="نشط" />
            <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" 
                        CommandArgument='<%# Eval("StudentID") %>' CommandName="EditReports">إضافة / تعديل تقرير الشهر </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle HorizontalAlign="Center" />
        <EmptyDataTemplate>
            عفواً ، لا توجد بيانات.
        </EmptyDataTemplate>
    </asp:GridView>
    <br /><br />
</div>
<div>
    <div class="clear"></div>
    </div>
    </asp:Panel>

     <asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
    <div><h3>تعديل أيام الغياب الخاصة بالطالب</h3>
    
    <h4 style="direction:rtl;">الطالب الحالى : 
                        <asp:Label ID="uiLabelStudentName" runat="server"></asp:Label> 
                        <br /> الصف : <asp:Label ID="uiLabelClass" runat="server"></asp:Label>
    </h4>
    </div>
        <div class="AdminLeft">
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelMessage" runat="server"></asp:Label>
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>

        <div class="AdminLeft" style="width: 150px">
            <asp:Label ID="uiLabelArabicTitle" runat="server" CssClass="Label" 
                Text="يوم الغياب :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxDay" runat="server"></asp:TextBox>
            <cc1:CalendarExtender ID="uiTextBoxDay_CalendarExtender" runat="server" 
                Enabled="True" TargetControlID="uiTextBoxDay" Format="dd/MM/yyyy">
            </cc1:CalendarExtender>
        </div>
        <div class="AdminRight">
           
            &nbsp;</div>
        <div class="clear"></div>
        
       <div class="AdminLeft" style="width: 150px;">
        &nbsp;
        </div>
        <div class="AdminMiddle">
            <asp:Button ID="uiButtonUpdate" runat="server" onclick="uiButtonUpdate_Click" 
                Text="إضافة / تعديل" ValidationGroup="UpdatePage" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                Text="إلغاء" />
        </div>
        <div class="AdminRight">
            &nbsp;<asp:Button ID="uiButtonNewStudent" runat="server" 
                Text="إختيار طالب جديد" onclick="uiButtonNewStudent_Click" />
        </div>
        <div class="clear"></div>
        <br />

        <div>
            <asp:GridView ID="uiGridViewStudentsAbsence" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" CellPadding="1" CellSpacing="3" 
                onpageindexchanging="uiGridViewStudentsAbsence_PageIndexChanging" 
                onrowcommand="uiGridViewStudentsAbsence_RowCommand">
                <AlternatingRowStyle HorizontalAlign="Center" />
                <Columns>
                    <asp:BoundField DataField="ENStudentName" HeaderText="إسم الطالب بالإنجليزية" />
                    <asp:BoundField DataField="ENFatherName" HeaderText="إسم الأب بالإنجليزية" />
                    <asp:BoundField DataField="ArStudentName" HeaderText="إسم الطالب بالعربية" />
                    <asp:BoundField DataField="ArFatherName" HeaderText="إسم الأب بالعربية" />                    
                    <asp:BoundField DataField="Date" HeaderText="أيام الغياب" DataFormatString="{0:dd/MM/yyyy}"/> 
                    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="uiLinkButtonEdit" runat="server" 
                                CommandArgument='<%# Eval("MonthlyAttendanceReportID") %>' 
                                CommandName="EditReports">تعديل </asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                CommandArgument='<%# Eval("MonthlyAttendanceReportID") %>' CommandName="DeleteReports" OnClientClick="return confirm('Are you want to delete this record?');">حذف </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    عفواً ، لا توجد بيانات.
                </EmptyDataTemplate>
            </asp:GridView>
        </div>

        </asp:Panel>

</div>
</asp:Content>
