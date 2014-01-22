<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Reports.master" AutoEventWireup="true" CodeFile="Rpt_ListBornMailFemaleLostCount.aspx.cs" Inherits="HealthReports_ListBornMailFemaleLostCount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<table dir="rtl" style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td align="center">
                بيان بعدد المواليد ذكور و إناث<br />
                بجميع مديريات وزارة الصحة<br />
                من الفترة
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
                <asp:GridView runat="server" EmptyDataText="لا توجد بيانات" ID="grdListBornMailFemaleLostCount"
                    AutoGenerateColumns="False" 
                    SelectedRowStyle-CssClass="AspNet-GridView-Selected" 
                    onrowdatabound="grdListBornMailFemaleLostCount_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="GovName" HeaderText="المديرية" />
                        <asp:BoundField DataField="BornLostMale" HeaderText="ساقط قيد ذكر" />
                        <asp:BoundField DataField="BornLostFemal" HeaderText="ساقط قيد أنثى" />
                        <asp:BoundField DataField="BornMale" HeaderText="مقيد ذكر" />
                        <asp:BoundField DataField="BornFemal" HeaderText="مقيد أنثى" />
                        <asp:BoundField HeaderText="المجموع" DataField="BornCount" />
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

