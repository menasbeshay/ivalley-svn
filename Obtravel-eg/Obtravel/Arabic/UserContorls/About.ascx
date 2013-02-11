<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="About.ascx.cs" Inherits="Obtravel.Arabic.UserContorls.About" %>
<div class="about">
              	  <h2><asp:Literal ID="uiLiteralTitle" runat="server"></asp:Literal></h2>	
                 <asp:Image ID="uiImageBlock" runat="server" CssClass="img"  />
                  <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
			  	  <div class="clear10px"></div>
                  <div class="btn2"><asp:HyperLink ID="uiHyperLinkAbout" NavigateUrl="~/Arabic/AboutUs.aspx" runat="server">قراءة المزيد</asp:HyperLink></div>
                  <div class="clear"></div>
              </div>