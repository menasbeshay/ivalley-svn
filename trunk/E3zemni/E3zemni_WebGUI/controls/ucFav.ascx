<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucFav.ascx.cs" Inherits="E3zemni_WebGUI.controls.ucFav" %>
<div class="widget">
	<h3 class="col-title"> Wishlist </h3>
	
    <asp:Repeater ID="uiRepeaterItems" runat="server" 
                onitemcommand="uiRepeaterItems_ItemCommand" 
                onitemdatabound="uiRepeaterItems_ItemDataBound">
            <ItemTemplate>
                    <li class="clearfix">
			<a class="post-thumbnail" href='../viewCard.aspx?cid=<%# Eval("CardID")%>'><asp:Image runat="server" width="60" height="60" id="uiImageMain"/></a>
			<h5><a href='../viewCard.aspx?cid=<%# Eval("CardID")%>'>
                <asp:Label ID="uiLabelName" runat="server" ></asp:Label></a></h5>
			<span class="rating">
            <asp:LinkButton ID="uiLinkButtonRemove" runat="server" CssClass="pull-right" CommandArgument='<%# Eval("UserFavoritesID") %>'><i class="fa fa-times fa-fw"></i></asp:LinkButton></span>    
            </span>			
		</li>
                    
            </ItemTemplate>
           
            </asp:Repeater>   
            <asp:Literal Text="no items in wishlist." runat="server" ID ="uiLiteralNoItems" 
                Visible="False"/> 
</div>