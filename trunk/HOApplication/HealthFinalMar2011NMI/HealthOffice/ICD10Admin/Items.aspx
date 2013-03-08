<%@ Page Language="C#" MasterPageFile="~/MasterPages/ICD10Master.master" AutoEventWireup="true"
    CodeFile="Items.aspx.cs" Inherits="ICD10Admin_Items" Title="ICD10 Items" %>
<%@ MasterType VirtualPath="~/MasterPages/ICD10Master.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table dir="ltr" width="100%">
    <tr align="left">
            <td style="width:10%">
                <asp:Label runat="server" ID="Label1" Text="Category"></asp:Label>
            </td>
            <td style="width:20%">
                <asp:DropDownList runat="server" ID="drpICDcategories" AutoPostBack="True" 
                    onselectedindexchanged="drpICDcategories_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
           
            </td>
        </tr>
        <tr align="left">
            <td style="width:10%">
                <asp:Label runat="server" ID="lblItemFilter" Text="Item"></asp:Label>
            </td>
            <td style="width:20%">
                <asp:TextBox runat="server" ID="txtFilter" Width="250px"></asp:TextBox>
            </td>
            <td>
            <asp:Button runat="server" ID="btnFilter" Text="Fliter" onclick="btnFilter_Click" />
            </td>
        </tr>
        
    </table>
    <table dir="ltr" >
    <tr>
            <td colspan="3">
                <asp:GridView runat="server" ID="grdItem" AutoGenerateColumns="False" PageSize=9
                    AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" 
                    BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical"  
                    onpageindexchanging="grdItem_PageIndexChanging">
                    <Columns>
                        <asp:BoundField HeaderText="English Description" DataField="ITEMDESCREN" />
                        <asp:BoundField HeaderText="Arabic Description" DataField="ITEMDESCRAR" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ImageUrl="~/Images/Symbols-Delete-icon.png" OnClick="lnkDelete_Click"
                                    CommandArgument='<%# Eval("ITEMID") %>' ID="lnkDelete" OnClientClick="return confirm('تأكيد الحذف ؟');"
                                    ToolTip="حذف" Width="20px"></asp:ImageButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
