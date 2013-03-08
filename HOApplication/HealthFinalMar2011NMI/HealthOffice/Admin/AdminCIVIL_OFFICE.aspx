<%@ Page Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true"
    CodeFile="AdminCIVIL_OFFICE.aspx.cs" Inherits="AdminPoliceStation" %>

<%@ MasterType VirtualPath="~/MasterPages/Admin.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <asp:UpdatePanel runat="server" ID="updPanelGov">
        <ContentTemplate>
            <table dir="rtl" cellpadding="5">
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label2" Text="ãÏíÑíÉ ÇáÕÍÉ:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList runat="server" ID="drpGove" AutoPostBack="True" OnSelectedIndexChanged="drpGove_SelectedIndexChanged"
                            Width="160px">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblPoliceCode" Text="ßæÏ ÇáÇÏÇÑÉ ÇáÕÍíÉ:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtCivilCode" Width="160px" MaxLength="10"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="req1" ErrorMessage="*" ControlToValidate="txtCivilCode"
                            ValidationGroup="InsUpd" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label1" Text="ÇÓã ÇáÇÏÇÑÉ ÇáÕÍíÉ:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtCivilName" Width="160px" MaxLength="30"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="*"
                            ControlToValidate="txtCivilName" ValidationGroup="InsUpd" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="left">
                        <asp:Button runat="server" ID="btnSave" ValidationGroup="InsUpd" Text="ÇÖÇÝÉ" Width="100px"
                            OnClick="btnSave_Click" />
                    </td>
                </tr>
            </table>
            <div dir="rtl">
                <asp:GridView runat="server" ID="grdGovernate" AutoGenerateColumns="False" AllowPaging="True"
                    OnPageIndexChanging="grdGovernate_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="ßæÏ ÇáÇÏÇÑÉ ÇáÕÍíÉ">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkGovCode" CommandArgument='<%#Eval("DESCR")%>'
                                    ToolTip='<%#Eval("FK_GOVCD")%>' Text='<%#Eval("CD")%>' OnClick="lnkGovCode_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="ÇÓã ÇáÇÏÇÑÉ ÇáÕÍíÉ" DataField="DESCR" />
                        <asp:TemplateField HeaderText="ÍÐÝ ÇÏÇÑÉ ÕÍíÉ">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkDelete" CommandArgument='<%#Eval("CD")%>'
                                    Text="X" OnClick="lnkDelete_Click" OnClientClick="return confirm('ÇäÊ Úáì æÔß ÍÐÝ åÐå ÇáÈíÇäÇÊ');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
