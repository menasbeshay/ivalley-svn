<%@ Page Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true"
    CodeFile="AdminOrg.aspx.cs" Inherits="AdminOrg" %>

<%@ MasterType VirtualPath="~/MasterPages/Admin.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <asp:UpdatePanel runat="server" ID="updPanelGov">
        <ContentTemplate>
            <table>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblOrgMainOffice" Text="ÇáãßÊÈ ÇáÑÆíÓì"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList Width="165px" runat="server" ID="drpMainOrg">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label1" Text="ÇÓã ÇáãßÊÈ"></asp:Label>
                    </td>
                    <td>
                       <asp:TextBox runat="server" ID="txtOfficeName" Width="160px"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="req1" ErrorMessage="*" ControlToValidate="txtOfficeName"
                            ValidationGroup="InsUpd" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label2" Text="ÇáãßÊÈ Ýì ÇáÍÖÑ¿"></asp:Label>
                    </td>
                    <td>
                       <asp:CheckBox runat="server" ID="chkISOfficeInTown" runat="server" Checked="true" />
                    </td>
                </tr>
                <tr>
                <td colspan>
                <asp:Label runat="server" ID="lblOfficeAddress" Text="ÚäæÇä ÇáãßÊÈ:" Font-Bold="true"></asp:Label>
                </td>
                </tr>
            </table>
            <table dir="rtl">
                <tr>
                    <td>
                        <asp:Label ID="lblState" runat="server" meta:resourcekey="lblStateResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpState" Width="155px" runat="server" meta:resourcekey="drpStateResource1"
                            AutoPostBack="True" OnSelectedIndexChanged="drpState_SelectedIndexChanged">
                            <asp:ListItem meta:resourcekey="ListItemResource1"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                            ID="RequiredFieldValidator3" ControlToValidate="drpState" InitialValue="0" ErrorMessage="*"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <table cellspacing="0" width="100%">
                            <tr>
                                <td width="30%" align="left" style="padding-left: 3px;">
                                    <asp:Label ID="lblSection" runat="server" meta:resourcekey="lblSectionResource1"></asp:Label>
                                </td>
                                <td style="padding-right: 10px;">
                                    <asp:DropDownList ID="dropSection" Width="155px" runat="server" meta:resourcekey="dropSectionResource1"
                                        AutoPostBack="True" OnSelectedIndexChanged="dropSection_SelectedIndexChanged">
                                        <asp:ListItem meta:resourcekey="ListItemResource2"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                                        ID="RequiredFieldValidator4" ControlToValidate="dropSection" InitialValue="0"
                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table width="100%" cellspacing="0">
                            <tr>
                                <td width="30%" style="padding-right: 40px;">
                                    <asp:Label ID="lblSubSection" runat="server" meta:resourcekey="lblSubSectionResource1"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:DropDownList ID="drpSubSection" Width="155px" runat="server" meta:resourcekey="drpSubSectionResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource3"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ValidationGroup="GenralValidate"
                                        ID="RequiredFieldValidator5" ControlToValidate="drpSubSection" InitialValue="0"
                                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <div style="text-align:center">
            <asp:Button runat="server" ID="btnSave" ValidationGroup="InsUpd" Text="ÇÖÇÝÉ" Width="100px" 
                    onclick="btnSave_Click" />
                    <br /><br />
            </div>
            <div dir="rtl">
                <asp:GridView runat="server" ID="grdGovernate" AutoGenerateColumns="false" AllowPaging="true"
                    OnPageIndexChanging="grdGovernate_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="ÇÓã ÇáãßÊÈ">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkOrgName" Text='<%#Eval("OrgDescription")%>' OnClick="lnkGovCode_Click"
                                    CommandArgument='<%#Eval("OrgID") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="OrgType" HeaderText="ÇáãßÊÈ Ýì ÇáÍÖÑ" />
                        <asp:BoundField HeaderText="ÇÓã ÇáãÍÇÝÙÉ" DataField="GoveName" />
                        <asp:BoundField HeaderText="ÇÓã ÇáÞÓã" DataField="PoliceName" />
                        <asp:BoundField HeaderText="ÇÓã ÇáÔíÇÎÉ" DataField="AreaName" />
                        <asp:TemplateField HeaderText="ÍÐÝ ãßÊÈ">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkDelete" CommandArgument='<%#Eval("OrgID")%>' Text="X"
                                    OnClick="lnkDelete_Click" OnClientClick="return confirm('ÇäÊ Úáì æÔß ÍÐÝ åÐå ÇáÈíÇäÇÊ');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
