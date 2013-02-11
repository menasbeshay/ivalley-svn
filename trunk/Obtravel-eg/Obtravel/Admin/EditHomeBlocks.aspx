<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ENNoBanner.Master" AutoEventWireup="true" CodeBehind="EditHomeBlocks.aspx.cs" Inherits="Obtravel.Admin.EditHomeBlocks" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div><h1> Edit Home Page </h1>
    <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <a href="AdminCP.aspx">Back to Admin CP</a>
                            </div>                           
                        </div>
    </div>
<div class="clear10px"></div>
<asp:Panel ID="uiPanelCurrentBlocks" runat="server" Visible= "true">
<div><h2>Current Sections</h2></div>
<div>
    <asp:GridView ID="uiGridViewBlocks" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" onrowcommand="uiGridViewBlocks_RowCommand">
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="Title" DataField="Title" />
    <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <div class="smallrightHeight AdminCP">
    <div class="btn">
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="EditBlock" >Edit</asp:LinkButton>
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
<div class="smallleft">Title</div><div class="smallrightHeight">
    <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="UpdateBlocks" 
        Columns="50"></asp:TextBox></div>
    <div style="float:left; margin-left:210px;"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ErrorMessage="Required" ControlToValidate="uiTextBoxTitle" ForeColor="#C76E1F" 
    ValidationGroup="UpdateBlocks"></asp:RequiredFieldValidator></div>
<div class="clear10px"></div>
<div class="smallleft">Image</div><div class="smallrightHeight">
    <asp:FileUpload ID="uiFileUploadImage" runat="server" /></div>
    <div style="float:left;margin-left:100px;">
                <asp:Image ID="uiImageCurrent" runat="server" Width="80px" />         
            </div>
<div class="clear10px"></div>
<div class="smallleft">Content</div><div class="smallrightHeight"></div>
<div class="clear10px"></div>
<div><FCKeditorV2:FCKeditor ID="uiFCKeditor" runat="server" 
        BasePath="~/modules/fckeditor/">
</FCKeditorV2:FCKeditor>
</div>
<div class="clear10px"></div>
<div class="smallleft"></div><div class="smallrightHeight AdminCP">
<div class="btn">
    <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" 
        onclick="uiLinkButtonUpdate_Click" ValidationGroup="UpdateBlocks">Update</asp:LinkButton>
    </div>
    
    <div class="btn">
    <asp:LinkButton ID="uiLinkButtonCancel" runat="server" 
            onclick="uiLinkButtonCancel_Click">Cancel</asp:LinkButton>
    </div>
    </div>
    <div class="clear10px"></div>
    </asp:Panel>
</asp:Content>
