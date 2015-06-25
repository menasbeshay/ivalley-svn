<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"
    CodeFile="RegisterDeathHealthInfo.aspx.cs" Inherits="RegisterDeathHealthInfo"
     %>

<%@ Register Src="~/UserControls/UcItemControl.ascx" TagName="UcItemControl" TagPrefix="uc7" %>
<%@ Register Src="~/UserControls/UcSubItemControl.ascx" TagName="UcItemControl" TagPrefix="uc8" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ MasterType VirtualPath="~/MasterPages/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>

<script type='text/javascript'>
    $(document).ready(function () {
      <%--  $('#<%= rdDeathThroughCarry.ClientID %> input[type=radio][value="2"]').attr('checked', true);
        $('#<%= rdDeadThroughBirth.ClientID %> input[type=radio][value=2]').attr('checked', true);
        $('#<%= rdBirthPast6Weeks.ClientID %> input[type=radio][value="2"]').attr('checked', true);
        $('#<%= rdAbortionPast6Weeks.ClientID %> input[type=radio][value="2"]').attr('checked', true);

        $("#<%= dropBirthOuput.ClientID %>").val('0');
        $("#<%= dropBirthOuput.ClientID %>").attr("disabled", "disabled");
        $("#<%= txtBirthLocation.ClientID %>").val('0');
        $("#<%= txtBirthLocation.ClientID %>").attr("disabled", "disabled");
        $("#<%= txtBirthOperator.ClientID %>").val('0');
        $("#<%= txtBirthOperator.ClientID %>").attr("disabled", "disabled");
        $("#<%= uiTextBoxAbortionPlace.ClientID %>").val('0');
        $("#<%= uiTextBoxAbortionPlace.ClientID %>").attr("disabled", "disabled");

        $("#<%= txtDate.ClientID %>").attr("disabled", "disabled");
        $("#<%= uiTextBoxAbortionDate.ClientID %>").attr("disabled", "disabled");--%>

    });
    
    function SetWidthToAuto(drpLst) {
        drpLst.style.width = 'auto';
    }
    
    function ResetWidth(drpLst) {
        drpLst.style.width = '310px';
    }

    $(document).ready(function () {
        $(".RDL").change(function () { ValidateRB(this); });
    });  

    function ValidateRB(RBL) {
        switch (RBL.id) {
            case '<%= rdDeathThroughCarry.ClientID %>':
                var selected = $('#<%= rdDeathThroughCarry.ClientID %> input[type=radio]:checked').val();
                if (selected == 1) {
                    $('#<%= rdDeadThroughBirth.ClientID %> input[type=radio][value=2]').attr('checked', true);
                    $('#<%= rdBirthPast6Weeks.ClientID %> input[type=radio][value="2"]').attr('checked', true);
                    $('#<%= rdAbortionPast6Weeks.ClientID %> input[type=radio][value="2"]').attr('checked', true);

                    $("#<%= dropBirthOuput.ClientID %>").val('0');
                    $("#<%= dropBirthOuput.ClientID %>").attr("disabled", "disabled");
                    $("#<%= txtBirthLocation.ClientID %>").val('0');
                    $("#<%= txtBirthLocation.ClientID %>").attr("disabled", "disabled");
                    $("#<%= txtBirthOperator.ClientID %>").val('0');
                    $("#<%= txtBirthOperator.ClientID %>").attr("disabled", "disabled");
                    $("#<%= uiTextBoxAbortionPlace.ClientID %>").val('0');
                    $("#<%= uiTextBoxAbortionPlace.ClientID %>").attr("disabled", "disabled");

                    $("#<%= txtDate.ClientID %>").attr("disabled", "disabled");
                    $("#<%= txtDate.ClientID %>").val("");
                    $("#<%= uiTextBoxAbortionDate.ClientID %>").attr("disabled", "disabled");
                    $("#<%= uiTextBoxAbortionDate.ClientID %>").val("");
                }
                break;
            case '<%= rdDeadThroughBirth.ClientID %>':
                var selected = $('#<%= rdDeadThroughBirth.ClientID %> input[type=radio]:checked').val();
                if (selected == 1) {
                    $('#<%= rdDeathThroughCarry.ClientID %> input[type=radio][value=2]').attr('checked', true);
                    $('#<%= rdBirthPast6Weeks.ClientID %> input[type=radio][value="2"]').attr('checked', true);
                    $('#<%= rdAbortionPast6Weeks.ClientID %> input[type=radio][value="2"]').attr('checked', true);

                    $("#<%= dropBirthOuput.ClientID %>").val('0');
                    $("#<%= dropBirthOuput.ClientID %>").attr("disabled", "");
                    $("#<%= txtBirthLocation.ClientID %>").val('0');
                    $("#<%= txtBirthLocation.ClientID %>").attr("disabled", "");
                    $("#<%= txtBirthOperator.ClientID %>").val('0');
                    $("#<%= txtBirthOperator.ClientID %>").attr("disabled", "");
                    $("#<%= uiTextBoxAbortionPlace.ClientID %>").val('0');
                    $("#<%= uiTextBoxAbortionPlace.ClientID %>").attr("disabled", "disabled");

                    $("#<%= txtDate.ClientID %>").attr("disabled", "");
                    $("#<%= uiTextBoxAbortionDate.ClientID %>").attr("disabled", "disabled");
                    $("#<%= uiTextBoxAbortionDate.ClientID %>").val("");
                }
                else {
                    $("#<%= dropBirthOuput.ClientID %>").val('0');
                    $("#<%= dropBirthOuput.ClientID %>").attr("disabled", "disabled");
                    $("#<%= txtBirthLocation.ClientID %>").val('0');
                    $("#<%= txtBirthLocation.ClientID %>").attr("disabled", "disabled");
                    $("#<%= txtBirthOperator.ClientID %>").val('0');
                    $("#<%= txtBirthOperator.ClientID %>").attr("disabled", "disabled");
                    $("#<%= txtDate.ClientID %>").attr("disabled", "disabled");
                    $("#<%= txtDate.ClientID %>").val("");
                }
                break;
            case '<%= rdBirthPast6Weeks.ClientID %>':
                var selected = $('#<%= rdBirthPast6Weeks.ClientID %> input[type=radio]:checked').val();
                if (selected == 1) {
                    $('#<%= rdDeadThroughBirth.ClientID %> input[type=radio][value=2]').attr('checked', true);
                    $('#<%= rdDeathThroughCarry.ClientID %> input[type=radio][value="2"]').attr('checked', true);
                    $('#<%= rdAbortionPast6Weeks.ClientID %> input[type=radio][value="2"]').attr('checked', true);

                    $("#<%= dropBirthOuput.ClientID %>").val('0');
                    $("#<%= dropBirthOuput.ClientID %>").attr("disabled", "");
                    $("#<%= txtBirthLocation.ClientID %>").val('0');
                    $("#<%= txtBirthLocation.ClientID %>").attr("disabled", "");
                    $("#<%= txtBirthOperator.ClientID %>").val('0');
                    $("#<%= txtBirthOperator.ClientID %>").attr("disabled", "");
                    $("#<%= uiTextBoxAbortionPlace.ClientID %>").val('0');
                    $("#<%= uiTextBoxAbortionPlace.ClientID %>").attr("disabled", "disabled");

                    $("#<%= txtDate.ClientID %>").attr("disabled", "");
                    $("#<%= uiTextBoxAbortionDate.ClientID %>").attr("disabled", "disabled");
                    $("#<%= uiTextBoxAbortionDate.ClientID %>").val("");
                }
                else {
                    $("#<%= dropBirthOuput.ClientID %>").val('0');
                    $("#<%= dropBirthOuput.ClientID %>").attr("disabled", "disabled");
                    $("#<%= txtBirthLocation.ClientID %>").val('0');
                    $("#<%= txtBirthLocation.ClientID %>").attr("disabled", "disabled");
                    $("#<%= txtBirthOperator.ClientID %>").val('0');
                    $("#<%= txtBirthOperator.ClientID %>").attr("disabled", "disabled");
                    $("#<%= txtDate.ClientID %>").attr("disabled", "disabled");
                    $("#<%= txtDate.ClientID %>").val("");
                }
                break;
            case '<%= rdAbortionPast6Weeks.ClientID %>':
                var selected = $('#<%= rdAbortionPast6Weeks.ClientID %> input[type=radio]:checked').val();
                if (selected == 1) {
                    $('#<%= rdDeadThroughBirth.ClientID %> input[type=radio][value=2]').attr('checked', true);
                    $('#<%= rdBirthPast6Weeks.ClientID %> input[type=radio][value="2"]').attr('checked', true);
                    $('#<%= rdDeathThroughCarry.ClientID %> input[type=radio][value="2"]').attr('checked', true);

                    $("#<%= dropBirthOuput.ClientID %>").val('0');
                    $("#<%= dropBirthOuput.ClientID %>").attr("disabled", "disabled");
                    $("#<%= txtBirthLocation.ClientID %>").val('0');
                    $("#<%= txtBirthLocation.ClientID %>").attr("disabled", "disabled");
                    $("#<%= txtBirthOperator.ClientID %>").val('0');
                    $("#<%= txtBirthOperator.ClientID %>").attr("disabled", "disabled");
                    $("#<%= uiTextBoxAbortionPlace.ClientID %>").val('0');
                    $("#<%= uiTextBoxAbortionPlace.ClientID %>").attr("disabled", "");

                    $("#<%= txtDate.ClientID %>").attr("disabled", "disabled");
                    $("#<%= txtDate.ClientID %>").val("");
                    $("#<%= uiTextBoxAbortionDate.ClientID %>").attr("disabled", "");
                }
                else {
                    $("#<%= uiTextBoxAbortionPlace.ClientID %>").val('0');
                    $("#<%= uiTextBoxAbortionPlace.ClientID %>").attr("disabled", "disabled");
                    $("#<%= uiTextBoxAbortionDate.ClientID %>").attr("disabled", "disabled");
                    $("#<%= uiTextBoxAbortionDate.ClientID %>").val("");
                }
                break;
            default:
                break;

        }
    }

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <div id="DeathHealthContents" runat="server">
        <asp:CheckBox ID="uiCheckBoxUnderInvestigation" runat="server" Text="«·Ê«ﬁ⁄… ﬁÌœ «· ÕﬁÌﬁ" />
            <ajaxToolkit:TabContainer ID="TabContainerDeathInfo" ActiveTabIndex="0" runat="server"
                meta:resourcekey="TabContainerDeathInfoResource1">
                <ajaxToolkit:TabPanel runat="server" TabIndex="0" ID="TabPanelDeathHealthData" meta:resourcekey="TabPanelDeathHealthData">
                    <ContentTemplate>
                        <table dir="rtl">
                            <tr>
                                <td width="10%" rowspan="5" style="vertical-align: top; padding-top: 40px;">
                                <div style="border-left-style: solid; border-left-width: 2px; border-left-color: #000000;min-height:400px;padding:5px;">
                                     <asp:Label ID="Label21" runat="server" 
                                Text=" ‰»ÌÂ Â«„ :<br /> ”Ã· «·«„—«÷ Ê«·«’«»«  Ê«·„÷«⁄›«  «· Ì  ”»» «·Ê›«… Ê·«  ”Ã· Ê’› «·Ê›«… <br />(  Êﬁ› ﬁ·» ñ  Êﬁ› «· ‰›” ñ Â»Êÿ Õ«œ ›Ì «·œÊ—… «·œ„ÊÌ… Ê«· ‰›”Ì… )." 
                                Font-Bold="True" ></asp:Label>
                                </div>
                                    </td>
                                <td width="75%">
                                    <asp:Label ID="lblTitle" runat="server" Font-Bold="True" 
                                        meta:resourceKey="lblTitleResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblperiod" Font-Bold="True" runat="server" 
                                        meta:resourcekey="lblperiodResource1"></asp:Label>

                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <uc7:UcItemControl ID="ucItemControlDeathReasonA" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <uc8:UcItemControl ID="ucSubItemControlDeathReasonB" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <uc8:UcItemControl ID="ucSubItemControlDeathReasonC" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <uc8:UcItemControl ID="ucSubItemControlDeathReasonD" runat="server" />
                                </td>
                            </tr>
                            </table>
                            <asp:UpdatePanel runat="server" ID="updDeathCause" UpdateMode="Conditional" 
                            Visible="False"><ContentTemplate>
  
                            <table dir="rtl">
                            <tr>
                                <td >
                                    <table>
                                        <tr>
                                            <td style="padding-right: 3px;">
                                                <asp:Label ID="ucSickReasonsB" runat="server" Font-Underline="True" meta:resourcekey="ucSickReasonsBResource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td colspan="2">
                                                        <div dir="ltr" align="right">
                                                            <asp:DropDownList ID="dropICDCat" runat="server" Width="310px" 
                                                                meta:resourcekey="dropSickReasonsB1Resource1" AutoPostBack="True" 
                                                                onselectedindexchanged="dropICDCat_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        <div dir="ltr" align="right">
                                                            <asp:DropDownList ID="dropICDItem" runat="server" Width="310px" 
                                                                meta:resourcekey="dropSickReasonsB2Resource1" AutoPostBack="True" 
                                                                onselectedindexchanged="dropICDItem_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            </div>
                                                            
                                                        </td>
                                                        <td>
                                                        <asp:Label runat="server" ID="lblSelectedItem" Font-Bold="True"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                 <asp:UpdateProgress ID="UpdateProgress1" DisplayAfter="1" AssociatedUpdatePanelID="updDeathCause" runat="server">
                                    <ProgressTemplate>
                                        <asp:Image runat="server" ID="imgLoading" ImageUrl="~/Images/loading.gif" />
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table>
                                        <tr>
                                            <td style="padding-right: 3px;">
                                                <asp:Label ID="ucSickReasonsC" runat="server" Font-Underline="True" meta:resourcekey="ucSickReasonsCResource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td>
                                                        <div dir="ltr" align="right">
                                                            <asp:DropDownList ID="dropICDcode" runat="server" Width="310px" 
                                                                meta:resourcekey="dropSickReasonsCResource1" AutoPostBack="True" 
                                                                onselectedindexchanged="dropICDcode_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                        <asp:Label runat="server" ID="lblSelectedCode" Font-Bold="True"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                           </table>
                             
</ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="dropICDCat" EventName="SelectedIndexChanged" />
<asp:AsyncPostBackTrigger ControlID="dropICDItem" EventName="SelectedIndexChanged" />
<asp:AsyncPostBackTrigger ControlID="dropICDcode" EventName="SelectedIndexChanged" />
</Triggers>
</asp:UpdatePanel>

                           <table dir="rtl" >
                            <tr style="display:none;">
                                <td colspan="2">
                                    <uc7:UcItemControl ID="ucItemControlDeathReason_D" runat="server" />

                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <uc8:UcItemControl ID="ucItemCauseOfDeathNotRelatedA" runat="server" ViewTimes="false"/>

                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <uc8:UcItemControl ID="ucItemCauseOfDeathNotRelatedB" runat="server" ViewTimes="false" />

                                </td>
                            </tr>
                        </table>
                    
</ContentTemplate>
                
</ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" TabIndex="1" ID="TabPanelSmokingData" meta:resourcekey="TabPanelSmokingData">
                    <ContentTemplate>
                    <asp:UpdatePanel runat="server" ID="updSmoking" UpdateMode="Conditional">
                    <ContentTemplate>
                    <table dir="rtl">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" Text="Â· ﬂ«‰ «·„ Ê›Ì ÌœŒ‰ ø" runat="server"></asp:Label>
                                </td>
                                <td>
                                 <asp:RadioButtonList ID="radioListISSmoker" AutoPostBack="true" OnSelectedIndexChanged="radioListISSmoker_SelectedIndexChanged" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="‰⁄„" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="·«" Value="2" Selected="True"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" Text="‰Ê⁄ «· œŒÌ‰" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="radioListSmokingType" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="”ÌÃ«—…" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="‘Ì‘…" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="«Œ—Ì" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" Text="„œ… «· œŒÌ‰" runat="server"></asp:Label>
                                </td>
                                <td style="padding-right: 8px">
                                    <asp:TextBox ID="txtsmokingPeriod1" MaxLength="2" runat="server" Text="00" Width="30px" />
                                     <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" ValidationExpression="^([0]?[0-9]|[1][0-1])$"
                            ControlToValidate="txtsmokingPeriod1" runat="server" ErrorMessage="«·‘Â— €Ì— ’ÕÌÕ…"></asp:RegularExpressionValidator>
                            
                                    <asp:TextBox ID="txtsmokingPeriod2" MaxLength="2" runat="server" Text="00" Width="30px" />
                                    <asp:RegularExpressionValidator  Display="Dynamic" ID="RegularExpressionValidator2" ValidationExpression="^([0]?[0-9]|[1][0-9]|[2][0-9]|[3][0-9]|[4][0-9]|[5][0-9]|[6][0-9]|[7][0-9]|[8][0-9])$"
                            ControlToValidate="txtsmokingPeriod2" runat="server" ErrorMessage="«·”‰… €Ì— ’ÕÌÕ"></asp:RegularExpressionValidator>
                                </td>
                                <td>
                                    <asp:Label ID="Label4" Text="‘Â— - ”‰…" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="radioListISSmoker" EventName="SelectedIndexChanged" />
                    </Triggers>
                    </asp:UpdatePanel>
                    
