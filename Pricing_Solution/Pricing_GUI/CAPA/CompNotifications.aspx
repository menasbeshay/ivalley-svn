<%@ Page Title="" Language="C#" MasterPageFile="~/CAPA/Site.Master" AutoEventWireup="true"
    CodeBehind="CompNotifications.aspx.cs" Inherits="PricingGUI.CompNotifications" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        /* technique 1 */
        tbody tr:nth-child(odd)
        {
            
        }
        /* technique 2 */
        TBODY TR.odd
        {
            
        }
        .style3
        {
            width: 234px;
        }
        .style4
        {
            height: 24px;
            width: 29%;
        }
        .style5
        {
            width: 29%;
        }
    </style>
    <asp:UpdatePanel ID="ui_UpdtPanel" runat="server">
        <ContentTemplate>
            <p style="text-align: left">
                <asp:Label runat="server" ID="lblPageTitle" Text="Notifications :" Font-Names="Sakkal Majalla"
                    Font-Size="XX-Large" ForeColor="#003366" Font-Underline="True" Font-Bold="True"></asp:Label></p>
            <table width="100%">
                <tr>
                    <td style="text-align: right">
                        <asp:LinkButton ID="ui_lbtn_AddNotification" runat="server" 
                            onclick="ui_lbtn_AddNotification_Click" Font-Bold="True" 
                            Font-Italic="True" Font-Size="15pt" Font-Names="Andalus" 
                            ForeColor="#CC3300">Publish New Notification</asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                <td style="direction: ltr">
                    <asp:Label ID="ui_lb_msg" runat="server" Font-Bold="True" Font-Underline="True"></asp:Label>
                </td>
                </tr>
            </table>
            
            <table width="40%">
                <tr>
                    <td class="style3">
                        <strong>Show Notifications by Company: </strong>
                    </td>
                    <td>
                        <asp:DropDownList ID="ui_ddl_SearchCompany" runat="server" Width="225px" 
                            AutoPostBack="True" 
                            onselectedindexchanged="ui_ddl_SearchCompany_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                    </td>
                    <td style="text-align: right">
                        &nbsp;</td>
                    <td>
                    </td>
                </tr>
            </table>
            <table width="100%">
                <tr>
                    <td>
                        <asp:GridView ID="ui_GvData" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                            CellPadding="3" OnPageIndexChanging="ui_GvData_PageIndexChanging" PageSize="15"
                            Width="100%" OnRowDataBound="ui_GvData_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="Subject" HeaderText="Subject" />
                                <asp:BoundField DataField="NotificationText" HeaderText="Notification" />
                                <asp:BoundField DataField="NotifyDate" HeaderText="Date" DataFormatString="{0:d}" />
                                <asp:BoundField DataField="CompNameEng" HeaderText="CompanyName" />
                                <asp:TemplateField HeaderText="File Attached">
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="ui_hdnFilePath" Value='<%# Eval("FilePath") %>' />
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Attachments/Notifications/" + Eval("NotificationID") + "_" + Eval("FilePath") %>' Target="_blank">View</asp:HyperLink>
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
                    </td>
                </tr>
            </table>

             <asp:Panel runat="server" ID="uiPanelEdit1"
                               BackColor="White" Style="display: block"
                                Width="50%">
                                <asp:Panel ID="pnlDrag1" runat="server" ondrop="onDrop()"
                                    BorderColor="#006699" Height="20px" BorderStyle="Solid" BorderWidth="3px" 
                                    BackColor="#006699" style="text-align: center">
                                    <table align="center">
                                        <asp:Label ID="uilblTitle1" runat="server" ForeColor="White" Width="175px">Publish New Notification</asp:Label></table>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="ui_PanelNotification" CssClass="ModalPanel Shadow RoundedCorners"
                                    BackColor="#CCCCCC" BorderColor="#006699" BorderStyle="Solid" 
                                    BorderWidth="3px">
                                    <center>
                                    <table style="width: 40%;">
                <tbody>
                    <tr>
                        <td style="height: 24px; text-align: center;" colspan="3">
                            
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;" class="style4">
                            <asp:Label ID="Label1" runat="server" Text="Companies:" Width="110px" 
                                Font-Bold="True" ForeColor="#000066"></asp:Label>
                        </td>
                        <td style="width: 19%; height: 24px;">
                            <asp:DropDownList ID="ui_drpCompanies" runat="server" Width="225px">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 9%; height: 24px;">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;" class="style4">
                            <asp:Label ID="Label2" runat="server" Text="Subject:" Width="110px" 
                                Font-Bold="True" ForeColor="#000066"></asp:Label>
                        </td>
                        <td style="width: 19%; height: 24px;">
                            <asp:TextBox ID="ui_txtSubject" runat="server" Width="220px"></asp:TextBox>
                        </td>
                        <td style="width: 9%; height: 24px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ui_txtSubject"
                                Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red"
                                SetFocusOnError="True" ValidationGroup="AddNotify"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;" valign="top" class="style4">
                            <asp:Label ID="Label3" runat="server" Text="Notification:" Width="110px" 
                                Font-Bold="True" ForeColor="#000066"></asp:Label>
                        </td>
                        <td style="width: 19%; height: 24px;">
                            <asp:TextBox ID="ui_txtNotification" runat="server" Width="220px" Height="139px"
                                TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td style="width: 9%; height: 24px;" valign="top">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ui_txtNotification"
                                Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red"
                                SetFocusOnError="True" ValidationGroup="AddNotify"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;" class="style4">
                            <asp:Label ID="Label4" runat="server" Text="Date:" Width="110px" 
                                Font-Bold="True" ForeColor="#000066"></asp:Label>
                        </td>
                        <td style="width: 19%; height: 24px;">
                            <asp:TextBox runat="server" Width="220px" CssClass="dateSelect" ID="ui_txtDate"></asp:TextBox>
                            <cc1:CalendarExtender runat="server" TargetControlID="ui_txtDate" ID="ui_calExntener"
                                Enabled="True">
                            </cc1:CalendarExtender>
                        </td>
                        <td style="width: 9%; height: 24px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ui_txtDate"
                                Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red"
                                SetFocusOnError="True" ValidationGroup="AddNotify"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;" class="style4">
                            <asp:Label ID="Label5" runat="server" Text="File:" Width="110px" 
                                Font-Bold="True" ForeColor="#000066"></asp:Label>
                        </td>
                        <td style="width: 19%; height: 24px; direction: rtl;">
                            <asp:FileUpload ID="ui_fileUpload" runat="server" Font-Size="13px" 
                               />
                            <br />
                            <asp:HyperLink ID="ui_hyprlnkUploadedFile" runat="server" Text="View File ..." Visible="False"></asp:HyperLink>
                        </td>
                        <td style="width: 9%; height: 24px;">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style4" style="text-align: left;">
                            &nbsp;</td>
                        <td style="width: 19%; height: 24px; direction: rtl;">
                            &nbsp;</td>
                        <td style="width: 9%; height: 24px;">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;
                        </td>
                        <td style="text-align: right">
                            <asp:Button ID="ui_btnSave" runat="server" class="btn btn-default" Font-Bold="true"
                                Font-Size="13px" OnClick="ui_btnSave_Click" Text="Add New" ValidationGroup="AddNotify" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="ui_btn_Cancel" runat="server" class="btn btn-default" Font-Bold="true"
                                Font-Size="13px" Text="Cancel" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </tbody>
            </table>
                                    </center>
                                </asp:Panel>
                            </asp:Panel>
                            <cc1:ModalPopupExtender runat="server" ID="uiPopupExtenderEdit1" PopupControlID="uiPanelEdit1"
                                Enabled="True" DynamicServicePath="" TargetControlID="uiHiddenFieldPopUpShow1"
                                PopupDragHandleControlID="pnlDrag1" BackgroundCssClass="ModalBackground">
                            </cc1:ModalPopupExtender>
                            <asp:HiddenField runat="server" ID="uiHiddenFieldPopUpShow1" />
                            <asp:HiddenField ID="hfShow1" runat="server" />
                            <asp:HiddenField ID="hfX1" runat="server" />
                            <asp:HiddenField ID="hfY1" runat="server" />
                            <script type="text/javascript">

                                function pageLoad() {

                                    var mpe = $find("<%= uiPopupExtenderEdit1.ClientID %>");

                                    if ($get("<%= hfX1.ClientID %>").value != "") mpe.set_X(parseInt($get("<%= hfX1.ClientID %>").value));
                                    if ($get("<%= hfY1.ClientID %>").value != "") mpe.set_Y(parseInt($get("<%= hfY1.ClientID %>").value));

                                }
                                function onDrop() {

                                    var pop = $get("<%= uiPanelEdit1.ClientID %>");
                                    $get("<%= hfX1.ClientID %>").value = pop.offsetLeft;
                                    $get("<%= hfY1.ClientID %>").value = pop.offsetTop;
                                }

                            </script>
           
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ui_btnSave" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
