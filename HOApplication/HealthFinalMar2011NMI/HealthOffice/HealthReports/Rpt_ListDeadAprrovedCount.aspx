<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/LoginMaster.master" AutoEventWireup="true" CodeFile="Rpt_ListDeadAprrovedCount.aspx.cs" Inherits="HealthReports_Rpt_ListDeadAprrovedCount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<table dir="rtl" style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td align="center">
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
                <asp:GridView runat="server" EmptyDataText="لا توجد بيانات" ID="grdListDeadAprrovedCount"
                    AutoGenerateColumns="False" 
                    SelectedRowStyle-CssClass="AspNet-GridView-Selected">
                    <Columns>
                        <asp:BoundField DataField="GovName" HeaderText="المديرية الصحية" />
                        <asp:BoundField DataField="DeadCount" HeaderText="إدخالات وفيات" />
                        <asp:BoundField DataField="ApprovedDead" HeaderText="وفيات موثقة" />
                    </Columns>
                    <SelectedRowStyle CssClass="AspNet-GridView-Selected" />
                </asp:GridView>

                
                <asp:GridView runat="server" EmptyDataText="لا توجد بيانات" ID="grdListDeadAprrovedCountGov"
                    AutoGenerateColumns="False" 
                    SelectedRowStyle-CssClass="AspNet-GridView-Selected">
                    <Columns>
                        <asp:BoundField DataField="GovName" HeaderText="المديرية الصحية" />
                        <asp:BoundField DataField="CivilName" HeaderText="الإدارة الصحية" />                                              
                        <asp:BoundField DataField="DeadCount" HeaderText="إدخالات وفيات" />
                        <asp:BoundField DataField="ApprovedDead" HeaderText="وفيات موثقة" />
                    </Columns>
                    <SelectedRowStyle CssClass="AspNet-GridView-Selected" />
                </asp:GridView>

                <asp:GridView runat="server" EmptyDataText="لا توجد بيانات" ID="grdListDeadAprrovedCountCivil"
                    AutoGenerateColumns="False" 
                    SelectedRowStyle-CssClass="AspNet-GridView-Selected">
                    <Columns>
                        <asp:BoundField DataField="GovName" HeaderText="المديرية الصحية" />
                        <asp:BoundField DataField="CivilName" HeaderText="الإدارة الصحية" />   
                        <asp:BoundField DataField="HealthOfficeName" HeaderText="مكتب الصحة" />                    
                        <asp:BoundField DataField="DeadCount" HeaderText="إدخالات وفيات" />
                        <asp:BoundField DataField="ApprovedDead" HeaderText="وفيات موثقة" />
                    </Columns>
                    <SelectedRowStyle CssClass="AspNet-GridView-Selected" />
                </asp:GridView>

                <asp:GridView runat="server" EmptyDataText="لا توجد بيانات" ID="grdListDeadAprrovedCountHealthOffice"
                    AutoGenerateColumns="False" 
                    SelectedRowStyle-CssClass="AspNet-GridView-Selected">
                    <Columns>
                        <asp:BoundField DataField="GovName" HeaderText="المديرية الصحية" />
                        <asp:BoundField DataField="CivilName" HeaderText="الإدارة الصحية" />  
                        <asp:BoundField DataField="HealthOfficeName" HeaderText="مكتب الصحة" />  
                        <asp:BoundField DataField="DeadCount" HeaderText="إدخالات وفيات" />
                        <asp:BoundField DataField="ApprovedDead" HeaderText="وفيات موثقة" />
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

