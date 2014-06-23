<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true"
    CodeBehind="New_Request.aspx.cs" Inherits="Pricing_GUI.New_Request" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="row-fluid ">
        <div class="span12">
            <!-- BEGIN INLINE TABS PORTLET-->
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-reorder"></i><asp:Label runat="server" ID="lblPageTitle" ForeColor="#003366" Text="Submit New Pricing Request"></asp:Label></h4>
                    <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a class="icon-remove"
                        href="javascript:;"></a></span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span6" style="width: 100%">
                            <!--BEGIN TABS-->
                            <div class="tabbable tabbable-custom" id="myTab">
                                <ul class="nav nav-tabs">
                                    <li runat="server" id="tab_MainData" class="active"><a href="#tab_1_1" data-toggle="tab">
                                      <asp:Label runat="server" ID="lblMainDataTab" Text="Main Data" ForeColor="Brown" Font-Bold="true"></asp:Label> </a></li>
                                    <li runat="server" id="tab_Generics"><a href="#tab_1_2" data-toggle="tab">
                                    <asp:Label runat="server" ID="lblGenericTab" Text="Generic information" ForeColor="DarkGreen" Font-Bold="true"></asp:Label>
                                    </a></li>
                                    <li runat="server" id="tab_Status"><a href="#tab_1_3" data-toggle="tab">
                                    <asp:Label runat="server" ID="lblStatusTab" Text="Status History" ForeColor="DarkGoldenrod" Font-Bold="true"></asp:Label>
                                    </a></li>
                                </ul>
                                <div class="tab-content" >
                                    <div  class="tab-pane active" id="tab_1_1">
                                    <asp:Panel runat="server" ID="pnl_MainData_Content">
                                        <table >
                                            <tbody>
                                                <tr>
                                                    <td style="width: 16%; height: 24px;">
                                                        <asp:Label ID="Label1" runat="server" Text="Trade Name"></asp:Label>
                                                    </td>
                                                    <td style="width: 19%; height: 24px;">
                                                        <asp:TextBox ID="ui_txtTradeName" runat="server" Width="220px"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 9%; height: 24px;">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ui_txtTradeName"
                                                            Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" SetFocusOnError="True"
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
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ui_drpDosageForm"
                                                            Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" InitialValue="-1"
                                                            SetFocusOnError="True" ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
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
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ui_drpCompanies"
                                                            Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" InitialValue="-1"
                                                            SetFocusOnError="True" ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label6" runat="server" Text="Committe Type"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ui_drpCommitteType" runat="server" Width="225px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ui_drpCommitteType"
                                                            Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" InitialValue="-1"
                                                            SetFocusOnError="True" ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        File Type
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ui_drpFileType" AutoPostBack="True" runat="server" Width="225px"
                                                            OnSelectedIndexChanged="ui_drpFileType_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ui_drpFileType"
                                                            Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" SetFocusOnError="True"
                                                            ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label7" runat="server" Text="Pack"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="ui_txtPack" runat="server" Width="220px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ui_txtPack"
                                                            Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" SetFocusOnError="True"
                                                            ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Submission Date
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" Width="220px" CssClass="dateSelect" ID="ui_txtSubmissionDate"></asp:TextBox>
                                                        <cc1:CalendarExtender runat="server" TargetControlID="ui_txtSubmissionDate" ID="ui_calExntener"
                                                            Enabled="True">
                                                        </cc1:CalendarExtender>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ui_txtSubmissionDate"
                                                            Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" SetFocusOnError="True"
                                                            ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label8" runat="server" Text="File No."></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="ui_txtFileNo" runat="server" Width="220px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ui_txtFileNo"
                                                            Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" SetFocusOnError="True"
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
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ui_txtPrice"
                                                            Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" SetFocusOnError="True"
                                                            ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label10" runat="server" Text="Select File"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="ui_fileUpload" runat="server" Font-Size="15px" />
                                                        <asp:HyperLink ID="ui_hyprlnkUploadedFile" runat="server" Text="View File ..." Visible="False"></asp:HyperLink>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ui_txtFileNo"
                                                            Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" SetFocusOnError="True"
                                                            ValidationGroup="SaveMainPriceData"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label11" runat="server" Text="Local Manufacture"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ui_drpManufactures" runat="server" Width="225px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr runat="server" id="LocalTR">
                                                    <td id="Td1" runat="server">
                                                        <asp:Label ID="Label12" runat="server" Text="Imported Manufacture"></asp:Label>
                                                    </td>
                                                    <td id="Td2" runat="server">
                                                        <asp:TextBox ID="ui_txtImportedManufacture" runat="server" Rows="3" TextMode="MultiLine"
                                                            Width="220px"></asp:TextBox>
                                                    </td>
                                                    <td id="Td3" runat="server">
                                                    </td>
                                                    <td id="Td4" runat="server">
                                                    </td>
                                                    <td id="Td5" runat="server">
                                                    </td>
                                                    <td id="Td6" runat="server">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr runat="server" visible="False" id="ImportedTR">
                                                    <td id="Td7" runat="server">
                                                        &nbsp;
                                                    </td>
                                                    <td id="Td8" runat="server">
                                                        &nbsp;
                                                    </td>
                                                    <td id="Td9" runat="server">
                                                    </td>
                                                    <td id="Td10" runat="server">
                                                    </td>
                                                    <td id="Td11" runat="server">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" style="text-align: left">
                                                        <asp:Label runat="server" ID="ui_lblResult"></asp:Label>
                                                    </td>
                                                    <td colspan="1" style="text-align: right">
                                                        <asp:Button runat="server" class="btn btn-default" Font-Bold="False" Font-Size="11pt"
                                                            ID="ui_btnSave" Text="Add Main Data" OnClick="ui_btnSave_Click" Font-Names="Calibri"
                                                            ValidationGroup="SaveMainPriceData" />
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:Button ID="ui_btn_Click" runat="server" class="btn btn-default" Font-Bold="False"
                                                            Font-Size="11pt" OnClick="ui_btn_Click_Click" Text="Cancel" Font-Names="Calibri" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        </asp:Panel>
                                    </div>
                                    <!---------------------------------  Generic Tab ---------------------------------- -->
                                    <div class="tab-pane" id="tab_1_2">
                                        <div style="display: block">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                 <asp:Panel runat="server" ID="pnl_Generic_Contenets">
                                                    <table >
                                                        <tr>
                                                            <td class="style14">
                                                                <asp:Label ID="Label13" runat="server" Text="Generic Name" ForeColor="Black" Font-Bold="True"></asp:Label>
                                                            </td>
                                                            <td class="style12">
                                                                <asp:Label ID="Label_Generic_Name" runat="server" ForeColor="Black"></asp:Label><asp:Label
                                                                    ID="Label_Generic_Name_ID" runat="server" ForeColor="Black" Visible="False"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="ui_LnB_GenericSearch" runat="server" Font-Bold="True" Font-Names="Courier New"
                                                                    Font-Underline="True" ForeColor="#003399" OnClick="ui_LnB_GenericSearch_Click"
                                                                    Font-Size="10pt">Add/Update Generic Name</asp:LinkButton>
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
                                                            </td>
                                                            <td>
                                                                <asp:LinkButton ID="ui_LnB_EquiGenericSearch" runat="server" Font-Bold="True" Font-Names="Courier New"
                                                                    Font-Underline="True" ForeColor="#003399" OnClick="ui_LnB_EquiGenericSearch_Click"
                                                                    Font-Size="10pt">Add/Update Equivalent Generic</asp:LinkButton>
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
                                                        Style="display: block" BorderColor="#006699" BorderStyle="Solid" BorderWidth="1px"
                                                        BackColor="WhiteSmoke">
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
                                                            <asp:BoundField DataField="Active" HeaderText="Generic Name" />
                                                            <asp:BoundField DataField="QUANTITY" HeaderText="Quantity" DataFormatString="{0:F}" />
                                                            <asp:BoundField DataField="UnitName" />
                                                            <asp:BoundField DataField="OverActiveQuantity" HeaderText="/Quantity" DataFormatString="{0:F}" />
                                                            <asp:BoundField DataField="OverActiveUnit" />
                                                            <asp:BoundField DataField="Equi_Active" HeaderText="Equivalent Generic" />
                                                            <asp:BoundField DataField="EQUI_QUANTITY" HeaderText="Equivalent Quantity" DataFormatString="{0:F}" />
                                                            <asp:BoundField DataField="Equi_Unit" />
                                                            <asp:BoundField DataField="OverEquiActiveQuantity" HeaderText="/Equivalent Quantity"
                                                                DataFormatString="{0:F}" />
                                                            <asp:BoundField DataField="OverEquiActiveUnit" />
                                                            <asp:BoundField DataField="GenericType" HeaderText="Type" />
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
                                                    <cc1:ModalPopupExtender ID="ui_modalPopup_Generic" runat="server" TargetControlID="ui_hdf_Generic"
                                                        PopupControlID="uiPanelEditGeneric" PopupDragHandleControlID="pnlDragGeneric"
                                                        Drag="True" BackgroundCssClass="ModalBackground" DynamicServicePath="" Enabled="True" />
                                                    <asp:HiddenField runat="server" ID="ui_hdf_Generic" />
                                                    </asp:Panel>  
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                    <!-- End Tab Generic ======================================= -->
                                    
                                    <!---------------  Tab Status  ------------------------->
                                    <div class="tab-pane" id="tab_1_3">
                                        <div class="span12">
            <!-- BEGIN PROGRESS BARS PORTLET-->
           <div class="widget">
								<div class="widget-title">
									<h4><i class="icon-bullhorn"></i>Full Status History</h4>
									<span class="tools">
									</span>							
								</div>
								<div class="widget-body">
                                    <asp:Repeater runat="server" ID="rptrStatusList" OnItemDataBound="rptrStatusList_ItemDataBound">
                                    <ItemTemplate>
                                     <div class="alert alert-block alert-success fade in">
										<h4 class="alert-heading"><asp:Literal runat="server" ID="Literal2" Text='<%# Eval("Status") %>'></asp:Literal></h4>
                                        <p>
                                         <asp:Literal runat="server" ID="Literal4" Text='<%# Eval("StatusDate", "{0:dd-MM-yyyy}") %>'></asp:Literal>
                                        </p>
										<p>
											 <asp:Label runat="server" ID="lblStatusDetailsText"></asp:Label>
										</p>
                                        <div style="text-align:right">
                                        <asp:HyperLink runat="server" ID="lnkViewAttachementFile" Text="ViewAttachedFile"></asp:HyperLink>
                                        </div>
									</div>

                                   
                                    </ItemTemplate>
                                   
                                    </asp:Repeater>
								</div>
							</div>
            <!-- END PROGRESS BARS PORTLET-->
        </div>
                                        </div>
                                      <!-- End Tab Status ======================================= -->
                                </div>
                            </div>
                            <!--END TABS-->
                        </div>
                        <div class="space10 visible-phone">
                        </div>
                    </div>
                </div>
            </div>
            <!-- END INLINE TABS PORTLET-->
        </div>
    </div>
</asp:Content>
