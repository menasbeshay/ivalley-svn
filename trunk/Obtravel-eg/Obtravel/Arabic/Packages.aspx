<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARBannerMaster.Master" AutoEventWireup="true" CodeBehind="Packages.aspx.cs" Inherits="Obtravel.Arabic.Packages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>
        رحلات سياحية </h1>
    <div class="clear10px">
    </div>
    <div class="right" style="width:100%">
    <asp:Panel ID="uiPanelAllLists" runat="server">
        <asp:Repeater ID="uiRepeaterCurrentLists" runat="server" 
            onitemcommand="uiRepeaterCurrentLists_ItemCommand">
            <HeaderTemplate>
                <div class="services">
                    <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <div class="img Tourism">
                        <asp:LinkButton ID="uiLinkButtonViewimage" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="ViewSubPackages">
                        <asp:Image ID="uiImageTourismList" runat="server" ImageUrl='<%# Eval("arImagePath") %>' />
                        </asp:LinkButton> </div>
                    <div class="serv_data" style="width:70%">
                        <h4><asp:LinkButton ID="uiLinkButtonViewTitle" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="ViewSubPackages" CssClass="title"> 
                            <%# Eval("arPackageName") %>
                            </asp:LinkButton>
                            </h4>
                        <%# Server.HtmlDecode(Eval("arContent").ToString()) %>
                        <div>
                            <div class="btn">
                               <asp:LinkButton ID="uiLinkButtonView" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="ViewSubPackages">الرحلات المتاحة</asp:LinkButton>
                            </div>                            
                        </div>
                    </div>
                    
                    <div class="clear">
                    </div>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul> </div></FooterTemplate>
        </asp:Repeater>
    </asp:Panel>
    </div>
</asp:Content>
