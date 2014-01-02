<%@ Page Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true"
    CodeFile="AdminPoliceStation.aspx.cs" Inherits="AdminPoliceStation" %>

<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <%--<asp:UpdatePanel runat="server" ID="updPanelGov">
        <ContentTemplate>--%>
            <table dir="rtl" cellpadding="5">
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label2" Text="��������:"></asp:Label>
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
                        <asp:Label runat="server" ID="lblPoliceCode" Text="��� �����:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtPoliceCode" Width="160px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="req1" ErrorMessage="*" ControlToValidate="txtPoliceCode"
                            ValidationGroup="InsUpd" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label1" Text="��� �����:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtPoliceName" Width="160px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="*"
                            ControlToValidate="txtPoliceName" ValidationGroup="InsUpd" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="left">
                        <asp:Button runat="server" ID="btnSave" ValidationGroup="InsUpd" Text="�����" Width="100px"
                            OnClick="btnSave_Click" />
                    </td>
                </tr>
            </table>
            <div dir="rtl">
                <asp:GridView runat="server" ID="grdGovernate" AutoGenerateColumns="false" AllowPaging="true"
                    OnPageIndexChanging="grdGovernate_PageIndexChanging" EmptyDataText="����� �� ���� ������" EnableViewState="false">
                    <Columns>
                        <asp:TemplateField HeaderText="��� �����">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkGovCode" CommandArgument='<%#Eval("PoliceName")%>'
                                    ToolTip='<%#Eval("GoveID")%>' Text='<%#Eval("PoliceID")%>' OnClick="lnkGovCode_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="��� �����" DataField="PoliceName" />
                        <asp:BoundField HeaderText="��� ��������" DataField="GovName" />
                        <asp:TemplateField HeaderText="��� ���">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkDelete" CommandArgument='<%#Eval("PoliceID")%>'
                                    Text="X" OnClick="lnkDelete_Click" OnClientClick="return confirm('��� ��� ��� ��� ��� ��������');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
     <%--   </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
