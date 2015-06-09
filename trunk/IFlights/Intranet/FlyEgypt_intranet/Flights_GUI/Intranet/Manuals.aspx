<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ExceptionLight.Master" AutoEventWireup="true" CodeBehind="Manuals.aspx.cs" Inherits="Flights_GUI.Intranet.Manuals" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ MasterType VirtualPath="~/MasterPages/ExceptionLight.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.notify-row .btn-inverse').removeClass("active");
            $('#mi_top_Manuals').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <aside class="cell-3 left-shop">
        <div class="widget" data-animate="fadeInLeft">
            <h3 class="widget-head">categories</h3>
            <div class="widget-content">

                <telerik:RadTreeView ID="uiRadTreeViewCats" runat="server" OnNodeClick="uiRadTreeViewCats_NodeClick"></telerik:RadTreeView>
            </div>
        </div>

    </aside>

    <div class="cell-9 clearfix">

        <small>Please, select a category to see its manuals.</small>
        <h5>Current category :
            <asp:Label ID="uiLabelCat" runat="server"></asp:Label></h5>
        <telerik:RadGrid ID="uiRadGridmanuals" runat="server" AllowPaging="True"
            AutoGenerateColumns="False" CellSpacing="0"
            HorizontalAlign="Center" Width="90%"
            OnPageIndexChanged="uiRadGridmanuals_PageIndexChanged" EnableEmbeddedSkins="False">
            <AlternatingItemStyle HorizontalAlign="Center" />
            <MasterTableView>
                <Columns>
                    <telerik:GridBoundColumn DataField="Title" HeaderText="Title"></telerik:GridBoundColumn>
                    <%--<telerik:GridBoundColumn DataField="IssueNumber" HeaderText="Issue No."></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="IssueDate" HeaderText="Issue Date" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RevisionNumber" HeaderText="Revision No."></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RevisionDate" HeaderText="Revision Date" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>--%>
                    <telerik:GridBoundColumn DataField="CreatedByName" HeaderText="Created By"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="createdDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UpdatedByName" HeaderText="Updated By"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LastUpdatedDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>
                    <%--<telerik:GridHyperLinkColumn DataTextField="Title" DataNavigateUrlFields="Path" DataTextFormatString="Download" DataNavigateUrlFormatString="{0}">
                    </telerik:GridHyperLinkColumn>--%>
                </Columns>
            </MasterTableView>
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />

<FilterMenu EnableImageSprites="False"></FilterMenu>

        </telerik:RadGrid>

    </div>
</asp:Content>
