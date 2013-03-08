<%@ Page Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true"
    CodeFile="AdminHealth_Office.aspx.cs" Inherits="AdminArea" %>

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
                        <asp:Label runat="server" ID="Label2" Text="„œÌ—Ì… «·’Õ…:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList runat="server" ID="drpGove" AutoPostBack="True" OnSelectedIndexChanged="drpGove_SelectedIndexChanged"
                            Width="165px" style="height: 22px">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label3" Text="«œ«—… ’ÕÌ…:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList runat="server" ID="drpCivilOffice" AutoPostBack="True" OnSelectedIndexChanged="drpCivilOffices_SelectedIndexChanged"
                            Width="165px">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblPoliceCode" Text="ﬂÊœ „ﬂ » «·’Õ…:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtHealthOfficeCode" Width="160px" 
                            MaxLength="10"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="req1" ErrorMessage="*" ControlToValidate="txtHealthOfficeCode"
                            ValidationGroup="InsUpd" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label1" Text="«”„ „ﬂ » «·’Õ…:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtHealthOfficeName" Width="160px" 
                            MaxLength="30"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="*"
                            ControlToValidate="txtHealthOfficeName" ValidationGroup="InsUpd" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td>
                <asp:Label runat="server" ID="lblTown" Text="«·„ﬂ » „ÊÃÊœ ›Ï «·Õ÷—"></asp:Label>
                </td>
                    <td colspan="2" align="right">
                        <asp:CheckBox runat="server" ID="chkIsTown" />
                    </td>
                    
                </tr>
            </table>
          
            
                <table dir="rtl" width="75%">
                <tr>
                <td colspan="2">
                <b>⁄‰Ê«‰ „ﬂ » «·’Õ…</b>
                </td>
                </tr>
                    <tr>
                        <td width="55px">
                            &nbsp;</td>
                        
                        <td>
                            <table>
                                <tr>
                                    <td style="padding-right: 10px;" width="30px">
                                        <asp:Label ID="lblSection" runat="server" 
                                           Text="ﬁ”„:"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                            ControlToValidate="drpPoliceStation" Display="Dynamic" ErrorMessage="*" 
                                            ForeColor="Red" InitialValue="0" SetFocusOnError="true" ValidationGroup="InsUpd"
                                            ></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drpPoliceStation"  runat="server" AutoPostBack="true" 
                                            OnSelectedIndexChanged="drpPoliceStation_SelectedIndexChanged" Width="165px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td style="padding-right: 10px;">
                                        <asp:Label ID="lblSubSection" runat="server" 
                                           Text="‘Ì«Œ…:"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                            ControlToValidate="dropArea" Display="Dynamic" ErrorMessage="*" ForeColor="Red" 
                                            InitialValue="0" SetFocusOnError="true" ValidationGroup="InsUpd"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dropArea" runat="server" Width="155px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div style="text-align:center">
                <br />
            <asp:Button runat="server" ID="btnSave" ValidationGroup="InsUpd" Text="«÷«›…" Width="100px"
                            OnClick="btnSave_Click" />
                            
             <br /><br />               
            </div>
                       
            <div dir="rtl">
                <asp:GridView runat="server" ID="grdGovernate" AutoGenerateColumns="false" AllowPaging="true"
                    OnPageIndexChanging="grdGovernate_PageIndexChanging" 
                    onrowdatabound="grdGovernate_RowDataBound" 
                    >
                    <Columns>
                        <asp:TemplateField HeaderText="ﬂÊœ „ﬂ » «·’Õ…">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkAreaCode" CommandName='<%#Eval("HEALTHDESCR")%>' CommandArgument='<%#Eval("CIVILCD")%>'
                                    ToolTip='<%#Eval("GOVCD")%>' Text='<%#Eval("HEALTHCD")%>' OnClick="lnkAreaCode_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="«”„ „ﬂ » «·’Õ…" DataField="HEALTHDESCR" />
                        <asp:BoundField HeaderText="«œ«—… ’ÕÌ…" DataField="CIVILDESCR" />
                        <asp:BoundField HeaderText="„œÌ—Ì… ’Õ…" DataField="GOVDESCR" />
                        <asp:BoundField HeaderText="„ÊÃÊœ ›Ï «·Õ÷—" DataField="IsTown" NullDisplayText="-" />
                        <asp:TemplateField HeaderText="Õ–› „ﬂ » ’Õ…">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lnkDelete" CommandArgument='<%#Eval("HEALTHCD")%>'
                                    Text="X" OnClick="lnkDelete_Click" OnClientClick="return confirm('«‰  ⁄·Ï Ê‘ﬂ Õ–› Â–Â «·»Ì«‰« ');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
