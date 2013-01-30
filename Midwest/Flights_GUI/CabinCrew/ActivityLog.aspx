<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/CabinCrew.Master" AutoEventWireup="true" CodeBehind="ActivityLog.aspx.cs" Inherits="Flights_GUI.CabinCrew.ActivityLog" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(function () {
        $("#mi7").addClass("selected");
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelViewAll" runat="server">
    <div class="ContentLeftDiv">
        <h4>
            Activity Log
        </h4>
        <div class="Details900">
        <div class="MoreBig" style="float: left;">
                    <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new activity log</asp:LinkButton>
                </div>
                <div class="clear10">
                </div>
                <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiLinkButtonSearch">
                <div class="AdminLeft" style="width: 120px">
                <asp:Label ID="Label5" runat="server" Text="Select Cabin Crew" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <telerik:RadComboBox ID="uiRadComboBoxCrewSearch" Runat="server" Skin="Office2007" 
                    Width="250px" NoWrap="True">
                </telerik:RadComboBox>
            </div>
            <div class="AdminRight">
                &nbsp;
                
            </div>
            <div class="clear5">
            </div>
            <div class="AdminLeft" style="width: 120px">
                <asp:Label ID="Label6" runat="server" Text="Activity" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <telerik:RadComboBox ID="uiRadComboBoxActSearch" Runat="server" 
                    Skin="Office2007" Width="250px">
                </telerik:RadComboBox>
            </div>
            <div class="AdminRight">
                &nbsp;                
            </div>
            <div class="clear5">
            </div>


            <div class="AdminLeft" style="width: 120px">
                <asp:Label ID="Label7" runat="server" Text="From" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <telerik:RadDatePicker ID="uiRadDatePickerFromSearch" runat="server" Culture="en-US" Skin="Office2007">
                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                        Skin="Office2007">
                    </Calendar>
                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                    </DateInput>
                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDatePicker>
                &nbsp;
                <asp:Label ID="Label8" runat="server" Text="To :" CssClass="Label"></asp:Label>
                &nbsp;
                <telerik:RadDatePicker ID="uiRadDatePickerToSearch" runat="server" Culture="en-US" Skin="Office2007">
                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                        Skin="Office2007">
                    </Calendar>
                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                    </DateInput>
                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDatePicker>
            </div>
            <div class="AdminRight">                                             
                        <div class="SearchBtn" style="width: 50px; margin-left: 5px;">
                            <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiButtonSearch_Click">Search</asp:LinkButton>
                        </div>              
            </div>
            <div class="clear5">
            </div>

            </asp:Panel>
                <div class="AdminMiddle" style="width: 100%;padding-left:5%;">
                <telerik:RadGrid ID="uiRadGridActivityLog" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellSpacing="0" 
                        HorizontalAlign="Center" Skin="Office2007" Width="90%"                         
                        onpageindexchanged="uiRadGridActivityLog_PageIndexChanged"                          
                        onitemcommand="uiRadGridActivityLog_ItemCommand" 
                        onitemdatabound="uiRadGridActivityLog_ItemDataBound">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            
                        <Columns>
                        <telerik:GridTemplateColumn HeaderText="Name">
                            <ItemTemplate> 
                                <asp:Label ID="uiLabelName" runat="server" ></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="FromDate" HeaderText="From" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>                            
                        <telerik:GridBoundColumn DataField="TODate" HeaderText="To" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>                            
                        <telerik:GridTemplateColumn HeaderText="Activity">
                            <ItemTemplate> 
                                <asp:Label ID="uiLabelActivityName" runat="server" ></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>                                              
                        <telerik:GridTemplateColumn HeaderText="Actions">
                                <ItemTemplate>                                                                    
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("FromDate").ToString() + "#" + Eval("ToDate").ToString() + "#" + Eval("CrewID").ToString() + "#" + Eval("ActivityID").ToString() %>'
                                        CommandName="DeleteActivityLog" OnClientClick="return confirm('Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>

                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>                            
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                       
                    </telerik:RadGrid>
                </div>
                <div class="clear5">
                </div>
        </div>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelEdit" runat="server">
    <div class="ContentLeftDiv">
        <h4>
           Edit Activity Log
        </h4>
        <div class="Details900">
            <div class="AdminLeft" style="width: 120px">
                <asp:Label ID="Label1" runat="server" Text="Select Cabin Crew" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <telerik:RadComboBox ID="uiRadComboBoxCabin" Runat="server" Skin="Office2007" 
                    Width="250px" NoWrap="True">
                </telerik:RadComboBox>
            </div>
            <div class="AdminRight">
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="uiRadComboBoxCabin" Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red" ValidationGroup="Activities" InitialValue="Select Crew"></asp:RequiredFieldValidator>
            </div>
            <div class="clear5">
            </div>
            <div class="AdminLeft" style="width: 120px">
                <asp:Label ID="Label2" runat="server" Text="Activity" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <telerik:RadComboBox ID="uiRadComboBoxActivity" Runat="server" 
                    Skin="Office2007" Width="250px">
                </telerik:RadComboBox>
            </div>
            <div class="AdminRight">
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="uiRadComboBoxActivity" Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red" ValidationGroup="Activities" 
                    InitialValue="Select Activity"></asp:RequiredFieldValidator>
            </div>
            <div class="clear5">
            </div>


            <div class="AdminLeft" style="width: 120px">
                <asp:Label ID="Label3" runat="server" Text="From" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <telerik:RadDatePicker ID="uiRadDatePickerFrom" runat="server" Culture="en-US" Skin="Office2007">
                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                        Skin="Office2007">
                    </Calendar>
                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                    </DateInput>
                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDatePicker>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="uiRadDatePickerFrom" Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red" ValidationGroup="Activities"></asp:RequiredFieldValidator>
&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" CssClass="Label" Text="To :"></asp:Label>
&nbsp;
                <telerik:RadDatePicker ID="uiRadDatePickerTo" runat="server" Culture="en-US" Skin="Office2007">
                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                        Skin="Office2007">
                    </Calendar>
                    <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                    </DateInput>
                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDatePicker>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="uiRadDatePickerTo" Display="Dynamic" ErrorMessage="*" 
                    ForeColor="Red" ValidationGroup="Activities"></asp:RequiredFieldValidator>
            </div>
            <div class="AdminRight">                
            </div>
            <div class="clear5">
            </div>

            <div class="AdminLeft" style="width: 120px">
                &nbsp;&nbsp;</div>
            <div class="AdminMiddle">
                <div class="More" style="float: left;">
                    <asp:LinkButton ID="uiButtonSave" runat="server" Text="Save" 
                        OnClick="uiButtonSave_Click" ValidationGroup="Activities"></asp:LinkButton></div>
                &nbsp;<div class="More" style="float: left; margin-left: 10px;">
                    <asp:LinkButton ID="uiLinkButtonCancel" runat="server" Text="Cancel" OnClick="uiLinkButtonCancel_Click"></asp:LinkButton></div>
            </div>
            <div class="AdminRight">
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    </asp:Panel>

</asp:Content>
