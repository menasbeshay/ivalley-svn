<%@ Page Title="" Language="C#" MasterPageFile="~/CAPA/Site.Master" AutoEventWireup="true" CodeBehind="ManageTickets.aspx.cs" Inherits="Pricing_GUI.CAPA.ManageTickets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<p style="text-align:left">
    <asp:Label runat="server" ID="lblPageTitle" Text="Tickets :" Font-Names="Sakkal Majalla"
        Font-Size="XX-Large" ForeColor="#003366" Font-Underline="True" Font-Bold="True"></asp:Label></p>

<div class="clearfix" style="clear:both;height:5px;"></div>
    <asp:Panel runat="server" ID="uiPanelSearch" DefaultButton="uiLinkButtonSearch">  
         <div class="row-fluid">
         <div class="span3">
         
         Status : <asp:DropDownList ID="uiDropDownListStatus" runat="server" 
                 CssClass="input-large" AutoPostBack="true"
                 onselectedindexchanged="uiDropDownListStatus_SelectedIndexChanged">
                        </asp:DropDownList>
                        </div>
                        <div class="span4">
                        Company name :
                            <asp:TextBox ID="uiTextBoxSearchtxt" runat="server" CssClass="input-large" Width="70%"></asp:TextBox>
                        </div>
                        <div class="span2">
                            <asp:LinkButton Text="Search" runat="server" class="btn btn-primary" 
                                ID="uiLinkButtonSearch" onclick="uiLinkButtonSearch_Click"/>
                        </div>
                        </div>

    </asp:Panel>
    <div class="clear" style="height:20px;"></div>
    <asp:GridView ID="uiGridViewTickets" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        OnPageIndexChanging="uiGridViewTickets_PageIndexChanging" OnRowCommand="uiGridViewTickets_RowCommand"
        OnRowDataBound="uiGridViewTickets_RowDataBound" CssClass="table table-hover table-bordered">
        <Columns>
            <asp:BoundField HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" DataField="InitiateDate" />
            <asp:TemplateField HeaderText="Trade Name">
                <ItemTemplate>
                    <asp:Label ID="uiLabelTradeName" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Text Request">
                <ItemTemplate>
                    <%# !string.IsNullOrEmpty(Eval("TextRequest").ToString()) ? (Eval("TextRequest").ToString().Length > 30 ? Eval("TextRequest").ToString().Substring(0, 30) + "....." : Eval("TextRequest").ToString()) : ""%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="TypeName" HeaderText="Ticket Type" />
            <asp:BoundField DataField="StatusName" HeaderText="Status" />
            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:LinkButton ID="uiLinkButtonView" runat="server" CommandArgument='<%# Eval("TicketID").ToString() %>'
                        CommandName="ViewTicket">Open Ticket</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
