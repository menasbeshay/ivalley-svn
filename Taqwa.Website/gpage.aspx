<%@ Page Title="" Language="C#" MasterPageFile="~/ZahraaAr.Master" AutoEventWireup="true" CodeBehind="gpage.aspx.cs" Inherits="Taqwa.Website.gpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="clear:both; height:10px;"></div>
    <div class="mainContent col-lg-12 row" >
<h2>
    <asp:Literal ID="uiLiteralTitle" runat="server"></asp:Literal>
</h2>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
</div>

<div class="clear"></div>

<div class="products shop clearfix mbf">
    <asp:Repeater ID="uiRepeaterPhoto" runat="server">
    <ItemTemplate>
        <div class="product grid_4">
        <a href='<%# Eval("PicPath") %>' data-gal="lightbox[folio]">
		<img class="product_img" src='<%# Eval("PicPath") %>' alt=""><!-- featured thumbnail -->
		<img class="product_img_hover" src='<%# Eval("PicPath") %>' alt=""><!-- featured thumbnail hover -->	
        </a>	
		<div class="product_inner">
			<h3> <a href="#"> <%# Eval("ArTitle") %></a> </h3>
			<div class="clearfix">				
				
			</div>
		</div>
		
	</div>
    </ItemTemplate>
    </asp:Repeater>
    
</div>
</div>
</asp:Content>
