<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/EnSite.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="WebApplication.en.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
<link href="../css/prettyPhoto.css" rel="stylesheet" type="text/css" />
    <link href="../css/template.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery.mixitup.js" type="text/javascript"></script>
    <script src="../js/jquery.prettyPhoto.js" type="text/javascript"></script>    
    <script type="text/javascript">
        $(document).ready(function () {
            $('#Grid').mixitup();
            $("a[rel^='prettyPhoto']").prettyPhoto({
                social_tools: false
            });
        }); 
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="clear" style="height:10px;"></div>
    <asp:Repeater ID="uiRepeaterCats" runat="server">
    <HeaderTemplate><div class="controls"> <ul>
    <li class="filter button anim150 active" data-filter='all'>All Categories</li>
    </HeaderTemplate>
    <FooterTemplate></ul></div></FooterTemplate>
    <ItemTemplate>
    
    <li class="filter button anim150" data-filter='<%# "category_" + Eval("ID").ToString() %>'><%# Eval("CategoryName") %></li>
    
    </ItemTemplate>
    </asp:Repeater>
    <div class="clear"></div>
    <asp:Repeater ID="uiRepeaterGallery" runat="server">
    <HeaderTemplate><ul id="Grid">
    </HeaderTemplate>
    <ItemTemplate>
        <li class='mix <%# "category_" + Eval("CategoryID").ToString() %>' data-name='<%# Eval("ProductName") %>' >
        <a href='<%# Eval("PicPath") %>' rel="prettyPhoto" > <img src='../Images.aspx?Inner=photo&Image=<%# Eval("PicPath") %>' /></a>
        </li>
    </ItemTemplate>
    <FooterTemplate>
    </ul>
    </FooterTemplate>
    </asp:Repeater>

   
</asp:Content>
