<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true"
    CodeBehind="ViewSchedule.aspx.cs" Inherits="Flights_GUI.Operation.ViewSchedule" %>
    <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript">
     $(function () {
         $("#mi31").addClass("selected");
     });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv">
        <h4>
            Pilot Schedule
        </h4>
        <div class="Details900">
        <div class="AdminLeft" style="height: 15px;padding-top:5px;width:25px;">
                             <asp:Label ID="Label1" runat="server" Text="Date" CssClass="Label"></asp:Label>
                            </div>
                            <div class="AdminMiddle" style="width:400px;">
                                <asp:Label ID="Label2" runat="server" Text="From :" CssClass="Label"></asp:Label>
                                &nbsp;<asp:TextBox ID="uiTextBoxFrom" runat="server"></asp:TextBox>
                                <asp:CalendarExtender ID="uiTextBoxFrom_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="uiTextBoxFrom" Format="dd/MM/yyyy">
                                </asp:CalendarExtender>
                                &nbsp;<asp:Label ID="Label3" runat="server" Text="To :" CssClass="Label"></asp:Label>
                                &nbsp;<asp:TextBox ID="uiTextBoxTo" runat="server"></asp:TextBox>
                                <asp:CalendarExtender ID="uiTextBoxTo_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="uiTextBoxTo"  Format="dd/MM/yyyy">
                                </asp:CalendarExtender>
                            </div>
                            <div class="AdminRight" style="width:150px">
                            
                             <div class="More" style="float: left;margin-left:5px;height:15px;">
                    <asp:LinkButton ID="uiLinkButtonView" runat="server" Text="View Schedule" 
                        onclick="uiLinkButtonView_Click"></asp:LinkButton></div>
                           </div>

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
                        <asp:BoundField DataField="ReportDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Flight Date" />
                        <asp:BoundField DataField="FlightNo" HeaderText="Flight No." />
                        <asp:BoundField DataField="Pilots" HeaderText="Pilots" />
                        <asp:TemplateField HeaderText="Sector <br /> From - To ">
                            <ItemTemplate>
                                <%# Eval("From_TO")  %>
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
    </div>
</asp:Content>
