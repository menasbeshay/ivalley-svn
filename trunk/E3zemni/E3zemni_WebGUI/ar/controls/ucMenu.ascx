<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMenu.ascx.cs" Inherits="E3zemni_WebGUI.ar.controls.ucMenu" %>
<nav>
							<ul class="sf-menu">
								<li id="homeItem"><a href="default.aspx">الرئيسية</a>
									
								</li>

                                <asp:Literal ID="uiLiteralmenu" runat="server"></asp:Literal>   								
								
                                <li id="Li1"><a href="#">عن الموقع</a></li>
								<li id="contactItem"><a href="#">اتصل بنا</a></li>
							</ul><!-- end menu -->
						</nav>