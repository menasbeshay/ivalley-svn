<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="CrewTrx.aspx.cs" Inherits="Flights_GUI.CabinCrew.CrewTrx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType  VirtualPath="~/MasterPages/IFlights.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelViewAll" runat="server">
    <div class="ContentLeftDiv">       
        <div class="Details900">
        
                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click" CssClass="btn btn-primary pull-right">Add new transaction</asp:LinkButton>
                
                <div class="clear10">
                </div>
                <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiLinkButtonSearch">
                    <div class="span12 clearfix">
                        <div class="span2"><asp:Label ID="Label5" runat="server" Text="Select Crew" CssClass="Label"></asp:Label></div>
                        <div class="span6"><asp:DropDownList ID="uiRadComboBoxCrewSearch" Runat="server" Width="250px" ></asp:DropDownList></div>
                        <div class="span4"></div>
                    </div>

                    <div class="span12 clearfix">
                        <div class="span2"><asp:Label ID="Label7" runat="server" Text="From" CssClass="Label"></asp:Label></div>
                        <div class="span2">
                            <telerik:RadDatePicker ID="uiRadDatePickerFromSearch" runat="server" Culture="en-US" Skin="Office2007">
                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                        Skin="Office2007">
                    </Calendar>
                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                    </DateInput>
                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDatePicker>
                        </div>

                        <div class="span2"><asp:Label ID="Label8" runat="server" Text="To :" CssClass="Label"></asp:Label></div>
                        <div class="span2"> <telerik:RadDatePicker ID="uiRadDatePickerToSearch" runat="server" Culture="en-US" Skin="Office2007">
                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                        Skin="Office2007">
                    </Calendar>
                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                    </DateInput>
                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDatePicker></div>
                        <div class="span4"><asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiButtonSearch_Click" CssClass="btn btn-primary">Search</asp:LinkButton></div>
                    </div>

              

            </asp:Panel>
                <div class="span12 clearfix">
                <telerik:RadGrid ID="uiRadGridTrx" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellSpacing="0" 
                        HorizontalAlign="Center" Skin="Office2007" Width="90%"                         
                        onpageindexchanged="uiRadGridTrx_PageIndexChanged"                          
                        onitemcommand="uiRadGridTrx_ItemCommand" >
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            
                        <Columns>
                        <telerik:GridBoundColumn DataField="DisplayName" HeaderText="Crew" ></telerik:GridBoundColumn>                                                                                                
                        <telerik:GridBoundColumn DataField="DateFrom" HeaderText="From" DataFormatString="{0:dd/MM/yyyy hh:mm tt}"></telerik:GridBoundColumn>                            
                        <telerik:GridBoundColumn DataField="DateTo" HeaderText="To" DataFormatString="{0:dd/MM/yyyy hh:mm tt}"></telerik:GridBoundColumn>                            
                        <telerik:GridBoundColumn DataField="TrxName" HeaderText="Transaction" ></telerik:GridBoundColumn>                                                                                                
                        <telerik:GridTemplateColumn HeaderText="Actions">
                                <ItemTemplate>                                                                    
                                     <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("CrewTransactionID").ToString() %>'
                                        CommandName="EditTrx" ><img src="../images/edit.png" alt="Edit" title="Edit" style="border:0;float:none;" /></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("CrewTransactionID").ToString() %>'
                                        CommandName="DeleteTrx" OnClientClick="return confirm('Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>

                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>                            
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                       
                    </telerik:RadGrid>
                </div>
                <div class="clearfix">
                </div>
        </div>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelEdit" runat="server">
    <div class="ContentLeftDiv">
        
        <div class="Details900">
            <div class="AdminLeft" style="width: 120px">
                <asp:Label ID="Label1" runat="server" Text="Select Crew" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <asp:DropDownList ID="uiRadComboBoxCrew" Runat="server" 
                    Width="250px" >
                </asp:DropDownList>
            </div>
            <div class="AdminRight">
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="uiRadComboBoxCrew" Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red" ValidationGroup="Activities" InitialValue="Select Crew"></asp:RequiredFieldValidator>
            </div>
            <div class="clear5">
            </div>
            <div class="AdminLeft" style="width: 120px">
                <asp:Label ID="Label2" runat="server" Text="Transaction" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <asp:DropDownList ID="uiRadComboBoxTrx" Runat="server" 
                    Width="250px">
                </asp:DropDownList>
            </div>
            <div class="AdminRight">
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="uiRadComboBoxTrx" Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red" ValidationGroup="Activities" 
                    InitialValue="Select Transaction"></asp:RequiredFieldValidator>
            </div>
            <div class="clear5">
            </div>

            <div class="span12 clearfix">
                <div class="span1"><asp:Label ID="Label3" runat="server" Text="From" CssClass="Label"></asp:Label></div>
                <div class="span2">
                    <telerik:RadDateTimePicker ID="uiRadDateTimePickerFrom" runat="server" Culture="en-US" Skin="Office2007" Width="120%">
                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                        Skin="Office2007">
                    </Calendar>
                    <DateInput DisplayDateFormat="dd/MM/yyyy hh:mm tt" DateFormat="dd/MM/yyyy hh:mm tt">
                    </DateInput>
                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDateTimePicker>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="uiRadDateTimePickerFrom" Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red" ValidationGroup="Activities"></asp:RequiredFieldValidator>
                </div>
                <div class="span1"></div>
                <div class="span1">
                    <asp:Label ID="Label4" runat="server" CssClass="Label" Text="To :"></asp:Label>
                </div>
                <div class="span2">
                    <telerik:RadDateTimePicker ID="uiRadDateTimePickerTo" runat="server" Culture="en-US" Skin="Office2007" Width="120%">
                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                        Skin="Office2007">
                    </Calendar>
                    <DateInput DisplayDateFormat="dd/MM/yyyy hh:mm tt" DateFormat="dd/MM/yyyy hh:mm tt">
                    </DateInput>
                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDateTimePicker>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="uiRadDateTimePickerTo" Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red" ValidationGroup="Activities"></asp:RequiredFieldValidator>
                </div>
                <div class="span5"></div>
            </div>
           
            <div class="AdminLeft" style="width: 120px">
                &nbsp;&nbsp;</div>
            <div class="AdminMiddle">
                <div class="More" style="float: left;">
                    <asp:LinkButton ID="uiButtonSave" runat="server" Text="Save" 
                        OnClick="uiButtonSave_Click" ValidationGroup="Activities" CssClass="btn btn-primary"></asp:LinkButton></div>
                &nbsp;<div class="More" style="float: left; margin-left: 10px;">
                    <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="Cancel" OnClick="uiLinkButtonCancel_Click" CssClass="btn btn-primary"></asp:LinkButton></div>
            </div>
            <div class="AdminRight">
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    </asp:Panel>

</asp:Content>
