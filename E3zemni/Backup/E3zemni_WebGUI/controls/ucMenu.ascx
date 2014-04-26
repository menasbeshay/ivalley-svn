<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMenu.ascx.cs" Inherits="E3zemni_WebGUI.controls.ucMenu" %>
<nav>
							<ul class="sf-menu">
								<li id="homeItem"><a href="../default.aspx">Home</a>
									
								</li>

                                <asp:Literal ID="uiLiteralmenu" runat="server"></asp:Literal>   								
								
                                <li id="Li1"><a href="#">About us</a></li>
								<li id="contactItem"><a href="#">Contact</a></li>
							</ul><!-- end menu -->
						</nav>