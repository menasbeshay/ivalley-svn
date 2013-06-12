<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/CabinCrew.Master" AutoEventWireup="true" CodeBehind="ManageCrewProfile.aspx.cs" Inherits="Flights_GUI.CabinCrew.ManageCrewProfile" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <asp:Panel ID="uiPanelViewAll" runat="server">
    <div class="ContentLeftDiv">
            <h4>
                Crew Profiles</h4>
            <div class="Details900">
                <div class="More" style="float: left;" runat="server" id="AddDiv">
                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new crew</asp:LinkButton>
                </div>
                <div class="clear5">
                </div>
                <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch">
                    <div class="AdminMiddle">
                        <asp:Label ID="Label33" runat="server" Text="Search : " CssClass="Label"></asp:Label>
                        &nbsp;
                        <asp:TextBox ID="uiTextBoxSearch" runat="server" Width="310px"></asp:TextBox>
                        <div class="clear5">
                        </div>
                        
                    </div>
                    <div class="AdminRight" style="width: 120px">
                       
                        <asp:Button ID="uiButtonSearch" runat="server" Text="بحث" OnClick="uiButtonSearch_Click"
                            Width="60px" Style="display: none;" />
                        <div class="SearchBtn" style="width: 50px; height: 15px; margin-top: -5px; margin-left: 5px;">
                            <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiButtonSearch_Click">Search</asp:LinkButton>
                        </div>
                    </div>
                    <div class="clear10">
                    </div>
                </asp:Panel>

                <telerik:RadGrid ID="uiRadGridCrew" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellSpacing="0" GridLines="None" 
                    onitemcommand="uiRadGridCrew_ItemCommand" 
                    onpageindexchanged="uiRadGridCrew_PageIndexChanged" 
                    onpagesizechanged="uiRadGridCrew_PageSizeChanged" Skin="Office2007" 
                    HorizontalAlign="Center">
                    <MasterTableView>
                        <CommandItemSettings ExportToPdfText="Export to PDF" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" 
                            Visible="True">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" 
                            Visible="True">
                        </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="Name" HeaderText="Name">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LicenseNo" HeaderText="License No.">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="Actions">
                            <ItemTemplate>
                                
                                <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("CrewID") %>'
                                    CommandName="EditCrew"><img src="../images/edit.png" alt="Edit" title="Edit" style="border:0;float:none;" /></asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("CrewID") %>'
                                    CommandName="DeleteCrew" OnClientClick="return confirm('Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                    </Columns>                        
                        <ItemStyle HorizontalAlign="Center" />
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </MasterTableView>                    
                </telerik:RadGrid>
            </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="uiPanelEdit" runat="server">
    <div class="ContentLeftDiv">
            <h4>
                Edit Profile</h4>
            <div class="Details900">
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                   &nbsp;</div>
                <div class="AdminMiddle">
                    <asp:Label ID="uiLabelError" runat="server" CssClass="Label" ForeColor="Red"></asp:Label>
                    </div>
                <div class="AdminRight" style="width: 40px">
                    
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label15" runat="server" Text="Name" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:TextBox ID="uiTextBoxName" runat="server" Width="200px" CssClass="digits" 
                        ValidationGroup="CrewProfile"></asp:TextBox></div>
                <div class="AdminRight" style="width: 40px">
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Required" ControlToValidate="uiTextBoxName" Display="None" 
                        Font-Bold="True" ForeColor="Red" ValidationGroup="CrewProfile"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="RegularExpressionValidator1_ValidatorCalloutExtender"
                        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
                                            </cc1:ValidatorCalloutExtender>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label13" runat="server" Text="Username" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:TextBox ID="uiTextBoxUserName" runat="server" Width="200px" 
                        CssClass="digits" ValidationGroup="CrewProfile"></asp:TextBox></div>
                <div class="AdminRight" style="width: 40px">
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required"
                        ControlToValidate="uiTextBoxUserName" Display="None" Font-Bold="True" ForeColor="Red"
                        ValidationGroup="CrewProfile"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" Enabled="True"
                        TargetControlID="RequiredFieldValidator4">
                    </cc1:ValidatorCalloutExtender>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label14" runat="server" Text="Password" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:TextBox ID="uiTextBoxPassword" runat="server" Width="200px" 
                        CssClass="digits" ValidationGroup="CrewProfile" TextMode="Password"></asp:TextBox></div>
                <div class="AdminRight" style="width: 40px">
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required"
                        ControlToValidate="uiTextBoxPassword" Display="None" Font-Bold="True" ForeColor="Red"
                        ValidationGroup="CrewProfile"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" Enabled="True"
                        TargetControlID="RequiredFieldValidator5">
                    </cc1:ValidatorCalloutExtender>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label16" runat="server" Text="Confirm password" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:TextBox ID="uiTextBoxCPassword" runat="server" Width="200px" 
                        CssClass="digits" ValidationGroup="CrewProfile" TextMode="Password"></asp:TextBox></div>
                <div class="AdminRight" style="width: 40px">
                    &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="uiTextBoxPassword"
                        ControlToValidate="uiTextBoxCPassword" Display="None" ErrorMessage="Password doesn't match"
                        Font-Bold="True" ForeColor="Red" ValidationGroup="CrewProfile"></asp:CompareValidator>
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" Enabled="True"
                        TargetControlID="CompareValidator1">
                    </cc1:ValidatorCalloutExtender>
                    &nbsp;</div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label1" runat="server" Text="Staff No." CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:TextBox ID="uiTextBoxStaffNo" runat="server" Width="200px" 
                        CssClass="digits" ValidationGroup="CrewProfile"></asp:TextBox></div>
                <div class="AdminRight" style="width: 40px">
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                        ControlToValidate="uiTextBoxStaffNo" Display="None" Font-Bold="True" ForeColor="Red"
                        ValidationGroup="CrewProfile"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" Enabled="True"
                        TargetControlID="RequiredFieldValidator2">
                    </cc1:ValidatorCalloutExtender>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label2" runat="server" Text="License No." CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <asp:TextBox ID="uiTextBoxLicenseNo" runat="server" Width="200px" 
                        CssClass="digits" ValidationGroup="CrewProfile"></asp:TextBox></div>
                <div class="AdminRight" style="width: 40px">
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required"
                        ControlToValidate="uiTextBoxLicenseNo" Display="None" Font-Bold="True" ForeColor="Red"
                        ValidationGroup="CrewProfile"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" Enabled="True"
                        TargetControlID="RequiredFieldValidator3">
                    </cc1:ValidatorCalloutExtender>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label3" runat="server" Text="Competenecy Check" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <telerik:RadDatePicker ID="uiRadDatePickerCompetenecycheck" runat="server" 
                        Skin="Office2007">
                        <Calendar Skin="Office2007" UseColumnHeadersAsSelectors="False" 
                            UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                        </Calendar>
                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                        </DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>                    
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 24%; padding-right: 0px;">
                    <asp:Label ID="Label4" runat="server" Text="Medical License Expiry " CssClass="Label"></asp:Label></div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 88px; padding-right: 0px;">&nbsp;</div>
                <div class="AdminMiddle">
                    <asp:Label ID="Label12" runat="server" Text="From : " CssClass="Label"></asp:Label>
                    <telerik:RadDatePicker ID="uiRadDatePickerMLEF" runat="server" 
                        Skin="Office2007">
                        <Calendar Skin="Office2007" UseColumnHeadersAsSelectors="False" 
                            UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                        </Calendar>
                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                        </DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>
                    &nbsp;
                    <asp:Label ID="Label5" runat="server" Text="To : " CssClass="Label"></asp:Label>
                    <telerik:RadDatePicker ID="uiRadDatePickerMLET" runat="server" 
                        Skin="Office2007">
                        <Calendar Skin="Office2007" UseColumnHeadersAsSelectors="False" 
                            UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                        </Calendar>
                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                        </DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label6" runat="server" Text="Instructor Renewal" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <telerik:RadDatePicker ID="uiRadDatePickerInstructorRenewal" runat="server" 
                        Skin="Office2007">
                        <Calendar Skin="Office2007" UseColumnHeadersAsSelectors="False" 
                            UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                        </Calendar>
                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                        </DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label7" runat="server" Text="Transition Course" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <telerik:RadDatePicker ID="uiRadDatePickerTransitionCourse" runat="server" 
                        Skin="Office2007">
                        <Calendar Skin="Office2007" UseColumnHeadersAsSelectors="False" 
                            UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                        </Calendar>
                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                        </DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label8" runat="server" Text="Recurrent 12" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <telerik:RadDatePicker ID="uiRadDatePickerRecurrent12" runat="server" 
                        Skin="Office2007">
                        <Calendar Skin="Office2007" UseColumnHeadersAsSelectors="False" 
                            UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                        </Calendar>
                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                        </DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label10" runat="server" Text="Recurrent 24" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <telerik:RadDatePicker ID="uiRadDatePickerRecurrent24" runat="server" 
                        Skin="Office2007">
                        <Calendar Skin="Office2007" UseColumnHeadersAsSelectors="False" 
                            UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                        </Calendar>
                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                        </DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label11" runat="server" Text="SMS" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <telerik:RadDatePicker ID="uiRadDatePickerSMS" runat="server" Skin="Office2007">
                        <Calendar Skin="Office2007" UseColumnHeadersAsSelectors="False" 
                            UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                        </Calendar>
                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                        </DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>
                </div>
                <div class="clear" style="height: 5px">
                </div>
                <div class="AdminLeft" style="width: 15%; padding-right: 0px;">
                    <asp:Label ID="Label9" runat="server" Text="Security" CssClass="Label"></asp:Label></div>
                <div class="AdminMiddle">
                    <telerik:RadDatePicker ID="uiRadDatePickerSecurity" runat="server" 
                        Skin="Office2007">
                        <Calendar Skin="Office2007" UseColumnHeadersAsSelectors="False" 
                            UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                        </Calendar>
                        <DateInput DateFormat="dd/MM/yyyy" DisplayDateFormat="dd/MM/yyyy" LabelWidth="40%">
                        </DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDatePicker>
                </div>
                <div class="clear" style="height: 15px">
                </div>
                <div class="AdminLeft" style="width: 20%">
                    &nbsp;&nbsp;</div>
                <div class="AdminMiddle" style="width: 50%;">
                    <div class="More" style="float: left; width:35%;">
                        <asp:LinkButton ID="uiLinkButtonSaveCrew" runat="server" Text="Save" OnClick="uiLinkButtonSaveCrew_Click"
                           ValidationGroup="CrewProfile"></asp:LinkButton></div>
                    &nbsp;<div class="More" style="float: left; width: 35%;">
                        <asp:LinkButton ID="uiLinkButtonCancelCrew" runat="server" Text="Cancel" 
                            OnClick="uiLinkButtonCancelCrew_Click"></asp:LinkButton></div>
                </div>
                <div class="clear">
                </div>
            </div>
    </div>
    </asp:Panel>
</asp:Content>
