<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/LoginMaster.master" AutoEventWireup="true" CodeFile="Rpt_ListDeadStatistcs.aspx.cs" Inherits="HealthReports_Rpt_ListDeadMaleFemaleCount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<table dir="rtl" style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td align="center">
                تقرير الوفيات<br />
                بجميع مديريات وزارة الصحة<br />
                بيانات الوفيات من الفترة
                <asp:Label ID="lblFrom" runat="server"></asp:Label>
&nbsp;إلى الفترة
                <asp:Label ID="lblTo" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="center" dir="rtl">
                <asp:GridView runat="server" EmptyDataText="لا توجد بيانات" ID="grdListDeadStatistcs"
                    AutoGenerateColumns="False" 
                    SelectedRowStyle-CssClass="AspNet-GridView-Selected">
                    <Columns>
                        <asp:BoundField HeaderText="المديرية" DataField="GovName" />
                        <asp:BoundField HeaderText="جملة الوفيات" DataField="TotalDead" />
                        <asp:BoundField HeaderText="ذكر" DataField="TotalDead_Male" />
                        <asp:BoundField HeaderText="أنثى" DataField="TotalDead_Femal" />
                        <asp:BoundField HeaderText="مجهول الهوية" DataField="TotalDead_Unknown" />
                        <asp:BoundField HeaderText="أقل من 7 يوم" DataField="TotalDead_LessThan7" />
                        <asp:BoundField HeaderText="7-28" DataField="TotalDead_M7L28" />
                        <asp:BoundField HeaderText="من 28 - سنة" DataField="TotalDead_M28LYear" />
                        <asp:BoundField HeaderText="أقل من سنة" DataField="TotalDead_LessYear" />
                        <asp:BoundField HeaderText="1-5" DataField="TotalDead_M1yearL5Year" />
                        <asp:BoundField HeaderText="أقل من 5 سنوات" DataField="TotalDead_Less5Year" />
                        <asp:BoundField HeaderText="5-15" DataField="TotalDead_M5yearL15Year" />
                        <asp:BoundField HeaderText="15-49" DataField="TotalDead_M15yearL49Year" />
                        <asp:BoundField HeaderText="49-65" DataField="TotalDead_M49yearL65Year" />
                        <asp:BoundField HeaderText="65+" DataField="TotalDead_More65Year" />
                        <asp:BoundField HeaderText="أثناء الحمل" DataField="TotalDead_ThroughCarry" />
                        <asp:BoundField HeaderText="أثناء الإجهاض" 
                            DataField="TotalDead_ThroughAbortion" />
                        <asp:BoundField HeaderText="أثناء الولادة" DataField="TotalDead_ThroughBirth" />
                        <asp:BoundField HeaderText="بعد الولادة" DataField="TotalDead_AfterBirth" />
                    </Columns>
                    <SelectedRowStyle CssClass="AspNet-GridView-Selected" />
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="center">
                <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300" 
                    Text="حدث خطأ أثناء عرض التقرير"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="center">
                <input id="Button1" type="button" onclick="window.print();" value="طباعة" />&nbsp;
                <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" Text="رجوع" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

