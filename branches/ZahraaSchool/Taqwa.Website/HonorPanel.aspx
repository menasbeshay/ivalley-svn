<%@ Page Title="" Language="C#" MasterPageFile="~/ZahraaAr.Master" AutoEventWireup="true" CodeBehind="HonorPanel.aspx.cs" Inherits="Taqwa.Website.HonorPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="clear:both; height:10px;"></div>
    <div class="mainContent col-lg-12 row" >
<h2>
    <asp:Literal ID="uiLiteralTitle" runat="server" Text="لوحة الشرف"></asp:Literal>
</h2>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    
<div class="products shop clearfix mbf">
    <asp:Repeater ID="uiRepeaterPhoto" runat="server">
    <ItemTemplate>
        <div class="product grid_3">
		<img class="product_img" src='<%# Eval("PicturePath") %>' alt=""><!-- featured thumbnail -->
		<img class="product_img_hover" src='<%# Eval("PicturePath") %>' alt=""><!-- featured thumbnail hover -->		
		<div class="product_inner">
			<h3> <a href="#"> <%# Eval("ArName") %></a> </h3>
			<div class="clearfix">				
				
			</div>
		</div>
		
	</div>
    </ItemTemplate>
    </asp:Repeater>
    
</div>
</div>
</div>
</asp:Content>
