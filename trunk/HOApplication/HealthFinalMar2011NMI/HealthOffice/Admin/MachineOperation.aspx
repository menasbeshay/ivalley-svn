<%@ Page Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true"
    CodeFile="MachineOperation.aspx.cs" Inherits="Admin_MachineOperation"  %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <asp:UpdatePanel runat="server" ID="updPanelGov">
        <ContentTemplate>
        <center>
        <asp:Label ID="lblPageHeader" Font-Size="XX-Large" runat="server"></asp:Label>
        </center>
            <br />
            <table dir="rtl" width="100%" align="center">
                <tr>
                    <td>
                        <asp:Label ID="lblLocation" Text="„ﬂ«‰  Ê«Ãœ «·Õ«”»" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpLocation" AutoPostBack="true" Width="160px" runat="server" OnSelectedIndexChanged="drpLocation_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblGov" Text="„œÌ—Ì… ’Õ…" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpGov" Width="160px" AutoPostBack="true" runat="server" OnSelectedIndexChanged="drpGov_SelectedIndexChanged">
                            <asp:ListItem Value="-1">«Œ — „œÌ—Ì…</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCivil" Text="«œ«—… ’ÕÌ…" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpCivil" Width="160px" AutoPostBack="true" runat="server" OnSelectedIndexChanged="drpCivil_SelectedIndexChanged">
                            <asp:ListItem Value="-1">«Œ — «œ«—…</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblOffice" Text="„ﬂ » ’Õ…" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpHealthOffice" Width="160px" runat="server">
                            <asp:ListItem Value="-1">«Œ — „ﬂ »</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="4">
                       <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updPanelGov" DisplayAfter="1" ID="progParents">
                                <ProgressTemplate>
                                <asp:Image runat="server" ID="imgLoading" ImageUrl="~/Images/loading.gif" />
                                Ã«—Ï «·»ÕÀ
                                </ProgressTemplate>
                                </asp:UpdateProgress>
                    </td>
                </tr>
            </table>
            <asp:Panel ID="pnlMachine" GroupingText="»Ì«‰«  «·ÃÂ«“" runat="server">
                <table align="center" dir="rtl" width="100%">
                    <tr>
                        <td width="140px">
                            <asp:Label ID="lblIP" Text="—ﬁ„  ⁄—Ì› «·Õ«”»" runat="server"></asp:Label>
                        </td>
                        <td width="250px">
                            <asp:TextBox ID="txtIP" Width="160px" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqIP" ValidationGroup="Save" ControlToValidate="txtIP" ErrorMessage="*" runat="server"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="reqIPex" runat="server" ErrorMessage="€Ì— ’ÕÌÕ" ValidationExpression="\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b" 
                            ControlToValidate="txtIP" ValidationGroup="Save" ></asp:RegularExpressionValidator>
                            
                        </td>
                        <td>
                            <asp:Label ID="Label1" Text="Õ«·… «·Õ«”»" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpStatus" Width="160px" runat="server">
                                <asp:ListItem Selected="True" Value="1">Ì⁄„·</asp:ListItem>
                                <asp:ListItem Value="0">„ﬁ›Ê·</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <asp:Button ID="btnAdd" ValidationGroup="Save" Text="«÷«›‹‹…" runat="server" 
                                OnClick="btnAdd_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <center>
            <asp:Label ID="lblMsg" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
            </center>
            <div dir="rtl" align="center">
                <asp:GridView runat="server" EmptyDataText="·«  ÊÃœ »Ì«‰« " ID="grdMachine" 
                    DataKeyNames="MachineId,OrgIPID,GovCD,CivilCD,LocationCD,HEALTHCD,OrgIP,Status" AutoGenerateColumns="false"
                    AllowPaging="true" PageSize="10"  
                    SelectedRowStyle-CssClass="AspNet-GridView-Selected"  
                   
                    OnRowDataBound="grdMachine_RowDataBound" 
                    onpageindexchanging="grdMachine_PageIndexChanging">
                    <SelectedRowStyle CssClass="AspNet-GridView-Selected" />
                    <Columns>
                       
                        <asp:BoundField HeaderText="„ﬂ«‰  Ê«Ãœ «·Õ«”»" DataField="LocationType" />
                        <asp:BoundField HeaderText="«·„œÌ—Ì…" DataField="Gov" />
                        <asp:BoundField HeaderText="«·«œ«—…" DataField="CIVIL" />
                        <asp:BoundField HeaderText="«·„ﬂ »" DataField="HealthDesc" />
                        <asp:BoundField HeaderText="—ﬁ„  ⁄—Ì› «·Õ«”»" DataField="OrgIP" />
                        <asp:TemplateField HeaderText="Õ«·… «·Õ«”»">
                            <ItemTemplate>
                               <asp:Label runat="server" ID="lblStatus"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button runat="server" ID="btnEdit" OnClick="lnkEdit_Click" CommandArgument='<%#Eval("MachineId")+ "," +Eval("OrgIPID")%>'
                                    Text=" ⁄œÌ·" ></asp:Button>
                                <asp:Button runat="server" ID="lnkDelete" OnClick="lnkDelete_Click" CommandArgument='<%#Eval("MachineId")+ "," +Eval("OrgIPID")%>'
                                    Text="Õ–›" OnClientClick="return confirm('«‰  ⁄·Ï Ê‘ﬂ Õ–› Â–Â «·»Ì«‰« ');"></asp:Button>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
