<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"
    CodeFile="ApproveDead.aspx.cs" Inherits="ApproveDead" Title="تاكيد الوفيات" %>

<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table dir="rtl" width="100%">
        <tr>
            <td>
                <asp:GridView runat="server" ID="grdBorns" OnRowDataBound="grdDead_RowDataBound" 
                    EmptyDataText="لا توجد بيانات متاحة " AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3">
                    <RowStyle ForeColor="#000066" />
                    <Columns>
                        <asp:TemplateField HeaderText="اسم المتوفى">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkBornName" OnClick="lnkBornName_Click" Text='<%#Eval("DeadFirstName") %>'
                                    CommandArgument='<%#Eval("DeadEventID") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="اسم الاب " DataField="DeadFatherName" />
                        <asp:BoundField HeaderText="اسم الجد " DataField="DeadGrandName" />
                        <asp:BoundField HeaderText="اللقب " DataField="DeadFamilyName" />
                        <asp:BoundField HeaderText="رقم التليفون " DataField="DeadPhone" />
                        <asp:BoundField HeaderText="مكان الوفاة " DataField="DiePlace" />
                        <asp:BoundField HeaderText="تاريخ التبليغ " DataFormatString="{0:dd-MM-yyyy}" DataField="RegisterDate" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
