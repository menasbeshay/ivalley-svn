<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminListTroubleShooting.ascx.cs"
    Inherits="UserControls_AdminListTroubleShooting" %>
    <style type="text/css">
        .style1
        {
            width: 100%;
            border-collapse: collapse;
        }
    </style>
    <div style="direction:rtl">
    <div>
        <asp:Label ID="uiLabelTitle" runat="server" 
            meta:resourcekey="uiLabelTitleResource1"></asp:Label></div>

        <div>
        
            <table cellpadding="2" cellspacing="2" class="style1">
                <tr>
                    <td style="text-align: left">
                        <asp:Label ID="uiLabelGov" runat="server" 
                            meta:resourcekey="uiLabelGovResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="uiDropDownListGov" runat="server" 
                            meta:resourcekey="uiDropDownListGocResource1" AutoPostBack="True" 
                            onselectedindexchanged="uiDropDownListGov_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: left">
                        <asp:Label ID="uiLabelCivil" runat="server" 
                            meta:resourcekey="uiLabelCivilResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="uiDropDownListCivil" runat="server" 
                            meta:resourcekey="uiDropDownListCivilResource1">
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: left">
                        <asp:Label ID="uiLabelPriority" runat="server" 
                            meta:resourcekey="uiLabelPriorityResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="uiDropDownListPriority" runat="server" 
                            meta:resourcekey="uiDropDownListPriorityResource1">
                        </asp:DropDownList>
                    </td>
                    <td style="text-align: left">
                        <asp:Label ID="uiLabelStatus" runat="server" 
                            meta:resourcekey="uiLabelStatusResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="uiDropDownListStatus" runat="server" 
                            meta:resourcekey="uiDropDownListStatusResource1">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button ID="uiButtonSearch" runat="server" 
                            meta:resourcekey="uiButtonSearchResource1" onclick="uiButtonSearch_Click"/>
                    </td>
                </tr>
            </table>
        
        </div>
        
<asp:GridView ID="uiGridViewTroubleshootings" runat="server" 
            AutoGenerateColumns="False" EnableModelValidation="True" 
            meta:resourcekey="uiGridViewTroubleshootingsResource1" 
            onrowcommand="uiGridViewTroubleshootings_RowCommand">
    <Columns>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
            <ItemTemplate>
                <%# Eval("MachineGovName") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource2">
            <ItemTemplate>
                <%# Eval("MachineCivilName") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource3">
            <ItemTemplate>
                <%# Eval("PriorityName") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
            <ItemTemplate>
                <%# DateTime.Parse(Eval("Date").ToString()).ToShortDateString() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource5">
            <ItemTemplate>
                <%# DateTime.Parse(Eval("Time").ToString()).ToShortTimeString() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource6">
            <ItemTemplate>
                <%# Eval("StatusName") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource7">
            <ItemTemplate>
            <asp:Button ID="uiButtonEdit" runat="server" 
                        CommandArgument='<%# Eval("TroubleshootingID") %>' 
                    CommandName="EditTroubleshooting" meta:resourcekey="uiButtonEditResource1"
                        />
                    <asp:Button ID="uiButtonDelete" runat="server" 
                        CommandArgument='<%# Eval("TroubleshootingID") %>' CommandName="DeleteTroubleshootingID" 
                        OnClientClick='return confirm("هل تريد حذف هذا السجل ؟");' meta:resourcekey="uiButtonDeleteResource1"
                         />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
</div>