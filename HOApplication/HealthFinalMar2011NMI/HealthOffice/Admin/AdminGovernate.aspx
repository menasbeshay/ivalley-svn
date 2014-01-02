<%@ Page Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true"
    CodeFile="AdminGovernate.aspx.cs" Inherits="AdminGovernate" %>

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
                        <asp:Label runat="server" ID="lblGovCode" Text="ßæÏ ÇáãÍÇÝÙÉ:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtGoveCode" Width="160px" MaxLength="10"></asp:TextBox>
                    </td>
                    <td>
                    <asp:RequiredFieldValidator runat="server" ID="req1" ErrorMessage="*" 
                    ControlToValidate="txtGoveCode" ValidationGroup="InsUpd" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" 
                            ControlToValidate="txtGoveCode" Display="Dynamic" 
                            ErrorMessage="ßæÏ ÇáãÍÇÝÙÉ íÌÈ Çä íßæä ãä 1 - 3000" MaximumValue="3000" 
                            MinimumValue="1" ValidationGroup="InsUpd" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label1" Text="ÇÓã ÇáãÍÇÝÙÉ:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtGoveName" Width="160px" MaxLength="25"></asp:TextBox>
                    </td>
                    <td>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="*" 
                    ControlToValidate="txtGoveCode" ValidationGroup="InsUpd" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td colspan="2" align="left">
                <asp:Button runat="server" ID="btnSave" ValidationGroup="InsUpd" Text="ÇÖÇÝÉ" Width="100px" 
                        onclick="btnSave_Click" />
                </td>
                </tr>
            </table>
            
            
           
            <div dir="rtl">
            <asp:GridView runat="server" ID="grdGovernate" AutoGenerateColumns="false" 
                    AllowPaging="true" onpageindexchanging="grdGovernate_PageIndexChanging">
            <Columns>
            <asp:TemplateField HeaderText="ßæÏ ÇáãÍÇÝÙÉ">
            <ItemTemplate>
            <asp:LinkButton runat="server" ID="lnkGovCode" Text='<%#Eval("CD")%>' OnClick="lnkGovCode_Click"
            CommandArgument='<%#Eval("DESCR") %>'></asp:LinkButton>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ÇÓã ÇáãÍÇÝÙÉ" DataField="DESCR" />
             <asp:TemplateField HeaderText="ÍÐÝ ãÍÇÝÙÉ">
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
