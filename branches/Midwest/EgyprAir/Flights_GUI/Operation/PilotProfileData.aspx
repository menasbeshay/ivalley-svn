<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Admin.Master" AutoEventWireup="true" CodeBehind="PilotProfileData.aspx.cs" Inherits="Flights_GUI.Operation.PilotProfileData" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/E_Admin.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .RadGrid_Office2007 .rgRow td
        {
            border: solid 1px #A6ACB8;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="span12 clearfix">
        <asp:Panel ID="uiPanelALL" runat="server">
            <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch" CssClass="span12 clearfix">
                    <div class="span1">
                        <asp:Label ID="Label33" runat="server" Text="Search : " CssClass="Label"></asp:Label>
                        </div>
                    <div class="span4">
                        <asp:TextBox ID="uiTextBoxSearch" runat="server" Width="310px"></asp:TextBox>
                        </div>
                        
                    <div class="span2" >
                       
                        <asp:Button ID="uiButtonSearch" runat="server" Text="بحث" OnClick="uiButtonSearch_Click"
                            Width="60px" Style="display: none;" />
                        <div class="SearchBtn" >
                            <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiButtonSearch_Click" CssClass="btn btn-primary">Search</asp:LinkButton>
                        </div>
                    </div>
                    <div class="clear10">
                    </div>
                </asp:Panel>
            <div class="span12 clearfix">
                <div class="span2 right">
                        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click" CssClass="btn btn-primary">Add new pilot</asp:LinkButton>
                </div>
            </div>
            <div class="span12 clearfix">
                <telerik:radgrid id="uiRadGridPilots" runat="server" allowpaging="True" autogeneratecolumns="False"
                        cellspacing="0" horizontalalign="Center" skin="Office2007" width="90%" 
                        onpageindexchanged="uiRadGridPilots_PageIndexChanged" onpagesizechanged="uiRadGridPilots_PageSizeChanged"
                        onitemcommand="uiRadGridPilots_ItemCommand">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="ShortName" HeaderText="Short Name">
                                </telerik:GridBoundColumn>
                                
                                <telerik:GridTemplateColumn HeaderText="Name">
                                    <ItemTemplate>
                                        <%# Eval("FirstName") + " " + Eval("SecondName") + " " + Eval("SureName") %>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridBoundColumn DataField="Email" HeaderText="Email">
                                </telerik:GridBoundColumn>
                                
                                <telerik:GridBoundColumn DataField="Mobile" HeaderText="Mobile">
                                </telerik:GridBoundColumn>

                                <telerik:GridTemplateColumn HeaderText="Actions">
                                    <ItemTemplate>
                                        
                                        <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("PilotID") %>'
                                            CommandName="EditPilot"><img src="../images/edit.png" alt="Edit Details" title="Edit Details" style="border:0;float:none;" /></asp:LinkButton>
                                        &nbsp;
                                       
                                        <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("PilotID") %>' Visible="false"
                                            CommandName="DeletePilot" OnClientClick="return confirm('Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:radgrid>
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelEdit" runat="server">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab_1_1" data-toggle="tab">Personal Info</a></li>
                <li class=""><a href="#tab_1_2" data-toggle="tab">Aviation Info</a></li>
                <li class=""><a href="#tab_1_3" data-toggle="tab">Other Info</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_1_1">
                     <div class="span12 clearfix" style="margin-left: 0">
                   <asp:Label ID="uiLabelError" runat="server" CssClass="Label" ForeColor="Red"></asp:Label></div>
                    <div class="span12 clearfix" style="margin-left: 0">
                        <div class="span1" style="width: 13%">
                            First Name:
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <asp:TextBox ID="uiTextBoxFN" runat="server" ValidationGroup="PilotProfile" Width="160px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ValidationGroup="PilotProfile" Font-Bold="true" ForeColor="Red" ControlToValidate="uiTextBoxFN"> </asp:RequiredFieldValidator>
                        </div>
                        <div class="span1" style="width: 13%">Second Name :</div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <asp:TextBox ID="uiTextBoxLN" runat="server" ValidationGroup="PilotProfile" Width="160px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ValidationGroup="PilotProfile" Font-Bold="true" ForeColor="Red" ControlToValidate="uiTextBoxLN"> </asp:RequiredFieldValidator>
                        </div>
                        <div class="span1" style="width: 13%">SurName : </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <asp:TextBox ID="uiTextBoxSurName" runat="server" ValidationGroup="PilotProfile" Width="160px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="span12 clearfix" style="margin-left: 0">
                        <div class="span1" style="width: 13%">
                            License No. :
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <asp:TextBox ID="uiTextBoxLicNo" runat="server" ValidationGroup="PilotProfile" Width="160px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ValidationGroup="PilotProfile" Font-Bold="true" ForeColor="Red" ControlToValidate="uiTextBoxLicNo"> </asp:RequiredFieldValidator>
                        </div>
                        <div class="span1" style="width: 13%">
                            Expiry Date :
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <telerik:RadDatePicker ID="uiRadDatePickerLicExp" runat="server" Culture="en-US"
                                Skin="Office2007">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                    Skin="Office2007">
                                </Calendar>
                                <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                                </DateInput>
                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                    </div>

                    <div class="span12 clearfix" style="margin-left: 0">
                        <div class="span1" style="width: 13%">
                            Staff No. :
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <asp:TextBox ID="uiTextBoxStaffNo" runat="server" ValidationGroup="PilotProfile" Width="160px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ValidationGroup="PilotProfile" Font-Bold="true" ForeColor="Red" ControlToValidate="uiTextBoxStaffNo"> </asp:RequiredFieldValidator>
                        </div>
                        <div class="span1" style="width: 13%">
                            Short Name :
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <asp:TextBox ID="uiTextBoxShortName" runat="server" ValidationGroup="PilotProfile" Width="160px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ValidationGroup="PilotProfile" Font-Bold="true" ForeColor="Red" ControlToValidate="uiTextBoxShortName"> </asp:RequiredFieldValidator>
                        </div>
                        <div class="span1" style="width: 13%">
                            Is Pilot :
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <asp:CheckBox ID="uiCheckBoxIsPilot" runat="server" />
                        </div>
                    </div>

                    <div class="span12 clearfix" style="margin-left: 0">
                        <div class="span1" style="width: 13%">
                            Email :
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <asp:TextBox ID="uiTextBoxEmail" runat="server" ValidationGroup="PilotProfile" Width="160px"></asp:TextBox>
                        </div>
                        <div class="span1" style="width: 13%">Mobile : </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <asp:TextBox ID="uiTextBoxMobile" runat="server" ValidationGroup="PilotProfile" Width="160px"></asp:TextBox>
                        </div>
                        <div class="span1" style="width: 13%">Address : </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <asp:TextBox ID="uiTextBoxAddress" runat="server" ValidationGroup="PilotProfile" TextMode="MultiLine" Rows="4" Width="160px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="span12 clearfix" style="margin-left: 0">
                        <div class="span1" style="width: 13%">
                            Passport No: 
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <asp:TextBox ID="uiTextBoxPassportNo" runat="server" ValidationGroup="PilotProfile" Width="160px"></asp:TextBox>
                        </div>
                        <div class="span1" style="width: 13%">
                            Passport Expiry date :
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <telerik:RadDatePicker ID="uiRaddatepickerPassportExpiry" runat="server" Culture="en-US"
                                Skin="Office2007">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                    Skin="Office2007">
                                </Calendar>
                                <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                                </DateInput>
                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                    </div>

                    <div class="span12 clearfix" style="margin-left: 0">
                        <div class="span1" style="width: 13%">
                            Username :
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <asp:TextBox ID="uiTextBoxUsername" runat="server" ValidationGroup="PilotProfile" Width="160px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ValidationGroup="PilotProfile" Font-Bold="true" ForeColor="Red" ControlToValidate="uiTextBoxUsername"> </asp:RequiredFieldValidator>
                        </div>
                        <div class="span1" style="width: 13%">
                            Password
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px">
                            <asp:TextBox ID="uiTextBoxPassword" runat="server" ValidationGroup="PilotProfile" Width="160px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ValidationGroup="PilotProfile" Font-Bold="true" ForeColor="Red" ControlToValidate="uiTextBoxPassword"> </asp:RequiredFieldValidator>
                        </div>
                        <div class="span1" style="width: 13%"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                    </div>
                </div>
                <div class="tab-pane" id="tab_1_2">
                    <div class="span12 clearfix" style="margin-left: 0">
                        <div class="span1" style="width: 13%">
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                        <div class="span1" style="width: 13%"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                        <div class="span1" style="width: 13%"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                    </div>
                    <div class="span12 clearfix" style="margin-left: 0">
                        <div class="span1" style="width: 13%">
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                        <div class="span1" style="width: 13%"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                        <div class="span1" style="width: 13%"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                    </div>
                    <div class="span12 clearfix" style="margin-left: 0">
                        <div class="span1" style="width: 13%">
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                        <div class="span1" style="width: 13%"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                        <div class="span1" style="width: 13%"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                    </div>
                </div>
                <div class="tab-pane" id="tab_1_3">
                    <div class="span12 clearfix" style="margin-left: 0">
                        <div class="span1" style="width: 13%">
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                        <div class="span1" style="width: 13%"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                        <div class="span1" style="width: 13%"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                    </div>
                    <div class="span12 clearfix" style="margin-left: 0">
                        <div class="span1" style="width: 13%">
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                        <div class="span1" style="width: 13%"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                        <div class="span1" style="width: 13%"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                    </div>
                    <div class="span12 clearfix" style="margin-left: 0">
                        <div class="span1" style="width: 13%">
                        </div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                        <div class="span1" style="width: 13%"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                        <div class="span1" style="width: 13%"></div>
                        <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                    </div>
                </div>
            </div>


            <div class="span12 clearfix" style="margin-left: 0">
                <div class="span1" style="width: 13%">
                </div>
                <div class="span2" style="margin-left: 0; margin-right: 20px">
                    <asp:LinkButton ID="uiLinkButtonSave" runat="server" CssClass="btn btn-primary" ValidationGroup="PilotProfile" OnClick="uiLinkButtonSave_Click">Save</asp:LinkButton>
                </div>
                <div class="span1" style="width: 13%">
                    <asp:LinkButton ID="uiLinkButtonCancel" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonCancel_Click">Cancel</asp:LinkButton>
                </div>
                <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
                <div class="span1" style="width: 13%"></div>
                <div class="span2" style="margin-left: 0; margin-right: 20px"></div>
            </div>
        </asp:Panel>
        <div class="clearfix"></div>
    </div>
</asp:Content>
