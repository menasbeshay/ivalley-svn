<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/E_Admin.Master" AutoEventWireup="true" CodeBehind="Airports.aspx.cs" Inherits="Flights_GUI.Operation.Airports" %>
<%@ MasterType VirtualPath="~/MasterPages/E_Admin.Master" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="uiPanelViewAll" runat="server">
    <div class="span3 clearfix">
        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonAdd_Click">Add new airport</asp:LinkButton>
    </div>
    <div class="span12 clearfix">
        <telerik:RadGrid ID="uiRadGridAirports" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellSpacing="0" 
                        HorizontalAlign="Center" Skin="Office2007" Width="90%"                         
                        onpageindexchanged="uiRadGridAirports_PageIndexChanged"                          
                        onitemcommand="uiRadGridAirports_ItemCommand">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            
                        <Columns>
                        <telerik:GridBoundColumn DataField="Name" HeaderText="Name"></telerik:GridBoundColumn>                            
                        <telerik:GridBoundColumn DataField="IATACode" HeaderText="IATA Code"></telerik:GridBoundColumn>                        
                        <telerik:GridTemplateColumn HeaderText="Actions">
                                <ItemTemplate>                                
                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("AirPortID") %>'
                                        CommandName="EditAirport"><img src="../images/edit.png" alt="Edit" title="Edit" style="border:0;float:none;" /></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("AirPortID") %>'
                                        CommandName="DeleteAirport" OnClientClick="return confirm('Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>

                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>                            
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                       
                    </telerik:RadGrid>
    </div>
        </asp:Panel>
     <asp:Panel ID="uiPanelEdit" runat="server">
         <div class="span12 clearfix">
             <div class="span2">Name</div>
             <div class="span4">
                 <asp:TextBox ID="uiTextBoxName" runat="server"></asp:TextBox></div>
         </div>
         <div class="span12 clearfix" style="margin-left:0">
             <div class="span2">IATA Code</div>
             <div class="span4"><asp:TextBox ID="uiTextBoxCode" runat="server"></asp:TextBox></div>
         </div>
         <div class="span12 clearfix" style="margin-left:0">
             <div class="span2">
                 <asp:LinkButton ID="uiLinkButtonSave" runat="server" CssClass="btn btn-primary" OnClick="uiButtonSave_Click">Save</asp:LinkButton></div>
             <div class="span4">
                 <asp:LinkButton ID="uiLinkButtonCancel" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonCancel_Click">Cancel</asp:LinkButton></div>
             </div>
         </div>
     </asp:Panel>
</asp:Content>
