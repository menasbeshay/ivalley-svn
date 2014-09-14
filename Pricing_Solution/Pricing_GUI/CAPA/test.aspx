<%@ Page Title="" Language="C#" MasterPageFile="~/CAPA/DefaultSite.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Pricing_GUI.CAPA.test" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Button Text="OpenModal" ID="btnOpenModal" runat="server" 
        onclick="btnOpenModal_Click" />

    <asp:Panel ID="uiPanelModifyStatus" runat="server" DefaultButton="btnOpenModal"
        Style="display: block" BorderColor="#006699" BorderStyle="Solid" BorderWidth="1px"
        BackColor="WhiteSmoke">
        <table class="style6">
            <tr>
                <td style="text-align: center">
                    <asp:Panel ID="pnlStatusDrag" runat="server" BackColor="#006699" CssClass="ModalDragHandle"
                        Height="25px">
                        <table align="center">
                            <tr>
                                <td>
                                    <asp:Label ID="uilblTitle0" runat="server" ForeColor="White" Text="Add status" Width="100%"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    &#160;&#160;
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Button runat="server" ID="btnAddNewStatus" Text="Add status" />
                    <asp:Button ID="btnCancelStatus" runat="server" Font-Names="Calibri" Font-Size="11pt"
                        Text="Cancel" />
                </td>
            </tr>
            <tr>
                <td>
                    &#160;&#160;
                </td>
            </tr>
        </table>
    </asp:Panel>
    <cc1:ModalPopupExtender id="ui_modalPopup_Status" runat="server" targetcontrolid="ui_hdf_Status"
        popupcontrolid="uiPanelModifyStatus" popupdraghandlecontrolid="pnlStatusDrag"
        drag="True" backgroundcssclass="ModalBackground" dynamicservicepath="" enabled="True" />

         <asp:HiddenField runat="server" ID="ui_hdf_Status" />

</asp:Content>
