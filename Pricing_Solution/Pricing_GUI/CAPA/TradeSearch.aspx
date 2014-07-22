<%@ Page Title="" Language="C#" MasterPageFile="~/CAPA/Site.Master" AutoEventWireup="true" CodeBehind="TradeSearch.aspx.cs" Inherits="PricingGUI.TradeSearch" %>
<%@ MasterType virtualpath="~/CAPA/Site.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--<style type="text/css">
/* technique 1 */
tbody tr:nth-child(odd){ background-color:#ccc; }
/* technique 2 */
TBODY TR.odd { background-color:#78a5d1; }
</style>--%>
    <script src="../js/jquery.mtz.monthpicker.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#<%= uiTextBoxMonth.ClientID %>').monthpicker();
    });
</script>

    
   <cc1:TabContainer ID="ui_TabContainerSearch" ActiveTabIndex="0" runat="server" 
        CssClass="ajax__tab_yuitabview-theme">
   <cc1:TabPanel runat="server" ID="ui_MainData" HeaderText="Main Data">
            <HeaderTemplate>
                Main Data
            </HeaderTemplate>
            <ContentTemplate>
    <table style="width: 81%;">
        <tbody>
        <tr>
            <td style="width: 16%; height: 24px;">
                <asp:Label ID="Label1" runat="server" Text="Trade Name"></asp:Label>
            </td>
            <td style="width: 19%; height: 24px;">
                <asp:TextBox ID="ui_txtTradeName" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="width: 9%; height: 24px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="ui_txtTradeName" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
            </td>
            <td style="width: 15%; height: 24px;">
                <asp:Label ID="Label5" runat="server" Text="Dosage Form"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ui_drpDosageForm" runat="server" Width="225px">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="ui_drpDosageForm" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="Red" InitialValue="-1" SetFocusOnError="True" 
                    ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Company"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ui_drpCompanies" runat="server" Width="225px">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ui_drpCompanies" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="Red" InitialValue="-1" SetFocusOnError="True" 
                    ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Committe Type"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ui_drpCommitteType" runat="server" Width="225px">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="ui_drpCommitteType" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="Red" InitialValue="-1" SetFocusOnError="True" 
                    ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>File Type</td>
            <td>
                
                <asp:DropDownList ID="ui_drpFileType" AutoPostBack="True" runat="server" 
                    Width="225px" onselectedindexchanged="ui_drpFileType_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="ui_drpFileType" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Pack"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ui_txtPack" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="ui_txtPack" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Submission Date</td>
            <td>
               <asp:TextBox runat="server" Width="220px" CssClass="dateSelect" ID="ui_txtSubmissionDate" ></asp:TextBox>
               <cc1:CalendarExtender runat="server" TargetControlID="ui_txtSubmissionDate" 
                    ID="ui_calExntener" Enabled="True"></cc1:CalendarExtender>
               
                    
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="ui_txtSubmissionDate" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label8" runat="server" Text="File No."></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ui_txtFileNo" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="ui_txtFileNo" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Company Price"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ui_txtPrice" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="ui_txtPrice" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Select File"></asp:Label>
            </td>
            <td>
                 <asp:FileUpload ID="ui_fileUpload" runat="server" Font-Size="15px" />
                 <asp:HyperLink ID="ui_hyprlnkUploadedFile" runat="server" Text="View File ..." 
                     Visible="False"></asp:HyperLink>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="ui_txtFileNo" Display="Dynamic" ErrorMessage="*" 
                    Font-Bold="True" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr  runat="server" id="LocalTR">
            <td>
                <asp:Label ID="Label11" runat="server" Text="Local Manufacture"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ui_drpManufactures" runat="server" Width="225px">
                </asp:DropDownList>
            </td>
            <td></td>
            <td>
                &nbsp;</td>
            <td>
                 &nbsp;&nbsp;
                 </td>
            <td>
                &nbsp;</td>
        </tr>
             <tr runat="server" visible="False" id="ImportedTR">
            <td runat="server">
                <asp:Label ID="Label12" runat="server" Text="Imported Manufacture"></asp:Label>
            </td>
            <td runat="server">
              
                <asp:TextBox ID="ui_txtImportedManufacture" runat="server" Rows="3" 
                    TextMode="MultiLine" Width="220px"></asp:TextBox>
            </td>
            <td runat="server"></td>
            <td runat="server">
             
            </td>
            <td runat="server">
              
               
            </td>
            <td runat="server">
              
                &nbsp;</td>
        </tr>

        <tr >
            <td runat="server">
               
                &nbsp;</td>
            <td runat="server">
                &nbsp;</td>
            <td runat="server"></td>
            <td runat="server">
             
            </td>
            <td runat="server">
              
           
            </td>
        </tr>

            <tr>
                <td colspan="4" style="text-align:left">
                <asp:Label runat="server" ID="ui_lblResult"></asp:Label>
                </td>
                <td colspan="1" style="text-align:right">
                    <asp:Button runat="server" class="btn btn-default" Font-Bold="False" 
                        Font-Size="11pt" ID="ui_btnSave" Text="Add Main Data" 
                        OnClick="ui_btnSave_Click" Font-Names="Calibri" 
                        ValidationGroup="SaveMainPriceData" />
                   

                </td>

                <td style="text-align:right">
                    <asp:Button ID="ui_btn_Click" runat="server" class="btn btn-default" 
                        Font-Bold="False" Font-Size="11pt" OnClick="ui_btn_Click_Click" 
                        Text="Cancel" Font-Names="Calibri" />
                   

                </td>

            </tr>
           
            </tbody>
    </table>
    </ContentTemplate>
        </cc1:TabPanel>

        <cc1:TabPanel runat="server" ID="ui_TabGenericInfo" HeaderText="Composition">
            <ContentTemplate>
                <div style="display: block">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlDrag" runat="server" BackColor="#006699" CssClass="ModalDragHandle"
                                Height="25px">
                                <table align="center">
                                    <tr>
                                        <td>
                                            <asp:Label ID="uilblTitle" runat="server" ForeColor="White" Text="Change Generic Info"
                                                Width="100%"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <table class="style6">
                                <tr>
                                    <td class="style14">
                                        <asp:Label ID="Label13" runat="server" Text="Generic Name" ForeColor="Black" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td class="style12">
                                        <asp:Label ID="Label_Generic_Name" runat="server" ForeColor="Black"></asp:Label><asp:Label
                                            ID="Label_Generic_Name_ID" runat="server" ForeColor="Black" Visible="False"></asp:Label>
                                        <asp:CheckBox ID="ui_chb_GenericApproved" runat="server" Visible="False" Checked="True" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="ui_LnB_GenericSearch" runat="server" Font-Bold="True" 
                                            Font-Names="Courier New" Font-Underline="True" ForeColor="#003399" 
                                            onclick="ui_LnB_GenericSearch_Click" Font-Size="10pt">Add/Update Generic Name</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        <asp:Label ID="Label14" runat="server" Text="Concentration" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td class="style12">
                                        <asp:TextBox ID="TextBox_Quantity" runat="server" Width="150px" Font-Names="Calibri"
                                            Font-Size="11pt"></asp:TextBox><asp:DropDownList ID="DropDownList_Quantity_Unit"
                                                runat="server" AutoPostBack="True" Font-Names="Calibri" Font-Size="11pt" Width="150px">
                                            </asp:DropDownList>
                                    </td>
                                    <td>
                                        &#160;&#160;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        <asp:Label ID="Label15" runat="server" Text="/Quantity" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td class="style12">
                                        <asp:TextBox ID="TextBox_OverQuantity" runat="server" Width="150px" Font-Names="Calibri"
                                            Font-Size="11pt"></asp:TextBox><asp:DropDownList ID="DropDownList_Over_Quantity_Unit"
                                                runat="server" AutoPostBack="True" Font-Names="Calibri" Font-Size="11pt" Width="150px">
                                            </asp:DropDownList>
                                    </td>
                                    <td>
                                        &#160;&#160;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        &#160;&#160;
                                    </td>
                                    <td class="style12">
                                        &#160;&#160;
                                    </td>
                                    <td>
                                        &#160;&#160;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        <asp:Label ID="Label17" runat="server" Text="Equivalent Generic" ForeColor="Black"
                                            Font-Bold="True"></asp:Label>
                                    </td>
                                    <td class="style12">
                                        <asp:Label ID="Label_Equ_Generic_Name" runat="server" ForeColor="Black"></asp:Label><asp:Label
                                            ID="Label_Equ_Generic_Name_ID" runat="server" ForeColor="Black" Visible="False"></asp:Label>
                                        <asp:CheckBox ID="ui_chb_EquGenericApproved" runat="server" Visible="False" Checked="True" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="ui_LnB_EquiGenericSearch" runat="server" Font-Bold="True" 
                                            Font-Names="Courier New" Font-Underline="True" ForeColor="#003399" 
                                            onclick="ui_LnB_EquiGenericSearch_Click" Font-Size="10pt" 
                                            >Add/Update Equivalent Generic</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        <asp:Label ID="Label18" runat="server" Text="Equivalent Quantity" ForeColor="Black"
                                            Font-Bold="False"></asp:Label>
                                    </td>
                                    <td class="style12">
                                        <asp:TextBox ID="TextBox_EquQuantity" runat="server" Width="150px" Font-Names="Calibri"
                                            Font-Size="11pt"></asp:TextBox><asp:DropDownList ID="DropDownList_Eq_Quantity_Unit"
                                                runat="server" AutoPostBack="True" Font-Names="Calibri" Font-Size="11pt" Width="150px">
                                            </asp:DropDownList>
                                    </td>
                                    <td>
                                        &#160;&#160;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        <asp:Label ID="Label20" runat="server" Text="/Equivalent Quantity" ForeColor="Black"
                                            Font-Bold="False"></asp:Label>
                                    </td>
                                    <td class="style12">
                                        <asp:TextBox ID="TextBox_OverEquQuantity" runat="server" Width="150px" Font-Names="Calibri"
                                            Font-Size="11pt"></asp:TextBox><asp:DropDownList ID="DropDownList_Eq_Over_Quantity_Unit"
                                                runat="server" AutoPostBack="True" Font-Names="Calibri" Font-Size="11pt" Width="150px">
                                            </asp:DropDownList>
                                    </td>
                                    <td>
                                        &#160;&#160;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        &#160;&#160;
                                    </td>
                                    <td class="style12">
                                        &#160;&#160;
                                    </td>
                                    <td>
                                        &#160;&#160;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        <asp:Label ID="Label21" runat="server" ForeColor="Black" Text="Generic Type :" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td class="style12">
                                        <asp:DropDownList ID="DropDownList_GenericType" runat="server" Font-Names="Calibri"
                                            Font-Size="11pt" Width="150px">
                                            <asp:ListItem>Active</asp:ListItem>
                                            <asp:ListItem>InActive</asp:ListItem>
                                            <asp:ListItem>Diluent</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        &#160;&#160;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        &#160;&#160;
                                    </td>
                                    <td class="style12">
                                        &#160;&#160;
                                    </td>
                                    <td>
                                        &#160;&#160;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style14">
                                        &#160;&#160;
                                    </td>
                                    <td class="style12">
                                        &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                                        <asp:Button ID="Button_Update" runat="server" Font-Names="Calibri" Font-Size="11pt"
                                            Text="Add / Update" OnClick="Button_Update_Click" />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                                        <asp:Button ID="Button_Cancel" runat="server" Text="Cancel" Font-Names="Calibri"
                                            Font-Size="11pt" OnClick="Button_Cancel_Click" />
                                    </td>
                                    <td>
                                        &#160;&#160;
                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td class="style14" colspan="3">
                                    </td>
                                </tr>
                            </table>
                            <asp:Panel ID="uiPanelEditGeneric" runat="server" DefaultButton="Button_Generic_Search"
                                Style="display: block" BorderColor="#006699" BorderStyle="Solid" BorderWidth="1px" BackColor="WhiteSmoke">
                                <table class="style6">
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Panel ID="pnlDragGeneric" runat="server" BackColor="#006699" CssClass="ModalDragHandle"
                                                Height="25px">
                                                <table align="center">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="uilblTitle0" runat="server" ForeColor="White" Text="Change Generic Name"
                                                                Width="100%"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="TextBox_GenericSearch" runat="server" Font-Names="Calibri" Font-Size="11pt"
                                                Width="274px"></asp:TextBox>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                                            <asp:Button ID="Button_Generic_Search" runat="server" Font-Names="Calibri" Font-Size="11pt"
                                                OnClick="Button_Generic_Search_Click" Text="Search" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GridView_Search" runat="server" Width="100%" AutoGenerateColumns="False"
                                                CellPadding="3" AllowPaging="True" OnPageIndexChanging="GridView_Search_PageIndexChanging"
                                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                                <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>
                                                <RowStyle ForeColor="#000066"></RowStyle>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Select Genecric Name">
                                                        <ItemTemplate>
                                                            <table style="width: 100%" cellspacing="0" cellpadding="0" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="text-align: center">
                                                                            <asp:CheckBox ID="chRow" runat="server" __designer:wfdid="w10" ToolTip='<%# Eval("ID") %>'
                                                                                AutoPostBack="True" OnCheckedChanged="chRow_CheckedChanged"></asp:CheckBox>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="50px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Generic Name">
                                                        <ItemTemplate>
                                                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="text-align: center">
                                                                            <asp:Label ID="Label_New_Generic" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Approved">
                                            <ItemTemplate>
                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <asp:CheckBox ID="ui_chb_Approved" runat="server" Checked='<%# Eval("Approved") %>' Enabled="False" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                                </Columns>
                                                <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>
                                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#00547E" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Button ID="Button_Generic_Select0" runat="server" Font-Names="Calibri" Font-Size="11pt"
                                                Text="Select" OnClick="Button_Generic_Select0_Click" />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
                                            <asp:Button ID="Button_Change_Cancel" runat="server" Font-Names="Calibri" Font-Size="11pt"
                                                OnClick="Button_Change_Cancel_Click" Text="Cancel" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:GridView ID="GridView_Generic" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" Width="100%"
                                OnRowCommand="GridView_Generic_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="Active" HeaderText="Generic Name"/>
                                    <asp:BoundField DataField="QUANTITY" HeaderText="Quantity"  DataFormatString="{0:F}" />
                                    <asp:BoundField DataField="UnitName" />
                                    <asp:BoundField DataField="OverActiveQuantity" HeaderText="/Quantity" DataFormatString="{0:F}"  />
                                    <asp:BoundField DataField="OverActiveUnit" />
                                    <asp:BoundField DataField="Equi_Active" HeaderText="Equivalent Generic" />
                                    <asp:BoundField DataField="EQUI_QUANTITY" HeaderText="Equivalent Quantity" DataFormatString="{0:F}"  />
                                    <asp:BoundField DataField="Equi_Unit" />
                                    <asp:BoundField DataField="OverEquiActiveQuantity" HeaderText="/Equivalent Quantity" DataFormatString="{0:F}"  />
                                    <asp:BoundField DataField="OverEquiActiveUnit" />
                                    <asp:BoundField DataField="GenericType" HeaderText="Type" />
                                    <asp:CheckBoxField DataField="Approved" HeaderText="Approved" ReadOnly="true" />
                                    <%--<asp:TemplateField HeaderText="Approved">
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
                                        </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton_Edit" runat="server" CommandArgument='<%# Eval("Drug_Reguest_Substances_ID") %>'
                                                CommandName="ShowPopUp">Edit</asp:LinkButton>
                                                &#160;&#160;
                                            <asp:LinkButton ID="LinkButton_Delete" runat="server" CommandArgument='<%# Eval("Drug_Reguest_Substances_ID") %>'
                                                OnCommand="LinkButton_Delete_Command">Delete</asp:LinkButton><cc1:ConfirmButtonExtender
                                                    ID="ConfirmButtonExtender1" runat="server" ConfirmText="Are you sure ?" TargetControlID="LinkButton_Delete">
                                                </cc1:ConfirmButtonExtender>
                                                &nbsp;
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
                                                        
                             <cc1:ModalPopupExtender
                                ID="ui_modalPopup_Generic" runat="server" TargetControlID="ui_hdf_Generic" PopupControlID="uiPanelEditGeneric"
                                PopupDragHandleControlID="pnlDragGeneric" Drag="True" BackgroundCssClass="ModalBackground"
                                DynamicServicePath="" Enabled="True" />

                                <asp:HiddenField runat="server" ID="ui_hdf_Generic" />


                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </ContentTemplate>
        </cc1:TabPanel>

        <cc1:TabPanel runat="server" ID="uiTabBeforeCommitte" HeaderText="Before Committe">
            <ContentTemplate>
                <div style="display: block">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>                           
                            <table style="width: 81%;">
        <tbody>
        <tr>
            <td style="width: 16%; height: 24px;">
                <asp:Label ID="Label3" runat="server" Text="Reg. No."></asp:Label>
            </td>
            <td style="width: 19%; height: 24px;">
                <asp:TextBox ID="uiTextBoxBeforeRegNo" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="width: 9%; height: 24px;">
                &nbsp;</td>
            <td style="width: 15%; height: 24px;">
                <asp:Label ID="Label9" runat="server" Text="Committe type"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="uiDropDownListCommitterType_Before" runat="server" 
                    Width="225px">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label16" runat="server" Text="License Type"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="uiDropDownListLicenseType" runat="server" Width="225px">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label19" runat="server" Text="Status"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="uiDropDownListStatusType" runat="server" Width="225px">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Reference</td>
            <td>
                
                <asp:TextBox ID="uiTextBoxReference" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label22" runat="server" Text="Indication"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxIndication" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Submitted to specialized</td>
            <td>
                <asp:CheckBox ID="uiCheckBoxSubmittedToSpecialized" runat="server" />
               
                    
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label23" runat="server" Text="Dose"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxDose" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label24" runat="server" Text="Sales taxes"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="uiCheckBoxSalesTaxes" runat="server" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label25" runat="server" Text="Essential drug list"></asp:Label>
            </td>
            <td>
                 <asp:CheckBox ID="uiCheckBoxEssentialDrugList" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>

            <tr>
                <td colspan="4" style="text-align:left">
                    &nbsp;</td>
                <td colspan="1" style="text-align:right">
                    <asp:Button runat="server" class="btn btn-default" Font-Bold="False" 
                        Font-Size="11pt" ID="uiButtonBeforeComm_Save" Text="Add / update " 
                        OnClick="uiButtonBeforeComm_Save_Click" Font-Names="Calibri" 
                        ValidationGroup="SaveMainPriceData" />
                   

                </td>

                <td style="text-align:right">
                    &nbsp;</td>

            </tr>
           
            </tbody>
    </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </ContentTemplate>
        </cc1:TabPanel>

        <cc1:TabPanel runat="server" ID="uiTabPanelAfterCommitte" HeaderText="After Committe">
            <ContentTemplate>
                <div style="display: block">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>                           
                            <table style="width: 81%;">
        <tbody>
        <tr>
            <td style="width: 16%; height: 24px;">
                <asp:Label ID="Label26" runat="server" Text="Reg. No."></asp:Label>
            </td>
            <td style="width: 19%; height: 24px;">
                <asp:TextBox ID="uiTextBoxRegNoAfter" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td style="width: 9%; height: 24px;">
                &nbsp;</td>
            <td style="width: 15%; height: 24px;">
                <asp:Label ID="Label27" runat="server" Text="Sector type"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="uiDropDownListSectorType" runat="server" 
                    Width="225px">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label28" runat="server" Text="Committe price"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxCommittePrice" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label29" runat="server" Text="Committe date"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxCommitteDate" runat="server" Width="220px"></asp:TextBox>
                <cc1:CalendarExtender ID="uiTextBoxCommitteDate_CalendarExtender" Format="dd/MM/yyyy" 
                    runat="server" Enabled="True" TargetControlID="uiTextBoxCommitteDate">
                </cc1:CalendarExtender>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Rational for pricing</td>
            <td>
                
                <asp:TextBox ID="uiTextBoxRationalForPricing" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label30" runat="server" Text="No. of it in the box"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxNoInBox" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Lowest international Price of brand</td>
            <td>
                <asp:TextBox ID="uiTextBoxLowestIntPriceBrand" runat="server" Width="220px"></asp:TextBox>
               
                    
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label31" runat="server" Text="Brand Price in Egypt"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxBrandPriceInEgy" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="Label32" runat="server" Text="Price after 30% reduction for referenced high tech imported generic"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="uiTextBoxPriceAfter30" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
         <tr>
            <td colspan="4">
                <asp:Label ID="Label33" runat="server" Text="Price after 35% reduction for non referenced high tech imported generic"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="uiTextBoxPriceAfter35" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
         <tr>
            <td colspan="4">
                <asp:Label ID="Label34" runat="server" Text="Price after 35% reduction for imported generic & 1st 5 generic"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="uiTextBoxPriceAfter35FirstGeneric" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
         <tr>
            <td colspan="4">
                <asp:Label ID="Label35" runat="server" Text="Price after 40% reduction for imported generic & 2nd 5 generic"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="uiTextBoxPriceAfter40ndGeneric" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Lowest Price of the generic </td>
            <td>
                <asp:TextBox ID="uiTextBoxLowestPriceGeneric" runat="server" Width="220px"></asp:TextBox>
               
                    
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label36" runat="server" Text="Final Price"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxFinalPrice" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>

        <tr>
            <td colspan="4">Is the product priced according to 499 desicion</td>
            <td>
                <asp:CheckBox ID="uiCheckBoxIsPricedTo499" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>

        <tr>
            <td>Notes</td>
            <td>
                <asp:TextBox ID="uiTextBoxNotes" runat="server" Width="220px"></asp:TextBox>
               
                    
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label38" runat="server" Text="Main group"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxMainGroup" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Month</td>
            <td>
                <asp:TextBox ID="uiTextBoxMonth" runat="server" Width="220px"></asp:TextBox>
               
                    
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label37" runat="server" Text="similar or not"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="uiCheckBoxSimilar" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Previous pack</td>
            <td>
                <asp:TextBox ID="uiTextBoxPreviouspack" runat="server" Width="220px"></asp:TextBox>
               
                    
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label39" runat="server" Text="Previous price"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="uiTextBoxPreviousPrice" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
            <tr>
                <td colspan="4" style="text-align:left">
                    &nbsp;</td>
                <td colspan="1" style="text-align:right">
                    <asp:Button runat="server" class="btn btn-default" Font-Bold="False" 
                        Font-Size="11pt" ID="uiButtonUpdate_After" Text="Add / update " 
                        OnClick="uiButtonUpdate_After_Click" Font-Names="Calibri" 
                        ValidationGroup="SaveMainPriceData" />
                   

                </td>

                <td style="text-align:right">
                    &nbsp;</td>

            </tr>
           
            </tbody>
    </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </ContentTemplate>
        </cc1:TabPanel>
       <cc1:TabPanel runat="server" ID="uiTabPanelStatus" HeaderText="Status History">
           <ContentTemplate>
               <div style="display: block">
                   <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                       <ContentTemplate>
                           <table width="100%">
                               <tr>
                                   <td style="width: 90%">
                                       <asp:Label runat="server" ID="uilblStatusTitle" Text="Full Status Hstory" Font-Bold="true"
                                           Font-Size="23px" Font-Names="Sakkal Majalla"></asp:Label>
                                   </td>
                                   <td>
                                       <asp:Button runat="server" ID="btnOpenStatusModal" Text="Add status" Font-Size="Larger" OnClick="btnOpenStatusModal_Click" />
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                       <asp:Repeater runat="server" ID="rptrStatusList" OnItemDataBound="rptrStatusList_ItemDataBound">
                                           <ItemTemplate>
                                               <asp:Panel runat="server" ID="pnlStatusContainer" Font-Names="Sakkal Majalla" Font-Size="18px">
                                                   <table width="80%">
                                                       <tr>
                                                           <td style="width: 80%">
                                                               <p>
                                                                   <asp:Label runat="server" Font-Size="20px" Font-Bold="true" ID="Literal2" Text='<%# Eval("Status") %>'></asp:Label>
                                                                   &nbsp;&nbsp;
                                                                   <asp:Label runat="server" ID="Literal4" Text='<%#Eval("StatusDate", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                                               </p>
                                                               <p>
                                                                   <asp:Label runat="server" ID="lblStatusDetailsText"></asp:Label>
                                                               </p>
                                                           </td>
                                                           <td align="right" style="width:40px">
                                                               <asp:HyperLink runat="server" ImageUrl="~/Images/attachment.png" Target="_blank"
                                                                   ToolTip="View Attached File" Width="25px" ID="lnkViewAttachementFile" Text=""></asp:HyperLink>
                                                           </td>
                                                       </tr>
                                                   </table>
                                               </asp:Panel>
                                               <br />
                                           </ItemTemplate>
                                       </asp:Repeater>
                                   </td>
                                   <td>
                                   
                                   </td>
                               </tr>
                           </table>
                       </ContentTemplate>
                   </asp:UpdatePanel>
               </div>
               <!-- **********************  Popup Status ***************************************** -->
               <asp:Panel ID="uiPanelModifyStatus" runat="server" DefaultButton="btnOpenStatusModal"
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
                                               <asp:Label ID="Label40" runat="server" ForeColor="White" Text="Add status" Width="100%"></asp:Label>
                                           </td>
                                       </tr>
                                   </table>
                               </asp:Panel>
                           </td>
                       </tr>
                       <tr>
                           <td style="text-align: center">
                             <table width="100%" runat="server" cellpadding="5" id="tblAddStatusContainer">
                <tr>
                    <td style="width:15%">
                        <asp:Label runat="server" ID="ui_lblstatusTitle" Text="Status"></asp:Label>
                    </td>
                    <td style="width:70%">
                        <asp:DropDownList runat="server" ID="ui_drpTradeStatus" Width="310px">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="ValidateStatus"
                            ControlToValidate="ui_drpTradeStatus" InitialValue="-1" runat="server" ForeColor="Red"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr runat="server" visible="false" id="tr_committee_1">
                <td>
                 <asp:Label Text="CommitteeType" ID="lblCommitteetypeTitle" runat="server" />
                </td>
                <td>
                  <asp:DropDownList runat="server" ID="ui_drpCommitteeTypes" Width="200px">
                  <asp:ListItem Text="Evaluation Committee" Value="1" ></asp:ListItem>
                  <asp:ListItem Text="Discussion Committee" Value="2" ></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ValidationGroup="ValidateStatus"
                            ControlToValidate="ui_drpCommitteeTypes" InitialValue="-1" runat="server" ForeColor="Red"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr runat="server" visible="false" id="tr_committee_2">
                <td colspan="3">
                   <asp:Label Text="Committee Time" runat="server" ID="lblDateAndTimeForCommittee" />
                 &nbsp;&nbsp;
                <asp:TextBox runat="server" ID="ui_txtCommitteeDate" ></asp:TextBox>
                    <cc1:CalendarExtender runat="server" ID="committeeCalenderExtender" TargetControlID="ui_txtCommitteeDate"></cc1:CalendarExtender>
                    
                &nbsp;&nbsp;
                   Hours       
                    <asp:DropDownList runat="server" ID="drpCommitteeHours" >
                    <asp:ListItem Text="09" ></asp:ListItem><asp:ListItem Text="10" ></asp:ListItem>
                    <asp:ListItem Text="11" ></asp:ListItem><asp:ListItem Text="12" ></asp:ListItem>
                    <asp:ListItem Text="13" ></asp:ListItem><asp:ListItem Text="14" ></asp:ListItem>
                    <asp:ListItem Text="15" ></asp:ListItem><asp:ListItem Text="16" ></asp:ListItem>
                    <asp:ListItem Text="17" ></asp:ListItem><asp:ListItem Text="18" ></asp:ListItem>
                    <asp:ListItem Text="19" ></asp:ListItem><asp:ListItem Text="20" ></asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;
                     Minutes 
                      <asp:DropDownList runat="server" ID="drpCommitteeMinutes" >
                      <asp:ListItem Text="00" ></asp:ListItem>
                    <asp:ListItem Text="15" ></asp:ListItem>
                    <asp:ListItem Text="30" ></asp:ListItem>
                    <asp:ListItem Text="45" ></asp:ListItem>
                    </asp:DropDownList>
                </td>
                
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label41" Text="Comment"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="ui_txtStatusComment" TextMode="MultiLine" Width="300px"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="Label42" Text="Attache File"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload runat="server" ID="ui_fileStatusUpload" Width="200px" />
                    </td>
                    <td>
                      
                    </td>
                </tr>
            </table>

                 
                           </td>
                       </tr>
                      <tr>
                      <td>
                        <asp:Label runat="server" Visible="false" ID="lblCouldNotchangeStatus" Text="Sorry you couldn't change the status at the moment - it's the Role of Company Now . !" ></asp:Label>
                      </td>
                      </tr>
                       <tr>
                           <td style="text-align: center">
                               <asp:Button runat="server" ID="btnAddNewStatus" OnClick="btnAddNewStatus_Click" ValidationGroup="ValidateStatus" Text="Add status" />
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
               <cc1:ModalPopupExtender ID="ui_modalPopup_Status" runat="server" TargetControlID="ui_hdf_Status"
                   PopupControlID="uiPanelModifyStatus" PopupDragHandleControlID="pnlStatusDrag"
                   Drag="True" BackgroundCssClass="ModalBackground" DynamicServicePath="" Enabled="True" />
               <asp:HiddenField runat="server" ID="ui_hdf_Status" />
               <!-- ***************************************************************************************************** -->
           </ContentTemplate>
       </cc1:TabPanel>

    </cc1:TabContainer>   

    <br />
    

</asp:Content>
