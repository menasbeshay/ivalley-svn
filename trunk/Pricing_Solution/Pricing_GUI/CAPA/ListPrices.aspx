<%@ Page Title="" Language="C#" MasterPageFile="~/CAPA/Site.Master" AutoEventWireup="true" CodeBehind="ListPrices.aspx.cs" Inherits="WebGUI.ListPrices"   EnableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
    /* technique 1 */
tbody tr:nth-child(odd){ background-color:#ccc; }
/* technique 2 */
TBODY TR.odd { background-color:#78a5d1; }
        .style3
        {
            width: 141px;
            text-align: left;
        }
        .style4
        {
            width: 38px;
            height: 35px;
        }
    </style>

   
<asp:UpdatePanel runat="server" ID="ui_updatePanel" >
<ContentTemplate>
 
 <script type="text/javascript">
     $(document).ready(function () {
         $(".DateTimeSelector").dynDateTime({
             showsTime: true,
             ifFormat: "%Y/%m/%d %H:%M",
             daFormat: "%l;%M %p, %e %m,  %Y",
             align: "BR",
             electric: false,
             singleClick: false,
             displayArea: ".siblings('.dtcDisplayArea')",
             button: ".next()"
         });
     });
</script>

     <p style="text-align:left">
            <asp:Label runat="server" ID="lblPageTitle" Text="Search Pricing Cases" Font-Names="Sakkal Majalla"
                Font-Size="XX-Large" ForeColor="#003366" Font-Underline="True" Font-Bold="True"></asp:Label></p>
   
    <table style="width: 80%;">
        <tbody>
        <tr>
            <td style="width: 16%; height: 24px;">
                <asp:Label ID="Label4" runat="server" Text="Submission From Date"></asp:Label>
            </td>
            <td style="width: 19%; height: 24px;">
               <asp:TextBox runat="server" Width="220px" CssClass="dateSelect" ID="ui_txtSubmissionFromDate" ></asp:TextBox>
                <cc1:CalendarExtender ID="uiClaenderExtender" runat="server" TargetControlID="ui_txtSubmissionFromDate" ></cc1:CalendarExtender>

            </td>
            <td style="width: 9%; height: 24px;"></td>
            <td style="width: 15%; height: 24px;">
                <asp:Label ID="Label3" runat="server" Text="Generic Name 1 :"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="ui_txtGeneric1" Width="220px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 16%; height: 24px;">
                <asp:Label ID="Label12" runat="server" Text="Submission To Date"></asp:Label></td>
            <td style="width: 19%; height: 24px;">
               <asp:TextBox runat="server" Width="220px" CssClass="dateSelect" ID="ui_txtSubmissionToDate" ></asp:TextBox>
               <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="ui_txtSubmissionToDate" ></cc1:CalendarExtender>

                    </td>
            <td style="width: 9%; height: 24px;">&nbsp;</td>
            <td style="width: 15%; height: 24px;">
                <asp:Label ID="Label11" runat="server" Text="Generic Name 2 :"></asp:Label></td>
            <td>
               <asp:TextBox runat="server" ID="ui_txtGeneric2" Width="220px" ></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Trade Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ui_txtTradeName" runat="server" Width="220px"></asp:TextBox>
            </td>
            <td></td>
            <td>
               <asp:Label ID="Label27" runat="server" Text="Generic Name 3 :"></asp:Label> 
            </td>
            <td>
                <asp:TextBox runat="server" ID="ui_txtGeneric3" Width="220px" ></asp:TextBox>
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
            <td></td>
            <td>
                <asp:Label ID="Label28" runat="server" Text="Generic Name 4 :"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="ui_txtGeneric4" Width="220px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Committe Type"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ui_drpCommitteType" runat="server" Width="225px">
                </asp:DropDownList></td>
            <td></td>
            <td>
                <asp:Label ID="Label29" runat="server" Text="Generic Name 5 :"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="ui_txtGeneric5" Width="220px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
               <asp:Label ID="Label8" runat="server" Text="File No."></asp:Label></td>
            <td>
              <asp:TextBox ID="ui_txtFileNo" runat="server" Width="220px"></asp:TextBox> 
            </td>
            <td></td>
            <td>
                &nbsp;</td>
            <td>
                </td>
        </tr>
             <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="FileType"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ui_drpFileType" runat="server" Width="225px">
                </asp:DropDownList></td>
            <td></td>
            <td>
             
            </td>
            <td>
              
                &nbsp;</td>
        </tr>
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Status"></asp:Label></td>
                <td>
                   <asp:DropDownList ID="ui_drpStatus" AutoPostBack="true" OnSelectedIndexChanged="ui_drpStatus_SelectedIndexChanged" runat="server" Width="225px">
                </asp:DropDownList></td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:left">
                    <asp:Label ID="lblMailResult" runat="server"></asp:Label>
                </td>
                <td colspan="1" style="text-align:right">
                    <asp:Button runat="server" class="btn btn-default" Font-Bold="true" Font-Size="20px" ID="ui_btnSearch" Text="Search ..." OnClick="ui_btnSearch_Click" />
                   

                </td>

            </tr>
            </tbody>
    </table>
    
    <table width=100%>
        <tr>
            <td align="left" style="width:32%">
                <asp:Panel runat="server" Visible="true" ID="pnlDate">
                    <asp:Label ID="ui_lblPickDate" Text="Specify Committee date and Time" runat="server"></asp:Label>
                    <br />
                    <asp:Label ID="ui_lblDateSelectLabel" runat="server" Text="Date"></asp:Label>
                      <asp:TextBox runat="server" ID="ui_DatePickerForCommittee" ></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender2" TargetControlID="ui_DatePickerForCommittee" runat="server">
                    </cc1:CalendarExtender>
                    <asp:Label ID="Label5" runat="server" Text="H:M"></asp:Label>
                    <asp:TextBox runat="server" MaxLength="2" ID="ui_txtTimeHours" Width="20px" ></asp:TextBox>
                    :
                    <asp:TextBox runat="server" MaxLength="2" ID="ui_txtTimeMinutes" Width="20px" ></asp:TextBox>
                    &nbsp;&nbsp;
                    <asp:DropDownList runat="server" ID="ui_drpTimeZone" >
                    <asp:ListItem Text="AM" ></asp:ListItem>
                    <asp:ListItem Text="PM" ></asp:ListItem>
                    </asp:DropDownList>
                 
                </asp:Panel>
                <asp:Panel runat="server" Visible="false" ID="pnlPrice">
                    <asp:Label ID="Label7" Text="Specify Price" runat="server"></asp:Label>
                    <asp:TextBox runat="server" ID="ui_txtPriceToSend"></asp:TextBox>
                </asp:Panel>
            </td>
            <td align="left">
                <asp:Button runat="server" ID="ui_btnShowSendMail" Text="Send Mail" OnClick="ui_btnShowSendMail_Click" />
            </td>
            <td>
        <asp:UpdateProgress AssociatedUpdatePanelID="ui_updatePanel" runat="server" ID="ui_progressBar"
                                                      DisplayAfter="1">
                                                      <ProgressTemplate>
                                                          <input type="image" src="../Images/loading.gif" />
                                                      </ProgressTemplate>
                                                  </asp:UpdateProgress>
            </td>
            <td align="right">
                <div>
                    <table>
                        <tr>
                            <td>
                                <img alt="" class="style4" src="../Images/Excel-icon.png" />
                            </td>
                            <td>
                                &nbsp;&nbsp;
                                <asp:LinkButton ID="ui_LB_Excel" runat="server" OnClick="ui_LB_Excel_Click">Export to Excel here</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
   
      
             
    <asp:GridView runat="server" ID="ui_gvSearchResults" EmptyDataText="Sorry, No results found ..."
                                                    AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                                                    BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" OnPageIndexChanging="ui_gvSearchResults_PageIndexChanging">
                                                    <Columns>
                                                            <asp:TemplateField HeaderText="Choose">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chRow1" runat="server" __designer:wfdid="w10" ToolTip='<%# Eval("TradePricingID") %>'></asp:CheckBox>
                                                                <asp:HiddenField ID="ui_hdf_ManufactureID1" runat="server" Value='<%# Eval("TradePricingID") %>' />

                                                                <asp:HiddenField ID="ui_HF_Mail1" runat="server" Value='<%# Eval("Mail1") %>' />
                                                                <asp:HiddenField ID="ui_HF_Mail2" runat="server" Value='<%# Eval("Mail2") %>' />
                                                                <asp:HiddenField ID="ui_HF_Mail3" runat="server" Value='<%# Eval("Mail3") %>' />

                                                                <asp:HiddenField ID="ui_HF_CompName" runat="server" Value='<%# Eval("CompNameEng") %>' />
                                                                <asp:HiddenField ID="ui_HF_TradeName" runat="server" Value='<%# Eval("TradeName") %>' />
                                                                <asp:HiddenField ID="ui_HF_DosageForm" runat="server" Value='<%# Eval("Dosage_form") %>' />

                                                                <asp:HiddenField ID="ui_HF_PricingStatus" runat="server" Value='<%# Eval("PricingStatusID") %>' />
                                                               </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>

                                                          <asp:BoundField HeaderText="Submission Date" DataField="SubmissionDate" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Trade Name" DataField="TradeName" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Dosage Form" DataField="Dosage_form" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Company Name" DataField="CompNameEng" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                       
                                                        <asp:BoundField HeaderText="Suggested Price" DataField="CompanyPrice" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="ui_LB_Details" runat="server" 
                                                                    CommandArgument='<%# Eval("TradePricingID") %>' onclick="ui_LB_Details_Click">View</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                                                    NavigateUrl='<%# "TradeSearch.aspx?id=" + Eval("TradePricingID") %>'>Edit</asp:HyperLink>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        
                                                    </Columns>
                                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="Black" />
                                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                    <RowStyle ForeColor="#000066" />
                                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="Black" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                                                </asp:GridView>


                               <asp:Panel runat="server" ID="uiPanelEdit1" CssClass="ModalPanel Shadow RoundedCorners"
                               BackColor="White" Style="display: block"
                                Width="50%">
                                <asp:Panel ID="pnlDrag1" runat="server" CssClass="ModalDragHandle" ondrop="onDrop()"
                                    BorderColor="#99CCFF" Height="20px">
                                    <table align="center">
                                        <asp:Label ID="uilblTitle1" runat="server">Details</asp:Label></table>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="ui_PanelManufacture" CssClass="ModalPanel Shadow RoundedCorners"
                                    BackColor="White">
                                    <table class="ModalTable" width="100%">
                                        <tr>
                                            <td style="direction: ltr">
                                                <div style="width: 100%; text-align: center;">
                                                <table cellspacing="0" width="100%">
                                                    <tr>
                                                        <td  align="center">
                                                            <table cellpadding="0" cellspacing="0" width="60%">
                                                                <tr>
                                                                    <td class="style3">
                                                                        <asp:Label ID="Label14" runat="server" Text="Submission Date:" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="ui_lb_SubmissionDate" runat="server" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style3">
                                                                        <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Black" 
                                                                            Text="Trade Name:"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="ui_lb_TradeName" runat="server" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style3">
                                                                        <asp:Label ID="Label21" runat="server" Font-Bold="True" ForeColor="Black" 
                                                                            Text="Dosage Form:"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="ui_lb_DosageForm" runat="server" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style3">
                                                                        <asp:Label ID="Label22" runat="server" Font-Bold="True" ForeColor="Black" 
                                                                            Text="Company Name:"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="ui_lb_CompName" runat="server" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style3">
                                                                        <asp:Label ID="Label13" runat="server" Font-Bold="True" ForeColor="Black" 
                                                                            Text="Company Price:"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="ui_lb_CompPrice" runat="server" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style3">
                                                                        <asp:Label ID="Label15" runat="server" Text="Pack:" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="ui_lb_Pack" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style3">
                                                                        <asp:Label ID="Label16" runat="server" Text="File No:" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="ui_lb_FileNo" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style3">
                                                                        <asp:Label ID="Label17" runat="server" Text="Generic Strength:" 
                                                                            Font-Bold="True" ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="ui_lb_GenericStr" runat="server" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style3">
                                                                        <asp:Label ID="Label18" runat="server" Text="Download File" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <asp:HyperLink ID="ui_HL_File" runat="server" Font-Bold="True" 
                                                                            ForeColor="Black">[ui_HL_File]</asp:HyperLink>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style3">
                                                                        <asp:Label ID="Label19" runat="server" Text="Generic:" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="ui_lb_Generic" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style3">
                                                                        <asp:Label ID="Label23" runat="server" Font-Bold="True" ForeColor="Black" 
                                                                            Text="Status:"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="ui_lb_Status" runat="server" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style3">
                                                                        <asp:Label ID="Label24" runat="server" Font-Bold="True" ForeColor="Black" 
                                                                            Text="Committee Type:"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="ui_lb_CommType" runat="server" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style3">
                                                                        <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="Black" 
                                                                            Text="File Type:"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="ui_lb_FileType" runat="server" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="style3">
                                                                        <asp:Label ID="Label26" runat="server" Font-Bold="True" ForeColor="Black" 
                                                                            Text="Manufacture Name:"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left">
                                                                        <asp:Label ID="ui_lb_ManufactureName" runat="server" Font-Bold="True" 
                                                                            ForeColor="Black"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            &#160;&#160;
                                                            <asp:Button ID="ui_btn_Cancel" runat="server" BorderColor="#006699" BorderStyle="Groove"
                                                                BorderWidth="3px" Font-Bold="True" Font-Names="Tahoma" ForeColor="#000066" OnClick="ui_btn_Cancel_Click"
                                                                Text="Cancel" Width="80px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                </div>
                                                
                                            </td>
                                        </tr>
                                    </table>
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

                            <asp:Panel runat="server" ID="Panel1" CssClass="ModalPanel Shadow RoundedCorners"
                               BackColor="White" Style="display: none"
                                Width="50%">
                                    <asp:GridView runat="server" ID="ui_gv_Export" EmptyDataText="Sorry, No results found ..."
                                                    AllowPaging="False" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC"
                                                    BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%">
                                                    <Columns>                                                           
                                                          <asp:BoundField HeaderText="Submission Date" DataField="SubmissionDate" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Trade Name" DataField="TradeName" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Dosage Form" DataField="Dosage_form" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Company Name" DataField="CompNameEng" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                       
                                                        <asp:BoundField HeaderText="Suggested Price" DataField="CompanyPrice" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Pack" DataField="Pack" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="File No" DataField="FileNo" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Generic Strength" DataField="GenericStrength" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Generic" DataField="Generic" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Status" DataField="Status" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Committee Type" DataField="CommitteType" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="File Type" DataField="FileType" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>

                                                        <asp:BoundField HeaderText="Manufacture Name" DataField="ManufactureName" NullDisplayText="-">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        
                                                    </Columns>
                                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="Black" />
                                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                    <RowStyle ForeColor="#000066" />
                                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="Black" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                                                </asp:GridView>
                                </asp:Panel>

<!-- ----------------------------------------------------------------------------------------------------------------------------- -->
                                 

</ContentTemplate>
</asp:UpdatePanel>

</asp:Content>
