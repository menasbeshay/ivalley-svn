<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAttendanceReport.ascx.cs" Inherits="Taqwa.Website.Admin.Controls.ucAttendanceReport" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%--<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>--%>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
    <div>
    
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
           <%-- <cc1:CalendarExtender ID="uiTextBoxDay_CalendarExtender" runat="server" 
                Enabled="True" TargetControlID="uiTextBoxDay" Format="dd/MM/yyyy">
            </cc1:CalendarExtender>--%>
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
            &nbsp;
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
                    
                    <asp:BoundField DataField="ArStudentName" HeaderText="إسم الطالب " />
                    <asp:BoundField DataField="ArFatherName" HeaderText="إسم الأب " />                    
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
        
</ContentTemplate>
</asp:UpdatePanel>
