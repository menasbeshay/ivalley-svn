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
                        <i class="icon-comments"></i>Tickets</h4>
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
                        <i class="icon-tasks"></i>Inbox</h4>
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
									<h4><i class="icon-bullhorn"></i>General Notifications</h4>
									<span class="tools">
									<a href="javascript:;" class="icon-chevron-down"></a>
									<a href="javascript:;" class="icon-remove"></a>
									</span>							
								</div>
								<div class="widget-body">
                                    <asp:Repeater runat="server" ID="rptrGeneralNotification">
                                    <ItemTemplate>
                                     <div class="alert alert-block alert-success fade in">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<h4 class="alert-heading"><asp:Literal runat="server" ID="Literal2" Text='<%# Eval("Subject") %>'></asp:Literal></h4>
                                        <p>
                                         <asp:Literal runat="server" ID="Literal4" Text='<%# Eval("NotifyDate", "{0:dd-MM-yyyy}") %>'></asp:Literal>
                                        </p>
										<p>
											 <asp:Literal runat="server" ID="Literal3" Text='<%# Eval("NotificationText") %>'></asp:Literal> 
										</p>
									</div>

                                   
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                    <div class="alert alert-block alert-warning fade in">
                                        <button type="button" class="close" data-dismiss="alert">×</button>
                                        <h4 class="alert-heading"><asp:Literal runat="server" ID="lblSubject" Text='<%# Eval("Subject") %>'></asp:Literal></h4>
                                         <p>
                                         <asp:Literal runat="server" ID="Literal4" Text='<%# Eval("NotifyDate", "{0:dd-MM-yyyy}") %>'></asp:Literal>
                                        </p>
                                        <p>
                                           <asp:Literal runat="server" ID="Literal1" Text='<%# Eval("NotificationText") %>'></asp:Literal> 
                                        </p>
                                    </div>
                                    </AlternatingItemTemplate>
                                    </asp:Repeater>
								</div>
							</div>
            <!-- END PROGRESS BARS PORTLET-->
        </div>
        <div class="span6">
            <!-- BEGIN ALERTS PORTLET-->
           
            <!-- END ALERTS PORTLET-->

            <!------------- Private Notification-------------->
            	<div class="widget">
								<div class="widget-title">
									<h4><i class="icon-bell"></i>Private Notifications</h4>
									<span class="tools">
									<a href="javascript:;" class="icon-chevron-down"></a>
									<a href="javascript:;" class="icon-remove"></a>
									</span>							
								</div>
								<div class="widget-body">
                                    <asp:Repeater runat="server" ID="rptrPrivateNotifications">
                                    <ItemTemplate>
                                     <div class="alert alert-block alert-info fade in">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<h4 class="alert-heading"><asp:Literal runat="server" ID="Literal2" Text='<%# Eval("Subject") %>'></asp:Literal></h4>
                                         <p>
                                         <asp:Literal runat="server" ID="Literal4" Text='<%# Eval("NotifyDate", "{0:dd-MM-yyyy}") %>'></asp:Literal>
                                        </p>
										<p>
											 <asp:Literal runat="server" ID="Literal3" Text='<%# Eval("NotificationText") %>'></asp:Literal> 
										</p>
									</div>

                                   
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                    <div class="alert alert-block alert-warning fade in">
                                        <button type="button" class="close" data-dismiss="alert">×</button>
                                        <h4 class="alert-heading"><asp:Literal runat="server" ID="lblSubject" Text='<%# Eval("Subject") %>'></asp:Literal></h4>
                                         <p>
                                         <asp:Literal runat="server" ID="Literal4" Text='<%# Eval("NotifyDate", "{0:dd-MM-yyyy}") %>'></asp:Literal>
                                        </p>
                                        <p>
                                           <asp:Literal runat="server" ID="Literal1" Text='<%# Eval("NotificationText") %>'></asp:Literal> 
                                        </p>
                                    </div>
                                    </AlternatingItemTemplate>
                                    </asp:Repeater>
								</div>
							</div>
               <!------------- End Private Notification-------------->
        </div>
    </div>
</asp:Content>
