<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Admin.Master" AutoEventWireup="true" CodeBehind="EditCategories.aspx.cs" Inherits="WebApplication.Admin.EditCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="AdminDiv">
    <div>
<h4>
        Edit Categories</h4></div>
<asp:Panel ID="uiPanelCurrentPages" runat="server" Visible= "true">
<div><h4>Current Categories</h4></div>

<div>
    <div class="smallleft">
        </div>
        <div class="smallrightHeight">
            <div class="AdminMore">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">Add new category</asp:LinkButton>
            </div>
        </div>
        <div class="AdminLeft">
        </div>
        <div class="clear5">
        </div>
    <asp:GridView ID="uiGridViewCats" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewCats_RowCommand" CssClass="grid"
        HorizontalAlign="Center" Width="80%" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="Category Name" DataField="CategoryName" />    
    <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center" ControlStyle-CssClass="actions">
    <ItemTemplate>
    
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="EditCat" >Edit</asp:LinkButton>

    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="DeleteCat" OnClientClick="return confirm('Are you sure you want to delete this record?')" >Delete</asp:LinkButton>
    
    </ItemTemplate>
        <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    </Columns>
        <HeaderStyle HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelCurrent" runat="server" Visible= "false">
    
        <div class="AdminLeft">
            Name</div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="UpdateService"></asp:TextBox></div>
        <div class="AdminRight" style="margin-left: 35px; ">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                ControlToValidate="uiTextBoxTitle" ForeColor="#C76E1F" ValidationGroup="UpdateService"></asp:RequiredFieldValidator></div>
        <div class="clear5">
        </div>        
       <div class="AdminLeft">
            Arabic Name</div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxArTitle" runat="server" ValidationGroup="UpdateService"></asp:TextBox></div>
        <div style="margin-left: 35px; ">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                ControlToValidate="uiTextBoxArTitle" ForeColor="#C76E1F" ValidationGroup="UpdateService"></asp:RequiredFieldValidator></div>
        <div class="clear5">
        </div>   
        <div class="AdminLeft">
            Image</div>
        <div class="AdminMiddle">
            <asp:FileUpload ID="uiFileUploadPath" runat="server" /></div>
        <div style="margin-left: 35px; ">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required"
                ControlToValidate="uiTextBoxArTitle" ForeColor="#C76E1F" ValidationGroup="UpdateService"></asp:RequiredFieldValidator></div>
        <div class="clear5">
        </div>   
        <div class="AdminLeft">
            &nbsp;</div>
        <div class="AdminMiddle AdminCP" style="width: 350px">
            <div class="SearchBtn" style="width: 45%; float: left;">
                <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" OnClick="uiLinkButtonUpdate_Click"
                    ValidationGroup="UpdateService">Update</asp:LinkButton>
            </div>
            <div class="SearchBtn">
                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" OnClick="uiLinkButtonCancel_Click">Cancel</asp:LinkButton>
            </div>
        </div>
        <div class="clear5">
        </div>
        </asp:Panel>
        </div>
</asp:Content>