</ContentTemplate>
                
</ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" TabIndex="2" ID="TabPanelAccidentData" meta:resourcekey="TabPanelAccidentData">
                    <ContentTemplate>
                    <asp:UpdatePanel runat="server" ID="updateAccedant" UpdateMode="Conditional">
                    <ContentTemplate>
                    <table dir="rtl">
                            <tr>
                                <td>
                                    <asp:Label ID="lblAccident" Text="Â· «·Ê›«… ‰ Ã  ⁄‰ Õ«œÀ" runat="server"></asp:Label>
                                </td>
                                <td> 
                                    <asp:RadioButtonList ID="rdCauseByAccedenc" AutoPostBack="true"
                                     OnSelectedIndexChanged="rdCauseByAccedenc_SelectedIndexChanged" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem  Text="‰⁄„" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="·«" Value="2" Selected="True"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblReason" Text="”»» «·Õ«œÀ" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpReason" Width="75px" AutoPostBack="true"  OnSelectedIndexChanged="drpReason_SelectedIndexChanged" runat="server">
                                        <asp:ListItem Text="-----" Value="0" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Õ«œÀ ÿ—Ìﬁ" Value="1"></asp:ListItem>
                                        <asp:ListItem Text=" ”„„" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Õ—Êﬁ" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="«Œ—Ï" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="Label5" Text="›Ì Õ«·… ”»» «Œ— «ﬂ » «·”»»" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAnotherReason" runat="server"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label6" Text="„ﬂ«‰ «·Õ«œÀ" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAccidentLocation" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label7" Text="«–« ﬂ«‰  Õ«œÀ… ÿ—Ìﬁ „« ‰Ê⁄ «·„—ﬂ»…" runat="server"></asp:Label>
                                </td>
                                <td style="margin-right: 40px">
                                    <asp:DropDownList ID="dropCarType" Width="75px" AutoPostBack="true" 
                                        OnSelectedIndexChanged="dropCarType_SelectedIndexChanged" runat="server" 
                                        Enabled="False">
                                        <asp:ListItem Text="-----" Value="0" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="”Ì«—…" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="ﬁÿ«—" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="„Ê ”ﬂ·" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="«Œ—Ï" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="Label8" Text="›Ì Õ«·… «Œ—Ì «ﬂ » «·‰Ê⁄" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCarType" runat="server" Enabled="False"></asp:TextBox>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label9" Text="Õœœ «·„’«»" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList Width="250px" ID="RdDeadPersonType" RepeatDirection="Horizontal"
                                        runat="server" Enabled="False">
                                        <%--<asp:ListItem  Text="€Ì— „⁄·Ê„" Value="1"></asp:ListItem>--%>
                                        <asp:ListItem Selected="True" Text="”«∆ﬁ" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="—«ﬂ»" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="„«— »«·ÿ—Ìﬁ" Value="4"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="rdCauseByAccedenc" EventName="SelectedIndexChanged"/>
                    </Triggers>
                    </asp:UpdatePanel>
                        
                    
