<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Common.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="Flights_GUI.Common.Tickets" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(function () {
        $("#Cmi1").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Panel ID="uiPanelViewAll" runat="server">
        <div class="ContentLeftDiv">
            <h4>
                Ticket List</h4>
            <div class="Details900">
                <div class="More" style="float: left;">
                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new ticket</asp:LinkButton>
                </div>
                <div class="clear10">
                </div>
                <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch">
                    <div class="AdminMiddle">
                        <asp:Label ID="Label33" runat="server" Text="Flight No. : " CssClass="Label"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="uiTextBoxSearch" runat="server" Width="310px"></asp:TextBox>
                        <div class="clear5">
                        </div>
                        &nbsp;<asp:Label ID="Label34" runat="server" CssClass="Label" Text="Date "></asp:Label>
                        
                        <asp:Label ID="Label35" runat="server" CssClass="Label" Text="From :"></asp:Label>
                        &nbsp;<asp:TextBox ID="uiTextBoxFromDate" runat="server" Width="100px"></asp:TextBox>
                        
                        <asp:CalendarExtender ID="uiTextBoxFromDate_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="uiTextBoxFromDate" Format="dd/MM/yyyy">
                        </asp:CalendarExtender>
                        &nbsp;
                        <asp:Label ID="Label36" runat="server" CssClass="Label" Text="To :"></asp:Label>
                        &nbsp;<asp:TextBox ID="uiTextBoxToDate" runat="server" Width="100px"></asp:TextBox>
                        <asp:CalendarExtender ID="uiTextBoxToDate_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="uiTextBoxToDate" Format="dd/MM/yyyy">
                        </asp:CalendarExtender>
                    </div>
                    <div class="AdminRight" style="width: 80px">
                        <div>
                            &nbsp;</div>
                        <div class="clear">
                        </div>
                        &nbsp;
                        <asp:Button ID="uiButtonSearch" runat="server" Text="بحث" OnClick="uiButtonSearch_Click"
                            Width="60px" Style="display: none;" />
                        <div class="SearchBtn" style="width: 50px; height: 15px; margin-top: -5px; margin-left: 5px;">
                            <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiButtonSearch_Click">Search</asp:LinkButton>
                        </div>
                    </div>
                    <div class="clear10">
                    </div>
                </asp:Panel>
                
                <div class="clear5">
                </div>

                <div class="AdminMiddle" 
                    style="width: 100%;text-align:center; padding-left: 5%;">     
                            
                                   
                    <telerik:RadGrid ID="uiRadGrid" runat="server" AutoGenerateColumns="False" 
                            HorizontalAlign="Center" Width="90%" AllowPaging="True" CellSpacing="0" 
                            Skin="Office2007" onitemcommand="uiRadGrid_ItemCommand" PageSize="10" 
                            onpageindexchanged="uiRadGrid_PageIndexChanged" 
                        onpagesizechanged="uiRadGrid_PageSizeChanged" 
                        onitemcreated="uiRadGrid_ItemCreated" EnableLinqExpressions="False">
                        
                        <MasterTableView HierarchyDefaultExpanded="false" HierarchyLoadMode="Client"
                            DataKeyNames="ReportID, ReturnFlightID" Width="100%" >
                            <SelfHierarchySettings ParentKeyName="ReportID" KeyName="ReturnFlightID" MaximumDepth="1"></SelfHierarchySettings>                                                        
                            <Columns>
                            <telerik:GridBoundColumn DataField="FlightNo" HeaderText="Flight No."></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="IsReturnFlight" HeaderText="IsReturnFlight" Visible="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ReportDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ReportID") %>'
                                        CommandName="EditReport"><img src="../images/edit.png" alt="Edit" title="Edit" style="border:0;float:none;" /></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ReportID") %>'
                                        CommandName="DeleteReport" OnClientClick="return confirm('This ticket may have a return one.\r if you delete it , its return ticket will be a normal ticket.\r\n Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            </Columns>                                                                                                                                            
                        </MasterTableView>
                        <ClientSettings AllowExpandCollapse="true">
                        </ClientSettings>                        
                        <HeaderStyle HorizontalAlign="Center" />                        
                    </telerik:RadGrid>                  
                </div>
                <div class="clear5"></div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="uiPanelEdit" runat="server">
        <div class="ContentLeftDiv">
            <h4>
                Edit Ticket Details</h4>
            <div class="Details900">
                <telerik:RadAjaxLoadingPanel ID="uiRadAjaxLoadingPanel" runat="server" Skin="Default">
                <div style="width: 100%; height: 100%; top: 0px; left: 0px; position: fixed; display: block;
                            opacity: 0.7; background-color: #000; z-index: 10000; text-align: center;">
                            <div style="margin-top: 25%; background-color: White; width: 20%; margin-left: 50%;
                                text-align: center;">
                                <img src="../images/ajax-loader.gif" alt="Loading..." style="border: 0px; float: none;" />
                                <div class="clear">
                                </div>
                            </div>
                        </div>
                </telerik:RadAjaxLoadingPanel>
                <%--<asp:UpdateProgress ID="uiUpdateProgress" runat="server">
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
                </asp:UpdateProgress>--%>
                <telerik:RadAjaxPanel ID="uiRadAjaxPanel" runat="server" Width="100%" >
                
                <%--<asp:UpdatePanel ID="uiUpdatePanel" runat="server">
                    <ContentTemplate>--%>
                        
                                    <div class="clear5">
                                    </div>
                                    <div class="AdminLeft" style="width: 10%">
                                        <asp:Label ID="Label2" runat="server" Text="Flight No." CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        </div>
                                    <div class="AdminRight" style="width: 420px">
                                        <asp:TextBox ID="uiTextBoxSectorFlightNo" runat="server" Width="150px"></asp:TextBox>
                                        &nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="uiTextBoxSectorFlightNo" Display="Dynamic" 
                                            ErrorMessage="Required" ForeColor="Red" ValidationGroup="Flight">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
                                        </asp:ValidatorCalloutExtender>
                                        
                                    </div>
                                    <div class="AdminRight" style="width: 350px">
                                            <div class="MoreBig" style="float: left; height: 15px; width: 150px;">
                                                <asp:LinkButton ID="uiLinkButtonAddReturnFlight" runat="server" 
                                                    OnClick="uiLinkButtonAddReturnFlight_Click">Creat return back ticket</asp:LinkButton>
                                            </div>
                                            &nbsp;
                                            
                                        </div>
                                    <div class="clear5">
                                    </div>
                                    <div class="AdminLeft" style="width: 10%">
                                        <asp:Label ID="Label3" runat="server" Text="Date" CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:TextBox ID="uiTextBoxDate" runat="server" Width="150px"></asp:TextBox>
                                        <asp:CalendarExtender ID="uiTextBoxDate_CalendarExtender" runat="server" Enabled="True" TargetControlID="uiTextBoxDate"
                                            Format="dd/MM/yyyy">
                                        </asp:CalendarExtender>
                                    </div>
                                    <div class="AdminRight">
                                    </div>
                                    
                                    <div class="clear5">
                                    </div>
                                    <div class="clear">
                                    </div>
                                
                                    
                                    <div>                                     
                                    <div style="float:left;width:98%" id="FlightForm">
                                        <div class="AdminLeft" style="width: 10%">
                                            <asp:Label ID="Label39" runat="server" CssClass="Label" Text="From "></asp:Label></div>
                                        <div class="AdminMiddle" style="vertical-align: 50%">
                                            <asp:DropDownList ID="uiDropDownListSectorFrom" runat="server" Width="155px">
                                            </asp:DropDownList>
                                            &nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="uiDropDownListSectorFrom" 
                                                ErrorMessage="Please select airport" ForeColor="Red" InitialValue="0" 
                                                ValidationGroup="Flight">*</asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                                            </asp:ValidatorCalloutExtender>
&nbsp; <asp:Label ID="Label8" runat="server" Text="To " CssClass="Label"></asp:Label>&nbsp;&nbsp;<asp:DropDownList
                                                ID="uiDropDownListSectorTo" runat="server" Width="155px">
                                            </asp:DropDownList>
                                            &nbsp;
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ControlToValidate="uiDropDownListSectorTo" ErrorMessage="Please select airport" 
                                                ForeColor="Red" InitialValue="0" ValidationGroup="Flight">*</asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender" 
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                                            </asp:ValidatorCalloutExtender>
                                        </div>
                                        <div class="clear" style="height: 5px">
                                        </div>
                                        <div class="clear" style="height: 5px">
                                        </div>
                                        <div class="clear10">
                                        </div>
                                        
                                        <div class="seprator">
                                        Pilots
                                    </div>
                                    <div class="clear">
                                    </div>

                                    <div style="float:left;padding:15px;width:40%;">
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label26" runat="server" Text="Pilot" CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListPilot" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;</div>
                                    <div class="clear" style="height:5px;">
                                    </div>
                                    <div class="clear" style="height:5px;">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        &nbsp;</div>
                                    <div class="AdminMiddle">
                                        <div class="More" style="float: left; height: 15px;">
                                            <asp:LinkButton ID="uiLinkButtonAddFlying" runat="server" OnClick="uiLinkButtonAddFlying_Click">Add new Pilot</asp:LinkButton></div>
                                    </div>
                                    </div>
                                    <div style="float:left;padding:15px;width:40%;">
                                    <div class="AdminLeft" style="width: 25%;">
                                        <asp:Label ID="Label30" runat="server" CssClass="Label" Text="Co-Pilot"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListCoPilot" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;</div>
                                    <div class="clear" style="height:5px;">
                                    </div>
                                   <div class="clear" style="height:5px;">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        &nbsp;</div>
                                    <div class="AdminMiddle">
                                        <div class="More" style="float: left; height: 15px;">
                                            <asp:LinkButton ID="uiLinkButtonAddCo" runat="server" OnClick="uiLinkButtonAddCo_Click">Add new Co-Pilot</asp:LinkButton></div>
                                    </div>
                                    </div>
                                    <div class="AdminMiddle" style="text-align: center; width: 100%;">
                                        <asp:GridView ID="uiGridViewPiolts" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                                            OnRowCommand="uiGridViewPiolts_RowCommand" OnRowDataBound="uiGridViewPiolts_RowDataBound"
                                            Width="80%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Staff No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelStaffNo" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelName" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>                                                
                                                <asp:TemplateField HeaderText="Is Pilot">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="uiCheckBoxIsPilot" runat="server" Enabled="false" /></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Actions">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ReportPilotID") %>'
                                                            CommandName="DeletePilot"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /> </asp:LinkButton></ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </div>
                                    <div class="clear10">
                                    </div>
                                    <div class="seprator">
                                        Crew
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div style="float:left;padding:15px; width: 40%;">
                                    <div class="AdminLeft" style="width: 25%">
                                        <asp:Label ID="Label28" runat="server" Text="Crew Member" CssClass="Label"></asp:Label></div>
                                    <div class="AdminMiddle">
                                        <asp:DropDownList ID="uiDropDownListCrew" runat="server" Width="150px">
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;</div>
                                   <div class="clear" style="height:5px;">
                                    </div>
                                    <div class="clear" style="height:5px;">
                                    </div>
                                    <div class="AdminLeft" style="width: 25%">
                                        &nbsp;</div>
                                    <div class="AdminMiddle">
                                        <div class="More" style="float: left; height: 15px;">
                                            <asp:LinkButton ID="uiLinkButtonAddCrew" runat="server" OnClick="uiLinkButtonAddCrew_Click">Add crew Member</asp:LinkButton></div>
                                    </div>
                                    </div>
                                    <div class="AdminMiddle" style="text-align: center; width: 100%;">
                                        <asp:GridView ID="uiGridViewCrew" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                                            OnRowCommand="uiGridViewCrew_RowCommand" OnRowDataBound="uiGridViewCrew_RowDataBound"
                                            Width="80%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Staff No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelStaffNo" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="uiLabelName" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>                                                
                                                <asp:TemplateField HeaderText="Actions">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ReportCrewID") %>'
                                                            CommandName="DeleteCrew"> <img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton></ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </div>
                                    
                                        </div>
                                    </div>
                                    <div class="clear10">
                                        </div>
                                
                                    
                                
                  <%--  </ContentTemplate>
                </asp:UpdatePanel>--%>
                </telerik:RadAjaxPanel>
                <div class="AdminLeft">
                                        &nbsp;</div>
                                    <div class="AdminMiddle" style="width: 300px">
                                    <div class="More" style="width: 130px; float: left">
                                        <asp:LinkButton ID="uiLinkButtonSave" runat="server" 
                                            onclick="uiLinkButtonSave_Click">Save</asp:LinkButton>
                                    </div>
                                    &nbsp;
                                    <div class="More" style="width: 130px; float: left">
                                        <asp:LinkButton ID="uiLinkButtonCancel" runat="server" 
                                            onclick="uiLinkButtonCancel_Click">Cancel</asp:LinkButton>
                                    </div>
                                    <div class="More" 
                                            style="float: left; height: 15px; width: 105px;margin-left:20px; position: absolute; top: 58px; right: 220px;">
                                                <asp:LinkButton ID="uiLinkButtonBack" runat="server" 
                                                    OnClick="uiLinkButtonBack_Click">Back</asp:LinkButton>
                                            </div>
                                    </div>
                                    <div class="clear10"></div>
            </div>
        </div>

        

    </asp:Panel>
</asp:Content>
