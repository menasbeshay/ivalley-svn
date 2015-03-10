<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="FlightBatchs.aspx.cs" Inherits="Flights_GUI.Operation.FlightBatchs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/IFlights.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="span12 clearfix"> 
        <asp:Panel runat="server" ID="uiPanelSuccess" Visible="false">
            <div class="alert alert-success">
                Mails sent successfully.
            </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelSearch" runat="server" DefaultButton="uiButtonSearch" CssClass="space12 clearfix">
                <div class="span7 clearfix">                    
                    &nbsp;<asp:Label ID="Label34" runat="server" CssClass="Label" Text="Date "></asp:Label>
                    <asp:Label ID="Label35" runat="server" CssClass="Label" Text="From :"></asp:Label>
                    &nbsp;<telerik:raddatepicker id="uiRadDatePickerFrom" runat="server" culture="en-US"
                        skin="Office2007">
                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                            Skin="Office2007">
                        </Calendar>
                        <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                        </DateInput>
                        <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    </telerik:raddatepicker>
                    &nbsp;
                    <asp:Label ID="Label36" runat="server" CssClass="Label" Text="To :"></asp:Label>
                    &nbsp;<telerik:raddatepicker id="uiRadDatePickerTo" runat="server" culture="en-US"
                        skin="Office2007">
                        <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                            Skin="Office2007">
                        </Calendar>
                        <DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy">
                        </DateInput>
                        <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                    </telerik:raddatepicker>
                    </div>
                <div class="span5 clearfix">
                    <asp:Button ID="uiButtonSearch" runat="server" Text="Send Notifications" OnClick="uiButtonSearch_Click" 
                        Width="60px" Style="display: none;" />
                    
                        <asp:LinkButton ID="uiLinkButtonSearch" runat="server" OnClick="uiButtonSearch_Click" CssClass="btn btn-primary">Search</asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="uiLinkButtonSend" runat="server" OnClick="uiButtonSend_Click" CssClass="btn btn-primary">Send notifications</asp:LinkButton>
                    
                </div>                
            </asp:Panel>
        <div class="span12 clearfix"  style="height:10px"></div>

        <div class="span12 clearfix">
            <div class="span2">
                Send mail to : 
            </div>
            <div class="span3">
                <small>write it as (mail@example.com; mail2@example.com ... )</small><br />
            <asp:TextBox ID="uiTextBoxMailto" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
            </div>
            
        </div>

        <div class="span12 clearfix">
            <div class="span2">
            mail body : 
                </div>
            <div class="span3">
            <asp:TextBox ID="uiTextBoxBody" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                </div>
        </div>

        <div class="span12 clearfix"  style="height:10px"></div>
        <div class="span12 clearfix" >
            <telerik:radgrid id="uiRadGridFlights" runat="server" allowpaging="True" autogeneratecolumns="False"
                        cellspacing="0" horizontalalign="Center" skin="Office2007" width="90%" 
                        onpageindexchanged="uiRadGridFlights_PageIndexChanged" onpagesizechanged="uiRadGridFlights_PageSizeChanged">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            <Columns>
                                <telerik:GridBoundColumn DataField="FlightNo" HeaderText="Flight No.">
                                </telerik:GridBoundColumn>                                                                                                

                                <telerik:GridBoundColumn DataField="SectorDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}">
                                </telerik:GridBoundColumn>
                                
                                <telerik:GridBoundColumn DataField="STD" HeaderText="STD" DataFormatString="{0:HH:mm}">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="STA" HeaderText="STA" DataFormatString="{0:HH:mm}">
                                </telerik:GridBoundColumn>

                                 <telerik:GridBoundColumn DataField="FromA" HeaderText="From">
                                </telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn DataField="ToA" HeaderText="To" >
                                </telerik:GridBoundColumn>

                                <telerik:GridTemplateColumn HeaderText="Pilots">
                                    <ItemTemplate>
                                        <asp:Label ID="uiLabelPilots" runat="server" Text='<%# Server.HtmlDecode(Eval("Pilots").ToString()) %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn HeaderText="Crew">
                                    <ItemTemplate>
                                        <asp:Label ID="uiLabelCrew" runat="server" Text='<%# Server.HtmlDecode(Eval("Crew").ToString()) %>'></asp:Label>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:radgrid>
                </div>
        <div class="span12 clearfix"  style="height:10px"></div>
        <div class="span12 clearfix" >
            <asp:Literal Text="" runat="server" ID="uiLiteralNames" />
            </div>
    </div>
        


</asp:Content>