</ContentTemplate>
                
</ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" TabIndex="3" ID="TabPanelTumorsData" meta:resourcekey="TabPanelTumorsData">
                    <ContentTemplate>
                    
                    <asp:UpdatePanel runat="server" ID="updTumors" UpdateMode="Conditional">
                    <ContentTemplate>
                    <table dir="rtl">
                            <tr>
                                <td>
                                    <asp:Label ID="Label10" Text="Â· ﬂ«‰ «·„ Ê›Ì Ì⁄«‰Ì «Ê—«„" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdTumorFlag" AutoPostBack="true"
                                    OnSelectedIndexChanged="rdTumorFlag_SelectedIndexChanged" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="‰⁄„" Value="1"></asp:ListItem>
                                        <asp:ListItem Selected="True" Text="·«" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblLocation" Text="„Êﬁ⁄ «·Ê—„ »«·Ã”„" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTumorLocation" Width="200px" runat="server" Visible="false"></asp:TextBox>
                                    <asp:DropDownList ID="uiDropDownListTumorLocation" runat="server" Width="200px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label11" Text="‰Ê⁄ «·Ê—„" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="dropTumorType" Width="207px" runat="server">
                                        <asp:ListItem Text="€Ì— „⁄·Ê„" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Õ„Ìœ" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Œ»ÌÀ" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label12" Text="„—Õ·… «·Ê—„" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="dropTumorPhases" Width="207px" runat="server">
                                        <%--<asp:ListItem Text="€Ì— „⁄·Ê„ " Value="1"></asp:ListItem>--%>
                                        <asp:ListItem Text="Ê—„ „Ê÷⁄Ï" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="„‰ ‘— »«·ÃÂ«“ «··Ì„›«ÊÏ" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="„‰ ‘— »«⁄÷«¡ «Œ—Ï »«·Ã”„" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="rdTumorFlag" EventName="SelectedIndexChanged" />
                    </Triggers>
                    </asp:UpdatePanel>
                        
                    
