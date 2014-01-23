<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Admin.Master" AutoEventWireup="true" CodeBehind="EditPages.aspx.cs" Inherits="WebApplication.Admin.EditPages" %>
<%@ MasterType VirtualPath="~/Masterpages/Admin.Master" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="AdminDiv">
    <div>
<h4>
        Edit Pages</h4></div>
<asp:Panel ID="uiPanelCurrentPages" runat="server" Visible= "true">
<div><h4>Current Pages</h4></div>

<div>
    <asp:GridView ID="uiGridViewPages" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewPages_RowCommand" 
        HorizontalAlign="Center" Width="80%" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="Page Name" DataField="PageName" />
    <asp:BoundField  HeaderText="Title" DataField="Title" />
    <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    
    <div class="btn">
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="EditPage" >Edit</asp:LinkButton>
    </div>    
    

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


        <div class="smallleft">
            Title</div>
        <div class="smallrightHeight">
            <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="UpdateService"></asp:TextBox></div>
        <div style="margin-left: 35px; ">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                ControlToValidate="uiTextBoxTitle" ForeColor="#C76E1F" ValidationGroup="UpdateService"></asp:RequiredFieldValidator></div>
        <div class="clear10">
        </div>        
       <div class="smallleft">
            Content</div>
        <div class="clear10">
        </div> 
        <div style="float:left;width:780px;height:300px;">
            <FCKeditorV2:FCKeditor ID="uiFCKeditorContent" runat="server" BasePath="~/modules/fckeditor/" Height="300px" SkinPath="skins/silver/">
            </FCKeditorV2:FCKeditor>
            </div>
        
        <div class="clear10">
        </div>
        
        <div class="smallleft">
            &nbsp;</div>
        <div class="smallrightHeight AdminCP" style="width: 350px">
            <div class="SearchBtn" style="width: 45%; float: left;">
                <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" OnClick="uiLinkButtonUpdate_Click"
                    ValidationGroup="UpdateService">Update</asp:LinkButton>
            </div>
            <div class="SearchBtn">
                <asp:LinkButton ID="uiLinkButtonCancel" runat="server" OnClick="uiLinkButtonCancel_Click">Cancel</asp:LinkButton>
            </div>
        </div>
        <div class="clear10">
        </div>
        </asp:Panel>
        </div>
</asp:Content>
