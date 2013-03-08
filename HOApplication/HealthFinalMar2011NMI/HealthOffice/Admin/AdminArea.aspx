<%@ Page Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true"
    CodeFile="AdminArea.aspx.cs" Inherits="AdminArea" %>

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
                        <asp:Label runat="server" ID="Label2" Text="ÇáãÍÇÝÙÉ:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList runat="server" ID="drpGove" AutoPostBack="True" OnSelectedIndexChanged="drpGove_SelectedIndexChanged"
                            Width="165px">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label3" Text="ÇáÞÓã:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList runat="server" ID="drpPoliceStation" AutoPostBack="True" OnSelectedIndexChanged="drpPoliceStation_SelectedIndexChanged"
                            Width="165px">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblPoliceCode" Text="ßæÏ ÇáÔíÇÎÉ:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtAreaCode" Width="160px" MaxLength="10"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="req1" ErrorMessage="*" ControlToValidate="txtAreaCode"
                            ValidationGroup="InsUpd" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label1" Text="ÇÓã ÇáÔíÇÎÉ:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtAreaName" Width="160px" MaxLength="20"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="*"
                            ControlToValidate="txtAreaName" ValidationGroup="InsUpd" ForeColor="Red"></asp:RequiredFieldValidator>
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
                <asp:GridView runat="server" ID="grdGovernate" AutoGenerateColumns="false" AllowPaging="true"
                    OnPageIndexChanging="grdGovernate_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="ßæÏ ÇáÔíÇÎÉ">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkAreaCode" CommandName='<%#Eval("AreaName")%>' CommandArgument='<%#Eval("PoliceID")%>'
                                    ToolTip='<%#Eval("GoveID")%>' Text='<%#Eval("AreaID")%>' OnClick="lnkAreaCode_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="ÇÓã ÇáÔíÇÎÉ" DataField="AreaName" />
                        <asp:BoundField HeaderText="ÇÓã ÇáÞÓã" DataField="PoliceName" />
                        <asp:BoundField HeaderText="ÇÓã ÇáãÍÇÝÙÉ" DataField="GoveName" />
                        <asp:TemplateField HeaderText="ÍÐÝ ÞÓã">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkDelete" CommandArgument='<%#Eval("AreaID")%>'
                                    Text="X" OnClick="lnkDelete_Click" OnClientClick="return confirm('ÇäÊ Úáì æÔß ÍÐÝ åÐå ÇáÈíÇäÇÊ');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