</ContentTemplate>
                
</ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel runat="server" TabIndex="4" ID="TabPanelGirlsData" meta:resourcekey="TabPanelGirlsData">
                    <ContentTemplate>
                        <table dir="rtl">
                       
                            <tr>
                                <td>
                                    <asp:Label ID="Label13" Text="Â· ﬂ«‰  «·„ Ê›«… Õ«„·ø" runat="server" 
                                        Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdDeathThroughCarry" RepeatDirection="Horizontal" runat="server" CssClass="RDL">
                                        <asp:ListItem Text="‰⁄„" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="·«" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    <asp:Label ID="Label16" Text="Â· ÕœÀ  «·Ê›«… «À‰«¡ «·Ê·«œ…" runat="server" 
                                        Font-Bold="True"></asp:Label>
                                    <br />(„‰ »œ«Ì… «·Ê·«œ… Õ Ï 24 ”«⁄… »⁄œ ‰Â«Ì… «·Ê·«œ…)
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdDeadThroughBirth" RepeatDirection="Horizontal" runat="server" CssClass="RDL">
                                       <asp:ListItem Text="‰⁄„" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="·«" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    
                                    <asp:Label ID="Label14" Text="Â· ÕœÀ  «·Ê›«… Œ·«· 42 ÌÊ„ »⁄œ «·Ê·«œ… ø" 
                                        runat="server" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdBirthPast6Weeks" RepeatDirection="Horizontal" runat="server" CssClass="RDL">
                                       <asp:ListItem Text="‰⁄„" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="·«" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label17" Text="›Ì Õ«·… ‰⁄„ : „« ÂÊ  «—ÌŒ «·Ê·«œÂ" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender CssClass="custom-calendar" Format="dd/MM/yyyy" 
                                        TargetControlID="txtDate" ID="calenderDate" runat="server" Enabled="True">
                                    </ajaxToolkit:CalendarExtender>
                                </td>
                                <td>
                                    <asp:Label ID="Label19" Text="‰« Ã «·Ê·«œ…" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="dropBirthOuput" Width="155px" runat="server">
                                        <asp:ListItem Text="«Œ —" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="„Ê·Êœ ÕÏ" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="„Ê·Êœ „Ì " Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label18" Text="›Ì Õ«·… ‰⁄„ : „« ÂÊ „ﬂ«‰ «·Ê·«œÂ" runat="server"></asp:Label>
                                </td>
                                <td>
                                <asp:DropDownList ID="txtBirthLocation" runat="server" Width="157px" meta:resourcekey="drpRelationResource1"
                                            TabIndex="16">
                                            <asp:ListItem Text="------" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="„‰“·" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="„” ‘›Ï" Value="2"></asp:ListItem>                                            
                                            <asp:ListItem Text="«Œ—Ï" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="Label20" Text="«·ﬁ«∆„ »«·Ê·«œ…" runat="server"></asp:Label>
                                </td>
                                <td>
                                     <asp:DropDownList ID="txtBirthOperator" runat="server" Width="157px" meta:resourcekey="drpRelationResource1"
                                            TabIndex="16">
                                            <asp:ListItem Text="------" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="ÿ»Ì»" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="„„—÷…" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="œ«Ì…" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="«Œ—Ï" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label15" 
                                        Text="Â· ÕœÀ  «·Ê›«… √À‰«¡ √Ê Œ·«· 42 ÌÊ„ »⁄œ «·≈ÃÂ«÷ ø" runat="server" 
                                        Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rdAbortionPast6Weeks" RepeatDirection="Horizontal" runat="server" CssClass="RDL">
                                        <asp:ListItem Text="‰⁄„" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="·«" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label22" Text="›Ì Õ«·… ‰⁄„ : „« ÂÊ  «—ÌŒ «·≈ÃÂ«÷" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="uiTextBoxAbortionDate" runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender CssClass="custom-calendar" Format="dd/MM/yyyy" 
                                        TargetControlID="uiTextBoxAbortionDate" ID="CalendarExtender1" runat="server" Enabled="True">
                                    </ajaxToolkit:CalendarExtender>
                                </td>
                                <td>
                                    <asp:Label ID="Label23" Text="„ﬂ«‰ «·≈ÃÂ«÷" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="uiTextBoxAbortionPlace" runat="server" Width="157px" meta:resourcekey="drpRelationResource1"
                                            TabIndex="16">
                                            <asp:ListItem Text="------" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="„‰“·" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="„” ‘›Ï" Value="2"></asp:ListItem>                                            
                                            <asp:ListItem Text="«Œ—Ï" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                </td>
                            </tr>
                            
                            
                        </table>
                    
</ContentTemplate>
                
</ajaxToolkit:TabPanel>
            </ajaxToolkit:TabContainer>
            <table dir="rtl" align="center">
                <tr>
                    <td align="center">
                        <asp:Button ID="btnAdd" Width="150px" Font-Size="Large" runat="server" 
                            meta:resourcekey="btnAddResource1" onclick="btnAdd_Click" />
                    </td>
                </tr>
            </table>
            <table align="center" runat="server" id="tblApprove" style="display:none">
                <tr>
                    <td>
                       <asp:Button runat="server" ID="btnApprove" OnClick="btnApprove_Click" Text=" ÊÀÌﬁ" Width="120px" />
                       <asp:Button runat="server" ID="btnBack" OnClick="btnBack_Click" Text="—ÃÊ⁄" Width="120px" />
                    </td>
                </tr>
            </table>
            </div>
</asp:Content>
