<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Admin.Master" AutoEventWireup="true" CodeBehind="EditGallery.aspx.cs" Inherits="WebApplication.Admin.EditGallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="AdminDiv">
    <div>
<h4>
        Edit Gallery</h4></div>
        
        <div class="AdminLeft">
            Category</div>
        <div class="AdminMiddle">
            <asp:DropDownList ID="uiDropDownListCats" runat="server" AutoPostBack="True" width="155"
                onselectedindexchanged="uiDropDownListCats_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div style="float: left; ">
            </div>
        <div class="clear5">
        </div>        
        <div class="AdminLeft">
            Title</div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxTitle" runat="server" ValidationGroup="UpdateGallery"></asp:TextBox></div>
        <div style="float: left; ">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                ControlToValidate="uiTextBoxTitle" ForeColor="#C76E1F" ValidationGroup="UpdateGallery"></asp:RequiredFieldValidator></div>
        <div class="clear5">
        </div>        

        <div class="AdminLeft">
            Choose Photo</div>
        <div class="AdminMiddle">
            <asp:FileUpload ID="uiFileUploadPhoto" runat="server" /></div>
        <div style="float: left; ">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                ControlToValidate="uiFileUploadPhoto" ForeColor="#C76E1F" ValidationGroup="UpdateGallery"></asp:RequiredFieldValidator></div>
        <div class="clear5">
        </div>        
        <div class="AdminLeft" style="width: 105px">
            &nbsp;</div>
        <div class="AdminMiddle AdminCP">
            <div class="SearchBtn" style="float:left;">
                <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" OnClick="uiLinkButtonUpdate_Click"
                    ValidationGroup="UpdateGallery" style="width:80px;"> Add Photo</asp:LinkButton>
            </div>
            
        </div>
        <div class="clear5">
        </div>


        <div align="center">
								<asp:DataList ID="uiDataListPhotos" runat="server" 
                                    HorizontalAlign="Center" RepeatColumns="4" RepeatDirection="Horizontal" 
                                    onitemcommand="uiDataListPhotos_ItemCommand">
                                    <ItemTemplate>
                                    <asp:ImageButton ID="uiButtonDelete" runat="server" CommandArgument='<%# Eval("ProductID") %>' Text="Delete" OnClientClick="return confirm('Are you want to delete this photo?');" CommandName="Delete" ForeColor="#000099" ImageUrl="~/images/action_delete.gif" AlternateText="Delete image" ImageAlign="Middle" style="float:right;" />
                                    <br />
                                    <a href='<%# Eval("PicPath") %>' rel="lightbox[chiledranroom]"><img src='../images.aspx?Inner=photo&Image=<%# Eval("PicPath") %>' alt="4" width="150" height="110"></a> 
                                    </ItemTemplate>
                                </asp:DataList>
        </div>
        </div>
</asp:Content>
