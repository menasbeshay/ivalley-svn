<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Training.Master" AutoEventWireup="true" CodeBehind="PilotHome.aspx.cs" Inherits="Flights_GUI.Training.PilotHome" %>
<%@ MasterType VirtualPath="~/MasterPages/E_Training.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-user"></i>Profile</h4>
                    <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                        class="icon-remove"></a></span>
                </div>
                <div class="widget-body">
                    <div class="span3">
                        <div class="text-center profile-pic">
                            <img src="../img/profile-pic.jpg" alt="">
                        </div>
                        <asp:Repeater ID="uiRepeaterTitles" runat="server">
                            <ItemTemplate>
                                <small>
                                    <%# Eval("Name") %></small>

                            </ItemTemplate>
                            <SeparatorTemplate>
                            &nbsp;/&nbsp;
                            </SeparatorTemplate>
                        </asp:Repeater>
                        <div class="clearfix" style="height:10px;"></div>
                        <asp:HyperLink ID="uiLinkButtonAddTitle" runat="server" CssClass="btn blue" NavigateUrl="#Titlemodal"
                            data-toggle="modal"><i class='icon-plus'></i> Add title</asp:HyperLink>
                        <div id="Titlemodal" class="modal  fade" tabindex="-1"  aria-labelledby="myModalLabel1"
                            aria-hidden="true">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    ×</button>
                                <h3 id="myModalLabel1">
                                    Edit Pilot Titles</h3>
                            </div>
                            <div class="modal-body">
                            <asp:UpdatePanel ID="uiUpdatePanelTitles" runat="server">
                            <ContentTemplate>
                                <div class="form-horizontal">
                                    <div class="control-group">
                                        <label class="control-label">
                                            Title</label>
                                        <div class="controls" style="margin-left:100px !important;">
                                            <div class="input-append">
                                                <asp:DropDownList ID="uiDropDownListTitle" runat="server" AutoPostBack="true" CssClass="input-large">
                                                </asp:DropDownList>
                                                &nbsp;
                                                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn blue" OnClick="uiLinkButtonAdd_Click"
                                                    Style="margin-left: 10px !important;"><i class='icon-plus'></i> Add Title</asp:LinkButton>
                                            </div>
                                    </div>
                                </div>
                                </div>
                                <div class="clearfix" style="height: 20px;">
                                </div>
                                <asp:GridView ID="uiGridViewTitles" runat="server" AutoGenerateColumns="False"
                                    CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="uiGridViewTitles_RowCommand"
                                    Width="90%">
                                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    <Columns>
                                        <asp:BoundField DataField="Name" HeaderText="Course" />
                                        <asp:TemplateField HeaderText="Actions">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("TitleID") %>'
                                                    CssClass="btn blue" CommandName="DeleteTitle" OnClientClick="return confirm('Do you want to delete this record?');"><i class='icon-remove'></i> Delete</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                                
                            </ContentTemplate>
                               
                            </asp:UpdatePanel>
                                <div class="modal-footer">
                                    <button class="btn" data-dismiss="modal" aria-hidden="true">
                                        Cancel</button>
                                    <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" class="btn btn-primary" OnClick="uiLinkButtonUpdate_Click">
                                    Close & update</asp:LinkButton>
                                </div>
                        </div>
                    </div>
                    <div class="span6">
                        <h4>
                            <asp:Label ID="uiLabelName" runat="server" ></asp:Label>
                            <br />
                           
                            </h4>
                        <table class="table table-borderless">
                            <tbody>
                                <tr>
                                    <td class="span2">
                                        First Name :
                                    </td>
                                    <td>
                                        <asp:Label ID="uiLabelFirstName" runat="server" ></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="span2">
                                        Last Name :
                                    </td>
                                    <td>
                                        <asp:Label ID="uiLabelLastName" runat="server"></asp:Label>
                                    </td>
                                </tr>
                               
                                
                                <tr>
                                    <td class="span2">
                                        License No. :
                                    </td>
                                    <td>
                                        <asp:Label ID="uiLabelLicenseNo" runat="server" ></asp:Label>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="span2">
                                        Airport Class :
                                    </td>
                                    <td>
                                        <asp:Label ID="uiLabelClass" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                        
                    </div>
                    <div class="span3">
                        
                        <h4>
                            Current Status</h4>
                        <asp:Literal ID="uiLiteralStatus" runat="server"></asp:Literal>

                    </div>
                    <div class="space5">
                    </div>
                </div>
            </div>
            <!-- BEGIN SAMPLE TABLE widget-->
            <div class="widget">
                <div class="widget-title">
                    <h4>
                        <i class="icon-reorder"></i>Current Courses</h4>
                    <span class="tools"><a href="javascript:;" class="icon-chevron-down"></a><a href="javascript:;"
                        class="icon-remove"></a></span>
                </div>
                <div class="widget-body">

                    <asp:Repeater ID="uiRepeaterCourses" runat="server" 
                        onitemdatabound="uiRepeaterCourses_ItemDataBound">
                    <HeaderTemplate>
                        <table class="table table-striped table-bordered" id="sample_1">
                            <thead>
                            <tr>
                                <th style="display: none">
                                </th>
                                <th class="hidden-phone center">
                                    Course
                                </th>
                                <th class="hidden-phone center">
                                    Date
                                </th>
                                <th class="hidden-phone center">
                                    Expiry Date
                                </th>
                                <th class="hidden-phone center">
                                    Status
                                </th>
                                <th class="hidden-phone center">
                                    Result
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                    </HeaderTemplate>

                    <ItemTemplate>
                        <tr>
                            <td style="display: none">
                            </td>
                            <td class="hidden-phone center">
                                <%# Eval("Name") %>
                            </td>
                            <td class="hidden-phone center">
                                <%# (Eval("StartDate") != null && !string.IsNullOrEmpty(Eval("StartDate").ToString()) && DateTime.Parse(Eval("StartDate").ToString()) != DateTime.Parse("1900-01-01")) ? string.Format("{0:dd/MM/yyyy}", Eval("StartDate")) : ""%>
                            </td>
                            <td class="hidden-phone center">
                                <%# (Eval("ExpiryDate") != null && !string.IsNullOrEmpty(Eval("ExpiryDate").ToString()) && DateTime.Parse(Eval("EndDate").ToString()) != DateTime.Parse("1900-01-01")) ? string.Format("{0:dd/MM/yyyy}", Eval("ExpiryDate")) : ""%>
                            </td>
                            
                            <td class="hidden-phone center">
                                <asp:Literal ID="uiLiteralStatus" runat="server"></asp:Literal>                                
                            </td>
                            <td class="hidden-phone center">
                                <asp:Literal ID="uiLiteralResult" runat="server"></asp:Literal>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody> </table>
                    </FooterTemplate>
                    </asp:Repeater>

                </div>
            </div>
            <!-- END SAMPLE TABLE widget-->
        </div>
    </div>

    </div>
</asp:Content>
