<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/LoginMaster.master" AutoEventWireup="true" CodeFile="Rpt_ListBornCityVillage.aspx.cs" Inherits="HealthReports_Rpt_ListBornCityVillage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script language="javascript" type="text/javascript">
// <!CDATA[

        function Button1_onclick() {

        }

// ]]>
    </script>
    <style type="text/css">
        .style1
        {
            width: 57%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
  <table dir="rtl" style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td align="center" class="style1">
                <span dir="RTL" lang="AR-SA" style="font-size:12.0pt;
font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;
mso-ansi-language:EN-GB;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">بيان بعدد المواليد 
                الموزعة حضر و ريف<br />
                بجميع مديريات وزارة الصحة<br />
                </span>بيانات المواليد من الفترة
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
            <td align="center" dir="rtl" class="style1">
                <asp:GridView runat="server" EmptyDataText="لا توجد بيانات" ID="grdListBornCityVillage"
                    AutoGenerateColumns="False" 
                    SelectedRowStyle-CssClass="AspNet-GridView-Selected" 
                    onrowdatabound="grdListBornCityVillage_RowDataBound">
                    <Columns>
                        <asp:BoundField HeaderText="المديرية"  DataField="GOV_DESCR"/>
                        <asp:BoundField HeaderText="ذكور حضر" DataField="TotalBorn_MaleTown" />
                        <asp:BoundField HeaderText="إناث حضر" DataField="TotalBorn_FemalTown" />
                        <asp:BoundField HeaderText="ذكور ريف" DataField="TotalBorn_MaleVillage" />
                        <asp:BoundField HeaderText="إناث ريف" DataField="TotalBorn_FemalVillage" />
                        <asp:BoundField HeaderText="المجموع" DataField="TotalBorn" />
                    </Columns>
                    <EmptyDataTemplate>
                        المديرية
                    </EmptyDataTemplate>
                    <SelectedRowStyle CssClass="AspNet-GridView-Selected" />
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="center" class="style1" dir="rtl">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="الإجمالي : "></asp:Label>
&nbsp;<asp:Label ID="lblTotal" runat="server"></asp:Label>
                    &nbsp;
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="center" class="style1">
                <asp:Label ID="lblMsg" runat="server" ForeColor="#FF3300" 
                    Text="حدث خطأ أثناء عرض التقرير"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="center" class="style1">
                <input id="Button1" type="button" onclick="window.print();" value="طباعة"  />&nbsp;
                <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" Text="رجوع" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

