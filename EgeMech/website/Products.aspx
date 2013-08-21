<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Inner.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="website.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain">
       <asp:Panel ID="uiPanelRepeaters" runat="server">
        <asp:Repeater ID="uiRepeaterCats" runat="server">
            <HeaderTemplate>
                <div style="padding: 5px; margin: 5px;">
                <h2>
                Product Categories
                </h2>
                <div class="clear5"></div>
            <ul></HeaderTemplate>
            <ItemTemplate>                
                    <li><a href='products.aspx?cid=<%# Eval("CategoryID") %>' ><%# Eval("Name") %></a></li>                
            </ItemTemplate>
            <FooterTemplate>
                </ul>
                </div>
                </FooterTemplate>
        </asp:Repeater>
        <asp:Repeater ID="uiRepeaterSubCats" runat="server">
            <HeaderTemplate>
                <div style="padding: 5px; margin: 5px;">
                    <h2>
                        Product Sub-Categories
                    </h2>
                    <div class="clear5">
                    </div>
                    <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li><a href='products.aspx?cid=<%# Eval("CategoryID") %>&scid=<%# Eval("SubCategoryID") %>'>
                    <%# Eval("Name") %></a></li>
            </ItemTemplate>
            <FooterTemplate>
                </ul> </div>
            </FooterTemplate>
        </asp:Repeater>
        <asp:Repeater ID="uiRepeaterProducts" runat="server">
            <HeaderTemplate>
                <div style="padding: 5px; margin: 5px;">
                    
                    <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                
                <a href='products.aspx?cid=<%# Eval("CategoryID") %>&scid=<%# Eval("SubCategoryID") %>&pid=<%# Eval("ProductID") %>'>
                    <img src='Images.aspx?Inner=product&Image=<%# Eval("PicPath") %>' />    <%# Eval("Name") %></a></li>
            </ItemTemplate>
            <FooterTemplate>
                </ul> </div>
            </FooterTemplate>
        </asp:Repeater>
       </asp:Panel>
       <asp:Panel ID="uiPanelDetails" runat="server">
           <div style="clear: both; height: 10px;">
           </div>
           <div class="ContentLeftDiv">
               <h1>
                   <asp:Label ID="uiLabelTitle" runat="server"></asp:Label></h1>
               <div style="clear: both; height: 10px;">
               </div>
               <asp:image id="uiImageProd" runat="server" />
               <div style="clear:both;height:10px;"></div>
               <div class="Details675">
                   <asp:Label ID="uiLabelPrice" runat="server"></asp:Label>
                   <div style="clear: both; height: 5px;">
                   </div>
                   <asp:Literal ID="uiLiteralDescription" runat="server"></asp:Literal>
                   <div style="clear: both; height: 5px;">
                   </div>

               </div>
           </div>
       </asp:Panel>
    </div>
</asp:Content>
