<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/LoginMaster.master" AutoEventWireup="true" CodeFile="Rpt_ListBornAprrovedCount.aspx.cs" Inherits="HealthReports_Rpt_ListBornAprrovedCount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table dir="rtl" style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td align="center">
                احصائية إدخال المواليد بجميع مديريات وزارة الصحة
                <br />
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
            <td align="center" dir="rtl" style="width:50%">
                <asp:GridView runat="server"  EmptyDataText="لا توجد بيانات" ID="grdListBornAprrovedCount"
                    AutoGenerateColumns="False" 
                    SelectedRowStyle-CssClass="AspNet-GridView-Selected">
                    <Columns>
                        <asp:BoundField DataField="GovName" HeaderText="المديرية الصحية" />
                        <asp:BoundField DataField="BornCount" HeaderText="إدخالات مواليد" />
                        <asp:BoundField DataField="ApprovedBorn" HeaderText="مواليد موثقة" />
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

