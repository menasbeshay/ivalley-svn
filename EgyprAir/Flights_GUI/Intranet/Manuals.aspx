<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="Manuals.aspx.cs" Inherits="Flights_GUI.Intranet.Manuals" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/IFlights.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.notify-row .btn-inverse').removeClass("active");
            $('#mi_top_Manuals').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="span12 clearfix">
        <div class="span4">
            <h4>
                      All categories
                  </h4>
                  <telerik:RadTreeView ID="uiRadTreeViewCats" runat="server" OnNodeClick="uiRadTreeViewCats_NodeClick"></telerik:RadTreeView>
            </div>
        <div class="span8">
            <small>Please, select a category to see its manuals.</small>
        <telerik:RadGrid ID="uiRadGridmanuals" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellSpacing="0" 
                        HorizontalAlign="Center" Skin="Office2007" Width="90%"                         
                        onpageindexchanged="uiRadGridmanuals_PageIndexChanged">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            
                        <Columns>
                        <telerik:GridBoundColumn DataField="Title" HeaderText="Title"></telerik:GridBoundColumn>                            
                        <telerik:GridBoundColumn DataField="CreatedBy" HeaderText="Created By"></telerik:GridBoundColumn>                        
                        <telerik:GridBoundColumn DataField="createdDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>                        
                        <telerik:GridHyperLinkColumn DataTextField="Title" DataNavigateUrlFields="Path" DataTextFormatString="Download" DataNavigateUrlFormatString="{0}">
                            
                        </telerik:GridHyperLinkColumn>                        
                        </Columns>                            
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                       
                    </telerik:RadGrid>
            </div>
    </div>
</asp:Content>
