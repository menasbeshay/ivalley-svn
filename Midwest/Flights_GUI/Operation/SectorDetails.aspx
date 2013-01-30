<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="SectorDetails.aspx.cs" Inherits="Flights_GUI.Operation.SectorDetails" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../Common/Controls/SectorInfo.ascx" TagName="SectorInfo" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#mi2").addClass("selected");
        });

        function ValidateBlockTime() {
            OFFHours = parseInt($("#<%= uiDropDownListOFFHours.ClientID %>").val(), 10);
            OFFMins = parseInt($("#<%= uiDropDownListOFFMins.ClientID %>").val(), 10);

            ONHours = parseInt($("#<%= uiDropDownListOnHours.ClientID %>").val(), 10);
            ONMins = parseInt($("#<%= uiDropDownListOnMins.ClientID %>").val(), 10);

            DayHours = parseInt($("#<%= uiDropDownListDayHours.ClientID %>").val(), 10);
            DayMins = parseInt($("#<%= uiDropDownListDayMins.ClientID %>").val(), 10);

            NightHours = parseInt($("#<%= uiDropDownListNightHours.ClientID %>").val(), 10);
            NightMins = parseInt($("#<%= uiDropDownListNightMins.ClientID %>").val(), 10);

            totalDayNightHours = DayHours + NightHours + Math.floor((DayMins + NightMins) / 60);
            totalDayNightMins = (((DayMins + NightMins) % 60));

            var NewDate = new Date(1900, 0, 1, OFFHours, OFFMins, 0, 0);
            NewDate.setHours(NewDate.getHours() + totalDayNightHours);
            NewDate.setMinutes(NewDate.getMinutes() + totalDayNightMins);

            if (NewDate.getHours() == ONHours & NewDate.getMinutes() == ONMins) {
                return true;
            }
            else {
                alert('Error : Day Time + Night Time must equal to Chox Off Time - Chox On Time. ' /*+ NewDate.getHours() + ' : ' + NewDate.getMinutes() + ' - ' + totalDayNightHours + ' : ' + totalDayNightMins + '-**-'+  ONHours + ' : ' + ONMins*/);
                return false;
            }

        }        

    </script>
    <style type="text/css">
    .RadGrid_Office2007 .rgRow td
    {
        border: solid 1px #A6ACB8;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelEdit" runat="server">
        <div class="ContentLeftDiv">
            <h4>
                Edit Flight Details</h4>
            <div class="Details900">
                <asp:UpdateProgress ID="uiUpdateProgress" runat="server">
                    <ProgressTemplate>
                        <div style="width: 100%; height: 100%; top: 0px; left: 0px; position: fixed; display: block;
                            opacity: 0.7; background-color: #000; z-index: 10000; text-align: center;">
                            <div style="margin-top: 25%; background-color: White; width: 20%; margin-left: 50%;
                                text-align: center;">
                                <img src="../images/ajax-loader.gif" alt="Loading..." style="border: 0px; float: none;" />
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:UpdatePanel ID="uiUpdatePanel" runat="server">
                    <ContentTemplate>
                        <div class="MoreBig" style="float: right; position: absolute; right: 180px; top: 50px;
                            height: 25px; z-index: 99999;">
                            <asp:LinkButton ID="uiLinkButtonBack" runat="server" OnClick="uiLinkButtonBack_Click">Back to sector list</asp:LinkButton>
                        </div>
                        

                                    <div style="float: left; width: 98%" id="FlightForm">
                                        <div>
                                            <uc1:SectorInfo ID="SectorInfo1" runat="server" />
                                        </div>
                                        <div class="clear" style="height: 5px;">
                                        </div>
                                        <div class="AdminLeft" style="width: 18%">
                                            <asp:Label ID="Label5" runat="server" Text="Fuel Uplifted" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxFule" runat="server" Style="margin-left: -1px;"></asp:TextBox></div>
                                        <div class="AdminRight">
                                            &nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                ControlToValidate="uiTextBoxFule" Display="Dynamic" ErrorMessage="Numbers only."
                                                ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator1_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator1">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear">
                                        </div>
                                        <div class="clear10">
                                        </div>
                                        <div class="seprator">
                                            All Times in UTC
                                        </div>
                                        <div class="clear">
                                        </div>
                                        <div class="AdminLeft" style="width: 30%">
                                            <asp:Label ID="Label6" runat="server" Text="STD" CssClass="Label"></asp:Label>&nbsp;<asp:DropDownList
                                                ID="uiDropDownListSTDHours" runat="server" Enabled="False">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListSTDMins" runat="server" Enabled="False">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="AdminMiddle" style="width: 30%">
                                            <asp:Label ID="Label10" runat="server" Text="Chox Off" CssClass="Label"></asp:Label>&nbsp;<asp:DropDownList
                                                ID="uiDropDownListOFFHours" runat="server">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListOFFMins" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="AdminRight" style="width: 30%">
                                            <asp:Label ID="Label9" runat="server" Text="A/B" CssClass="Label"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:DropDownList ID="uiDropDownListATDHours" runat="server">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListATDMins" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clear" style="height: 5px;">
                                        </div>
                                        <div class="AdminLeft" style="width: 30%">
                                            <asp:Label ID="Label11" runat="server" Text="STA" CssClass="Label"></asp:Label>&nbsp;<asp:DropDownList
                                                ID="uiDropDownListSTAHours" runat="server" Enabled="False">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListSTAMins" runat="server" Enabled="False">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="AdminMiddle" style="width: 30%">
                                            <asp:Label ID="Label12" runat="server" Text="T/Down" CssClass="Label" Style="padding-right: 3px;"></asp:Label>&nbsp;<asp:DropDownList
                                                ID="uiDropDownListATAHours" runat="server">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListATAMins" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="AdminRight" style="width: 30%">
                                            <asp:Label ID="Label13" runat="server" Text="Chox On" CssClass="Label" Style="margin-right: 2px;"></asp:Label>&nbsp;<asp:DropDownList
                                                ID="uiDropDownListOnHours" runat="server">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListOnMins" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="clear" style="height: 5px;">
                                        </div>
                                        <div class="AdminLeft" style="width: 30%;">
                                            <asp:Label ID="Label20" runat="server" Text="Day" CssClass="Label"></asp:Label>&nbsp;<asp:DropDownList
                                                ID="uiDropDownListDayHours" runat="server">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListDayMins" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="AdminMiddle" style="width: 30%; margin-left: 5px;">
                                            <asp:Label ID="Label38" runat="server" Text="Night" CssClass="Label"></asp:Label>&nbsp;&nbsp;&nbsp;
                                            <asp:DropDownList ID="uiDropDownListNightHours" runat="server">
                                            </asp:DropDownList>
                                            :
                                            <asp:DropDownList ID="uiDropDownListNightMins" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                        </div>
                                        <div class="clear" style="height: 5px;">
                                        </div>
                                        <div class="seprator">
                                            General Info
                                        </div>
                                        <div class="clear">
                                        </div>
                                        <div class="AdminLeft" style="width: 20%; padding-right: 0px;">
                                            <asp:Label ID="Label14" runat="server" Text="Flight Plane Burn Off" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxPlanBurnOff" runat="server" Width="100px" CssClass="digits"></asp:TextBox></div>
                                        <div class="AdminRight" style="width: 40px">
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                                ControlToValidate="uiTextBoxPlanBurnOff" Display="Dynamic" ErrorMessage="Numbers only."
                                                ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator2_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator2">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="AdminLeft" style="width: 14%; padding-right: 0px;">
                                            <asp:Label ID="Label15" runat="server" Text="Actual Burn Off" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxActualBurn" runat="server" Width="100px" CssClass="digits"></asp:TextBox></div>
                                        <div class="AdminRight" style="width: 40px">
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                                                ControlToValidate="uiTextBoxActualBurn" Display="Dynamic" ErrorMessage="Numbers only."
                                                ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator5_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator5">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear" style="height: 5px">
                                        </div>
                                        <div class="AdminLeft" style="width: 20%; padding-right: 0px;">
                                            <asp:Label ID="Label21" runat="server" Text="Dep. Fuel" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxDepFuel" runat="server" Width="100px" CssClass="digits"></asp:TextBox></div>
                                        <div class="AdminRight" style="width: 40px">
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                                ControlToValidate="uiTextBoxDepFuel" Display="Dynamic" ErrorMessage="Numbers only."
                                                ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator3_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator3">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="AdminLeft" style="width: 14%; padding-right: 0px;">
                                            <asp:Label ID="Label22" runat="server" Text="Arr. Fuel" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxArrFuel" runat="server" Width="100px" CssClass="digits"></asp:TextBox></div>
                                        <div class="AdminRight" style="width: 40px">
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                                                ControlToValidate="uiTextBoxArrFuel" Display="Dynamic" ErrorMessage="Numbers only."
                                                ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator6_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator6">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear" style="height: 5px">
                                        </div>
                                        <div class="AdminLeft" style="width: 20%; padding-right: 0px;">
                                            <asp:Label ID="Label24" runat="server" Text="ZFW" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxZFW" runat="server" Width="100px" CssClass="digits"></asp:TextBox></div>
                                        <div class="AdminRight" style="width: 40px">
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                                ControlToValidate="uiTextBoxZFW" Display="Dynamic" ErrorMessage="Numbers only."
                                                ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator4_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator4">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="AdminLeft" style="width: 14%; padding-right: 0px;">
                                            <asp:Label ID="Label25" runat="server" Text="TOW" CssClass="Label"></asp:Label></div>
                                        <div class="AdminMiddle">
                                            <asp:TextBox ID="uiTextBoxTOW" runat="server" Width="100px" CssClass="digits"></asp:TextBox></div>
                                        <div class="AdminRight" style="width: 40px">
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server"
                                                ControlToValidate="uiTextBoxTOW" Display="Dynamic" ErrorMessage="Numbers only."
                                                ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator7_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator7">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear10">
                                        </div>
                                        <div class="AdminLeft" style="width: 24%; border-right: 1px solid black;">
                                            <asp:Label ID="Label23" runat="server" Text="No. of PAX" CssClass="Label" Style="margin-right: 30px;"></asp:Label>A
                                            :
                                            <asp:TextBox ID="uiTextBoxNoOFPax_A" runat="server" Width="50px" CssClass="digits"></asp:TextBox>
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server"
                                                ControlToValidate="uiTextBoxNoOFPax_A" Display="Dynamic" ErrorMessage="Numbers only."
                                                ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator8_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator8">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="AdminMiddle" style="width: 15%; border-right: 1px solid black; margin-left: 5px;">
                                            CH :
                                            <asp:TextBox ID="uiTextBoxNoOFPax_CH" runat="server" Width="50px" CssClass="digits"></asp:TextBox>
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                                                ControlToValidate="uiTextBoxNoOFPax_CH" Display="Dynamic" ErrorMessage="Numbers only."
                                                ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator9_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator9">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                            I :
                                            <asp:TextBox ID="uiTextBoxNoOFPax_I" runat="server" Width="50px" CssClass="digits"></asp:TextBox>
                                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                                ControlToValidate="uiTextBoxNoOFPax_I" Display="Dynamic" ErrorMessage="Numbers only."
                                                ForeColor="Red" ValidationExpression="^[-+]?(\d)+$" ValidationGroup="Flight">*</asp:RegularExpressionValidator>
                                            <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator10_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RegularExpressionValidator10">
                                            </cc1:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear10">
                                        </div>
                                        <cc1:Accordion ID="DelayAccordion" runat="server" ContentCssClass="AccordionContent"
                                            FramesPerSecond="30" HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected"
                                            TransitionDuration="250">
                                            <Panes>
                                                <cc1:AccordionPane ID="AccordionPaneDep" runat="server" ContentCssClass="" HeaderCssClass="">
                                                    <Header>
                                                        <div>
                                                            Dep. Delays
                                                        </div>
                                                    </Header>
                                                    <Content>
                                                        <div class="AdminLeft" style="width: 36%; border-right: 1px solid black;">
                                                            <div style="padding-left: 108px;">
                                                                Delay 1</div>
                                                        </div>
                                                        <div class="AdminMiddle" style="width: 20%; border-right: 1px solid black; margin-left: 5px;">
                                                            Delay 2
                                                        </div>
                                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                                            Delay 3
                                                        </div>
                                                        <div class="clear10">
                                                        </div>
                                                        <div class="AdminLeft" style="width: 36%; border-right: 1px solid black;">
                                                            <asp:Label ID="Label16" runat="server" Text="Code" CssClass="Label" Style="margin-right: 70px;"></asp:Label><asp:DropDownList
                                                                ID="uiDropDownListDelay1Code" runat="server" Width="103px">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminMiddle" style="width: 20%; border-right: 1px solid black; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListDelay2Code" runat="server" Width="103px">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListDelay3Code" runat="server" Width="103px">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="clear10">
                                                        </div>
                                                        <div class="AdminLeft" style="width: 36%; border-right: 1px solid black;">
                                                            <asp:Label ID="Label17" runat="server" Text="Time" CssClass="Label" Style="margin-right: 70px;"></asp:Label><asp:DropDownList
                                                                ID="uiDropDownListDelay1Hours" runat="server">
                                                            </asp:DropDownList>
                                                            :
                                                            <asp:DropDownList ID="uiDropDownListDelay1Mins" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminMiddle" style="width: 20%; border-right: 1px solid black; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListDelay2Hours" runat="server">
                                                            </asp:DropDownList>
                                                            :
                                                            <asp:DropDownList ID="uiDropDownListDelay2Mins" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListDelay3Hours" runat="server">
                                                            </asp:DropDownList>
                                                            :
                                                            <asp:DropDownList ID="uiDropDownListDelay3Mins" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="clear10">
                                                        </div>
                                                    </Content>
                                                </cc1:AccordionPane>
                                                <cc1:AccordionPane ID="AccordionPaneArr" runat="server" ContentCssClass="" HeaderCssClass="">
                                                    <Header>
                                                        <div>
                                                            Arr. Delays
                                                        </div>
                                                    </Header>
                                                    <Content>
                                                        <div class="AdminLeft" style="width: 36%; border-right: 1px solid black;">
                                                            <div style="padding-left: 108px;">
                                                                Delay 1</div>
                                                        </div>
                                                        <div class="AdminMiddle" style="width: 20%; border-right: 1px solid black; margin-left: 5px;">
                                                            Delay 2
                                                        </div>
                                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                                            Delay 3
                                                        </div>
                                                        <div class="clear10">
                                                        </div>
                                                        <div class="AdminLeft" style="width: 36%; border-right: 1px solid black;">
                                                            <asp:Label ID="Label18" runat="server" Text="Code" CssClass="Label" Style="margin-right: 70px;"></asp:Label><asp:DropDownList
                                                                ID="uiDropDownListArrDelay1Code" runat="server" Width="103px">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminMiddle" style="width: 20%; border-right: 1px solid black; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListArrDelay2Code" runat="server" Width="103px">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListArrDelay3Code" runat="server" Width="103px">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="clear10">
                                                        </div>
                                                        <div class="AdminLeft" style="width: 36%; border-right: 1px solid black;">
                                                            <asp:Label ID="Label19" runat="server" Text="Time" CssClass="Label" Style="margin-right: 70px;"></asp:Label><asp:DropDownList
                                                                ID="uiDropDownListArrDelay1Hours" runat="server">
                                                            </asp:DropDownList>
                                                            :
                                                            <asp:DropDownList ID="uiDropDownListArrDelay1Mins" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminMiddle" style="width: 20%; border-right: 1px solid black; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListArrDelay2Hours" runat="server">
                                                            </asp:DropDownList>
                                                            :
                                                            <asp:DropDownList ID="uiDropDownListArrDelay2Mins" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="AdminRight" style="width: 20%; margin-left: 5px;">
                                                            <asp:DropDownList ID="uiDropDownListArrDelay3Hours" runat="server">
                                                            </asp:DropDownList>
                                                            :
                                                            <asp:DropDownList ID="uiDropDownListArrDelay3Mins" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                        <div class="clear10">
                                                        </div>
                                                    </Content>
                                                </cc1:AccordionPane>
                                            </Panes>
                                        </cc1:Accordion>
                                        <div class="AdminLeft" style="width: 25%">
                                            &nbsp;&nbsp;</div>
                                        <div class="AdminMiddle" style="width: 50%;">
                                            <div class="More" style="float: left;">
                                                <asp:LinkButton ID="uiLinkButtonSaveSector" runat="server" Text="Save" OnClick="uiLinkButtonSaveSector_Click"
                                                    OnClientClick="return ValidateBlockTime();" ValidationGroup="Flight"></asp:LinkButton></div>
                                            &nbsp;<div class="More" style="float: left; width: 49%;">
                                                <asp:LinkButton ID="uiLinkButtonCancelSector" runat="server" Text="Cancel" OnClick="uiLinkButtonCancelSector_Click"></asp:LinkButton></div>
                                        </div>
                                        <div class="AdminRight">
                                        </div>
                                        <div class="clear">
                                        </div>
                                    </div>
                                    <div class="clear10">
                                    </div>
                                
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="uiLinkButtonCancelSector" />
                        <asp:PostBackTrigger ControlID="uiLinkButtonBack" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
