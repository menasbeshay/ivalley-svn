<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Pricing_GUI.Home1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="page-title">
							Dashboard							
						</h3>
    <div class="row-fluid">
        <div class="span6">
            <!-- BEGIN PROGRESS BARS PORTLET-->
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-reorder"></i>Tickets</h4>
                </div>
                <div class="widget-body">
                    <div class="span12">
                    <asp:GridView ID="uiGridViewTickets" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnRowDataBound="uiGridViewTickets_RowDataBound" 
                 CssClass="table table-hover table-bordered">
                <Columns>
                    <asp:BoundField HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" DataField="InitiateDate" />
                    <asp:TemplateField HeaderText="Trade Name">
                        <ItemTemplate>
                            <asp:Label ID="uiLabelTradeName" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Text Request">
                        <ItemTemplate>
                            <%# !string.IsNullOrEmpty(Eval("TextRequest").ToString()) ? (Eval("TextRequest").ToString().Length > 20 ? Eval("TextRequest").ToString().Substring(0, 20) + "....." : Eval("TextRequest").ToString()) : ""%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TypeName" HeaderText="Ticket Type" />
                    <asp:BoundField DataField="StatusName" HeaderText="Status" />                   
                </Columns>
            </asp:GridView>
            </div>
                    <span class="space5"></span>
                </div>
            </div>
            <!-- END PROGRESS BARS PORTLET-->
        </div>
        <div class="span6">
            <!-- BEGIN ALERTS PORTLET-->
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-bell-alt"></i>Inbox</h4>
                </div>
                <div class="widget-body">
                    <asp:GridView ID="uiGridViewInbox" runat="server" AllowPaging="True" AutoGenerateColumns="False"  
                 CssClass="table table-hover table-bordered">
                <Columns>               
                    <asp:BoundField HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" DataField="SubmissionDate" />
                    <asp:BoundField DataField="TradeName" HeaderText="Trade Name" />                                            
                    <asp:BoundField DataField="Status" HeaderText="Status" />                   
                </Columns>
            </asp:GridView>
                    <span class="space5"></span>
                </div>
            </div>
            <!-- END ALERTS PORTLET-->
        </div>
    </div>


    <div class="row-fluid">
        <div class="span6">
            <!-- BEGIN PROGRESS BARS PORTLET-->
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-reorder"></i>General Notifications</h4>
                </div>
                <div class="widget-body">
                    <div class="span12">
                    <asp:GridView ID="uiGridViewGeneralNotifications" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                 CssClass="table table-hover table-bordered">
                <Columns>
                    <asp:BoundField HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" DataField="NotifyDate" />
                    <asp:BoundField DataField="Subject" HeaderText="Subject" />
                    <asp:TemplateField HeaderText="Text">
                        <ItemTemplate>
                            <%# !string.IsNullOrEmpty(Eval("NotificationText").ToString()) ? (Eval("NotificationText").ToString().Length > 30 ? Eval("NotificationText").ToString().Substring(0, 30) + "....." : Eval("NotificationText").ToString()) : ""%>
                        </ItemTemplate>
                    </asp:TemplateField>
                                        
                </Columns>
            </asp:GridView>
            </div>
                    <span class="space5"></span>
                </div>
            </div>
            <!-- END PROGRESS BARS PORTLET-->
        </div>
        <div class="span6">
            <!-- BEGIN ALERTS PORTLET-->
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-bell-alt"></i>Private Notifications</h4>
                </div>
                <div class="widget-body">
                    <div class="span12">
                    <asp:GridView ID="uiGridViewPrivateNotifications" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                 CssClass="table table-hover table-bordered">
                <Columns>
                    <asp:BoundField HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" DataField="NotifyDate" />
                    <asp:BoundField DataField="Subject" HeaderText="Subject" />
                    <asp:TemplateField HeaderText="Text">
                        <ItemTemplate>
                            <%# !string.IsNullOrEmpty(Eval("NotificationText").ToString()) ? (Eval("NotificationText").ToString().Length > 30 ? Eval("NotificationText").ToString().Substring(0, 30) + "....." : Eval("NotificationText").ToString()) : ""%>
                        </ItemTemplate>
                    </asp:TemplateField>
                                        
                </Columns>
            </asp:GridView>
            </div>
                    <span class="space5"></span>
                </div>
            </div>
            <!-- END ALERTS PORTLET-->
        </div>
    </div>
</asp:Content>
