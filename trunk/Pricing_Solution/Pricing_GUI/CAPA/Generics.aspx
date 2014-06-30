<%@ Page Title="" Language="C#" MasterPageFile="~/CAPA/Site.Master" AutoEventWireup="true" CodeBehind="Generics.aspx.cs" Inherits="PricingGUI.Generics" %>
<%@ MasterType virtualpath="~/CAPA/Site.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style type="text/css">
/* technique 1 */
tbody tr:nth-child(odd){ background-color:#ccc; }
/* technique 2 */
TBODY TR.odd { background-color:#78a5d1; }
    .style1
    {
        width: 232px;
    }
</style>

<asp:UpdatePanel ID="ui_UpdtPanel" runat="server">
            <ContentTemplate>
   
    <table style="width: 80%;">
        <tbody>
        <tr>
            <td style="height: 24px; text-align: center;" colspan="6">
                <asp:Label ID="ui_lb_msg" runat="server" Font-Bold="True" Font-Underline="True"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 16%; height: 24px;">
                <asp:Label ID="Label1" runat="server" Text="Generic Name:" Width="150px"></asp:Label>
            </td>
            <td style="width: 19%; height: 24px;">
                <asp:TextBox ID="ui_txtGenericName" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="width: 9%; height: 24px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="ui_txtGenericName" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="#CC3300" SetFocusOnError="True" 
                    ValidationGroup="SaveComp"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 15%; height: 24px;">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
             <tr>
                 <td style="width: 16%; height: 24px;">
                     &nbsp;</td>
                 <td style="width: 19%; height: 24px;">
                     &nbsp;</td>
                 <td style="width: 9%; height: 24px;">
                     &nbsp;</td>
                 <td style="width: 15%; height: 24px;">
                     &nbsp;</td>
                 <td class="style1">
                     &nbsp;</td>
                 <td>
                     &nbsp;</td>
            </tr>
             <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: right">
                <asp:Button ID="ui_btn_Click" runat="server" class="btn btn-default" 
                    Font-Bold="true" Font-Size="17px" OnClick="ui_btn_Click_Click" Text="Search" />
                    &nbsp;&nbsp;&nbsp;
                <asp:Button ID="ui_btnSave" runat="server" class="btn btn-default" 
                    Font-Bold="true" Font-Size="17px" OnClick="ui_btnSave_Click" Text="Add New" 
                    ValidationGroup="SaveComp" />
                 </td>
            <td>&nbsp;</td>
            <td>
             
                &nbsp;</td>
            <td class="style1">
              
                &nbsp;</td>
            <td>
              
                &nbsp;</td>
        </tr>
            </tbody>
    </table>
       

    <br />
    <center>
                 <asp:UpdateProgress runat="Server" ID="ui_UpdatProgress" DisplayAfter="1" AssociatedUpdatePanelID="ui_UpdtPanel">
                                <ProgressTemplate>
                                    <asp:Image runat="server" ID="ui_ImgLoading" Width="20px" ImageUrl="~/images/loading.gif" />
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                </center>
                <br />
              
                    <table width="70%">
                        <tr>
                            <td>
                                <asp:GridView ID="ui_GvData" runat="server" AllowPaging="True" 
                                    AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                                    BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                    onpageindexchanging="ui_GvData_PageIndexChanging" PageSize="15" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="Name" HeaderText="Generic Name" />
                                        <%--<asp:BoundField DataField="Approved" HeaderText="Approved" />--%>
                                        
                                        <asp:TemplateField HeaderText="Approved">
                                            <ItemTemplate>
                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("Approved") %>' Enabled="False" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                    </Columns>
                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                    <RowStyle ForeColor="#000066" />
                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
              
                </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>
