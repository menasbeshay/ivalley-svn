<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_CabinCrew.Master" AutoEventWireup="true" CodeBehind="CrewSchedule.aspx.cs" Inherits="Flights_GUI.CabinCrew.CrewSchedule" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType  VirtualPath="~/MasterPages/E_CabinCrew.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    /*$(function () {
        $("#mi1").addClass("selected");
    });*/
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="ContentLeftDiv">
        
        <div class="Details900">
            <div class="span12 clearfix" >
            <div class="span2 ">
                <asp:Label ID="Label31" runat="server" Text="Select Crew" CssClass="Label"></asp:Label>
            </div>
            <div class="span4">
                                <asp:DropDownList ID="uiDropDownListCrew" runat="server" Width="150px">
                                </asp:DropDownList>&nbsp;
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ErrorMessage="Please select a crew" ControlToValidate="uiDropDownListCrew" 
                                    Display="Dynamic" ForeColor="Red" Operator="NotEqual" 
                                    ValidationGroup="Schedule" ValueToCompare="0"></asp:CompareValidator>
                </div>
            <div class="span5"></div>
                            </div>
              <div class="span12 clearfix" style="margin-left:0px;">
                <div class="span2"><asp:Label ID="Label1" runat="server" Text="From :" CssClass="Label"></asp:Label></div>
                <div class="span2">
                                
                               <asp:TextBox ID="uiTextBoxFrom" runat="server"  Width="150px"></asp:TextBox>
                                <asp:CalendarExtender ID="uiTextBoxFrom_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="uiTextBoxFrom" Format="dd/MM/yyyy">
                                </asp:CalendarExtender>
                                </div>
                <div class="span1"><asp:Label ID="Label3" runat="server" Text="To :" CssClass="Label"></asp:Label></div>
                                <div class="span2"><asp:TextBox ID="uiTextBoxTo" runat="server"  Width="150px"></asp:TextBox>
                                <asp:CalendarExtender ID="uiTextBoxTo_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="uiTextBoxTo"  Format="dd/MM/yyyy">
                                </asp:CalendarExtender>
                            </div>
                            <div class="span3">
                            
                             <div class="More" style="float: left;margin-left:5px;height:15px;">
                    <asp:LinkButton ID="uiLinkButtonView" runat="server" Text="View Status" CssClass="btn btn-primary" 
                        onclick="uiLinkButtonView_Click"></asp:LinkButton></div>
                           </div>
            </div>
            <div style="display:none">
                            <div class="clear10"></div>

                            <div class="AdminLeft" style="height: 15px;padding-top:5px;width:25px;">
                             &nbsp;
                            </div>
                            <div class="AdminMiddle" style="width:400px;">
                                &nbsp;
                            </div>
                            <div class="AdminRight" style="width:150px">
                            
                            <div class="More" style="float: left;margin-left:5px;height:15px;">
                    <asp:LinkButton ID="uiLinkButtonExport" runat="server" Text="Export Schedule" 
                        onclick="uiLinkButtonExport_Click"></asp:LinkButton></div>
                           </div>
                            <div class="clear10"></div>
            
            <div class="AdminMiddle" style="width: 100%">
                <asp:GridView ID="uiGridViewSchedule" runat="server" AutoGenerateColumns="False"
                    Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" 
                    AllowPaging="True" onpageindexchanging="uiGridViewSchedule_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Day" HeaderText="Day" />
                        <asp:BoundField DataField="SectorDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Flight Date" />
                        <asp:BoundField DataField="FlightNo" HeaderText="Flight No." />                        
                        <asp:TemplateField HeaderText="Crew">
                            <ItemTemplate>
                                <%# Eval("Crew").ToString().Replace("/ ","<br />")  %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sector <br /> From - To ">
                            <ItemTemplate>
                                <%# Eval("From_TO").ToString().Replace(" * ","<br />")  %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="STD" HeaderText="STD" DataFormatString="{0:hh:mm}" />
                        <asp:BoundField DataField="STA" HeaderText="STA" DataFormatString="{0:hh:mm}" />
                        <asp:BoundField DataField="ChoxOff" HeaderText="Chox Off" DataFormatString="{0:hh:mm}" />
                        <asp:BoundField DataField="ChoxOn" HeaderText="Chox On" DataFormatString="{0:hh:mm}" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle HorizontalAlign="Center" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </div>
            <div class="clear10">
            </div>

            </div>

             <div class="span12 clearfix">
                <telerik:RadGrid ID="uiRadGridTrx" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellSpacing="0" 
                        HorizontalAlign="Center" Skin="Office2007" Width="90%"                         
                        onpageindexchanged="uiRadGridTrx_PageIndexChanged" >
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            
                        <Columns>
                        <telerik:GridBoundColumn DataField="day" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>   
                        <telerik:GridBoundColumn DataField="StatusDay" HeaderText="Day" ></telerik:GridBoundColumn>                                                                                                    
                        <telerik:GridTemplateColumn HeaderText="Status">
                            <ItemTemplate>
                                <%# string.IsNullOrEmpty(Eval("CrewID").ToString()) ? "Day Off" :  Eval("StatusType").ToString() %>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                                                                                                                               
                            <telerik:GridBoundColumn DataField="FlightNo" HeaderText="Flight No." ></telerik:GridBoundColumn>   
                            <telerik:GridBoundColumn DataField="Route" HeaderText="Route" ></telerik:GridBoundColumn>   
                        <telerik:GridBoundColumn DataField="STD" HeaderText="STD" DataFormatString="{0:HH:mm}"></telerik:GridBoundColumn>                            
                        <telerik:GridBoundColumn DataField="STA" HeaderText="STA" DataFormatString="{0:HH:mm}"></telerik:GridBoundColumn>                            
                        <telerik:GridBoundColumn DataField="City" HeaderText="Night city" ></telerik:GridBoundColumn>                                                                                                                        
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
</asp:Content>
