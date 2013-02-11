<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ENNoBanner.Master" AutoEventWireup="true" CodeBehind="EditTicker.aspx.cs" Inherits="Obtravel.Admin.EditTicker" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div><h1>
        Edit Ticker</h1>
        <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <a href="AdminCP.aspx">Back to Admin CP</a>
                            </div>                           
                        </div>
                        </div>
<asp:Panel ID="uiPanelCurrentNews" runat="server" Visible= "true">
<h2>
            Add new 
        </h2>
        <div class="smallleftHeight AdminCP">
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new </asp:LinkButton>
            </div>
        </div>
        <div class="clear10px">
        </div>
<div><h2>Current News</h2></div>
<div>
    <asp:GridView ID="uiGridViewNews" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewNews_RowCommand" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="Title" DataField="Content" />
    <asp:BoundField  HeaderText="Order" DataField="Order" />
    <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <div class="smallrightHeight AdminCP">
    <div class="btn">
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="EditNews" >Edit</asp:LinkButton>
    </div>    
    <div class="btn">
    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="DeleteNews"  OnClientClick="return confirm('Are you want to delete this record?');">Delete</asp:LinkButton>
    </div> 
    </div>

    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelCurrent" runat="server" Visible= "false">


        <div class="smallleft">
            Title</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="UpdateNews" 
                Columns="50"></asp:TextBox></div>
        <div style="float: left; margin-left: 200px; margin-top: 8px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                ControlToValidate="uiTextBoxTitle" ForeColor="#C76E1F" ValidationGroup="UpdateNews"></asp:RequiredFieldValidator></div>
        <div class="clear10px">
        </div>
        <div class="smallleft">
            Order</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxOrder" runat="server" ValidationGroup="UpdateNews"></asp:TextBox></div>
        <div class="clear10px">
        </div>
       <div class="smallleft">
            &nbsp;</div>
        <div class="smallrightHeight AdminCP">
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" OnClick="uiLinkButtonUpdate_Click"
                    ValidationGroup="UpdateNews">Update</asp:LinkButton>
            </div>
            <div class="btn">
                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" OnClick="uiLinkButtonCancel_Click">Cancel</asp:LinkButton>
            </div>
        </div>
        <div class="clear10px">
        </div>
        </asp:Panel>
</asp:Content>
