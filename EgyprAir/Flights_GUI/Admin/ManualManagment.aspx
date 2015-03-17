﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="ManualManagment.aspx.cs" Inherits="Flights_GUI.Admin.ManualManagment" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/IFlights.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $('.notify-row .btn-inverse').removeClass("active");
             $('#mi_top_Manage_Manuals').addClass("active");
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelViewAll" runat="server">
    <div class="span2 clearfix pull-right">
        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonAdd_Click">Add new manual</asp:LinkButton>
        <div class="clearfix">&nbsp;  </div>
    </div>
    <div class="span12 clearfix">
        <div class="span4">
            <h4>
                      All categories
                  </h4>
                  <telerik:RadTreeView ID="uiRadTreeViewCats" runat="server" OnNodeClick="uiRadTreeViewCats_NodeClick"></telerik:RadTreeView>
            </div>
        <div class="span8">
        <telerik:RadGrid ID="uiRadGridmanuals" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellSpacing="0" 
                        HorizontalAlign="Center" Skin="Office2007" Width="90%"                         
                        onpageindexchanged="uiRadGridmanuals_PageIndexChanged"                          
                        onitemcommand="uiRadGridmanuals_ItemCommand">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            
                        <Columns>
                        <telerik:GridBoundColumn DataField="Title" HeaderText="Title"></telerik:GridBoundColumn>                            
                        <telerik:GridBoundColumn DataField="CreatedBy" HeaderText="Created By"></telerik:GridBoundColumn>                        
                            <telerik:GridBoundColumn DataField="createdDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>                        
                        <telerik:GridTemplateColumn HeaderText="Actions">
                                <ItemTemplate>                                
                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ManualID") %>'
                                        CommandName="EditManual"><img src="../images/edit.png" alt="Edit" title="Edit" style="border:0;float:none;" /></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ManualID") %>'
                                        CommandName="DeleteManual" OnClientClick="return confirm('Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>

                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>                            
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                       
                    </telerik:RadGrid>
            </div>
    </div>
        </asp:Panel>
     <asp:Panel ID="uiPanelEdit" runat="server">
         <div class="span12 clearfix">
             <div class="span2">Title</div>
             <div class="span4">
                 <asp:TextBox ID="uiTextBoxTitle" runat="server"></asp:TextBox></div>
         </div>
         <div class="span12 clearfix" style="margin-left:0">
             <div class="span2">Created By</div>
             <div class="span4"><asp:TextBox ID="uiTextBoxCreatedBy" runat="server"></asp:TextBox></div>
         </div>
          <div class="span12 clearfix" style="margin-left:0">
             <div class="span2">Manual</div>
             <div class="span4">
                 <asp:FileUpload ID="uiFileUploadManual" runat="server" />
             </div>
         </div>
         <div class="span12 clearfix" style="margin-left:0;margin-top:10px;">
             <div class="span2"></div>
             <div class="span2">
                 <asp:LinkButton ID="uiLinkButtonSave" runat="server" CssClass="btn btn-primary" OnClick="uiButtonSave_Click">Save</asp:LinkButton></div>
             <div class="span4">
                 <asp:LinkButton ID="uiLinkButtonCancel" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonCancel_Click">Cancel</asp:LinkButton></div>
             </div>
         
     </asp:Panel>
</asp:Content>
