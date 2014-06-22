<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true"
    CodeBehind="Inbox.aspx.cs" Inherits="Pricing_GUI.Inbox" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-filter"></i>Filter Inbox</h4>
                        <span class="tools">
									<a href="javascript:;" class="icon-chevron-down"></a>
									<a href="javascript:;" class="icon-remove"></a>
									</span>						
                </div>
                <div class="widget-body">
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="Submission date From " ID="ui_lblSubmissionDate"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="ui_txtDateFrom" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender runat="server" TargetControlID="ui_txtDateFrom" ID="ui_calExntener"
                                    Enabled="True">
                                </cc1:CalendarExtender>
                            </td>
                            <td> &nbsp;&nbsp;&nbsp; &nbsp;</td>
                            <td>
                                <asp:Label runat="server" Text=" To " ID="Label1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="ui_txtDateTo" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender runat="server" TargetControlID="ui_txtDateTo" ID="CalendarExtender1"
                                    Enabled="True">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="Trade Name" ID="ui_lblTradeName"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="ui_txtTradeName" Width="200px"></asp:TextBox>
                            </td>
                            <td> &nbsp;&nbsp;&nbsp; &nbsp;</td>
                            <td> <asp:Label runat="server" ID="ui_lbldrpCommitteetype" Text="Committee Type"></asp:Label> </td>
                            <td> <asp:DropDownList runat="server" ID="ui_drpCommitteeType" Width="213px"></asp:DropDownList></td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label runat="server" Text="Status" ID="Label2"></asp:Label>
                            </td>
                            <td>
                               <asp:DropDownList runat="server" ID="ui_drpStatus" Width="213px"></asp:DropDownList>
                            </td>
                            <td> &nbsp;&nbsp;&nbsp; &nbsp;</td>
                            <td> </td>
                            <td> 

                          
                           
                            <asp:Button runat="server" ID="btnFilter" OnClick="btn_filter_Click" CssClass="btn btn-inverse" Width="100px" Text="Filter">
                            </asp:Button>
                            
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-tasks"></i>Inbox</h4>
                </div>
                <div class="widget-body">
                    <asp:GridView ID="uiGridViewInbox" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="10"
                        CssClass="table table-hover table-bordered" onpageindexchanging="uiGridViewInbox_PageIndexChanging" >
                        <Columns>
                            <asp:BoundField HeaderText="Submission Date" DataFormatString="{0:dd-MMMM-yyyy}"
                                DataField="SubmissionDate" />
                            <asp:BoundField DataField="CommitteType" HeaderText="Committee Type" />
                            <asp:BoundField DataField="TradeName" HeaderText="Trade Name" />
                            <asp:BoundField DataField="Dosage_form" HeaderText="Dosage form" />
                            <asp:BoundField DataField="FileType" HeaderText="File Type" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:TemplateField HeaderText="Details">
                                <ItemTemplate>
                                  <asp:Button runat="server" id="ui_btnTradePricingDetails" CommandArgument='<%# Eval("TradePricingID") %>'
                                   OnClick="ui_btnTradePricingDetails_Click" Text="..." CssClass="btn btn-primary" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <span class="space5"></span>
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>
