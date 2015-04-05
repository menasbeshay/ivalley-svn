<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/General.Master" AutoEventWireup="true" CodeBehind="ManageCats.aspx.cs" Inherits="brotherssolidarity.Admin.ManageCats" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid">
        <div class="span12 ">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-sitemap"></i>Products Categories</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a class="icon-remove" href="javascript:;"></a>
                    </span>
                </div>
                <div class="widget-body">
                    <div class="row-fluid">
                        <div class="span4">
                            <asp:LinkButton ID="uiLinkButtonAddParentCat" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonAddParentCat_Click">Add root category</asp:LinkButton>
                            <div class="clearfix" style="height:20px;"></div>
                            <span style="border-bottom:1px solid #ccc;padding:5px;">Categories</span>
                            <asp:TreeView ID="uiTreeViewCats" runat="server" ExpandDepth="0" style="margin-top:10px;" ShowLines="True"></asp:TreeView>
                        </div>
                        <div class="span8">
                            <asp:Panel ID="uiPanelEdit" runat="server" Visible="false">
                            <div class="span12 clearfix">
                                <div class="span4 pull-right">
                                    <asp:LinkButton ID="uiLinkButtonAddSubCat" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonAddSubCat_Click">Add sub category</asp:LinkButton></div>
                                <div class="span4"></div>
                            </div>
                            <div class="span12 clearfix">
                                <div class="span2">Name</div>
                                <div class="span4">
                                    <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="addcat"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="uiTextBoxName" ValidationGroup="addcat"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="span12 clearfix">
                                <div class="span2">Description</div>
                                <div class="span4">
                                    <asp:TextBox ID="uiTextBoxDesc" runat="server"></asp:TextBox></div>
                            </div>
                            <div class="span12 clearfix">
                                <div class="span2">
                                    Image
                                </div>
                                <div class="span4">
                                    <asp:FileUpload ID="uiFileUploadImg" runat="server" />
                                    
                                </div>
                                <div class="span2">
                                    <asp:Image ID="uiImageMain" runat="server" />
                                </div>
                            </div>
                            <div class="span12 clearfix">
                                <div class="span2">
                                    <asp:LinkButton ID="uiLinkButtonSave" runat="server" ValidationGroup="addcat" CssClass="btn btn-primary" OnClick="uiLinkButtonSave_Click">Save</asp:LinkButton>
                                </div>
                                <div class="span2">
                                    <asp:LinkButton ID="uiLinkButtonCancel" runat="server"  CssClass="btn btn-primary" OnClick="uiLinkButtonCancel_Click">Cancel</asp:LinkButton>
                                </div>
                                <div class="span4">
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server"  CssClass="btn btn-primary" OnClick="uiLinkButtonDelete_Click">Delete</asp:LinkButton>
                                </div>
                            </div>
                            </asp:Panel>
                        </div>
                       
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>
