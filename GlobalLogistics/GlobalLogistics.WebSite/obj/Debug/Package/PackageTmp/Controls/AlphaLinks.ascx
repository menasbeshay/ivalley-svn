<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AlphaLinks.ascx.cs" Inherits="GlobalLogistics.WebSite.Controls.AlphaLinks" %>

<asp:Repeater runat="server" ID="__theAlphalink" OnItemDataBound="DisableSelectedLink">
<ItemTemplate>
	<asp:LinkButton runat="server" ID="link" 
		text="<%# Container.DataItem %>"
		CommandName="Filter"
		CommandArgument='<%# DataBinder.Eval(Container, "DataItem")%>'
		OnCommand="Select"
		 />&nbsp;
</ItemTemplate>
</asp:Repeater>