<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/LoginMaster.master" AutoEventWireup="true" CodeFile="Rpt_ListBornDead.aspx.cs" Inherits="HealthReports_Rpt_ListBornDead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
 <table dir="rtl" style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td align="center">
                بيان بعدد المواليد موتى<br />
                بجميع مديريات وزارة الصحة<br />
                بيانات المواليد من الفترة
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
            <td align="center" dir="rtl" style="width:60%">
                <asp:GridView runat="server" EmptyDataText="لا توجد بيانات" ID="grdListBornDead"
                    AutoGenerateColumns="False" 
                    SelectedRowStyle-CssClass="AspNet-GridView-Selected" 
                    onrowdatabound="grdListBornDead_RowDataBound">
                    <Columns>
                        <asp:BoundField HeaderText="المديرية" DataField="GOV_DESCR" />
                        <asp:BoundField HeaderText="ذكور" DataField="TotalDead_Male" />
                        <asp:BoundField HeaderText="إناث" DataField="TotalDead_Femal" />
                        <asp:BoundField HeaderText="غير معلوم الجنس" DataField="TotalDead_Unknown" />
                        <asp:BoundField HeaderText="المجموع" DataField="TotalDead" />
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
            <td align="center" dir="rtl">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="الإجمالي : "></asp:Label>
&nbsp;<asp:Label ID="lblTotal" runat="server"></asp:Label>
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

