<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMenu.ascx.cs" Inherits="E3zemni_WebGUI.ar.controls.ucMenu" %>
<nav>
							<ul class="sf-menu">
								<li id="homeItem"><a href="default.aspx">الرئيسية</a>
									
								</li>

                                <asp:Literal ID="uiLiteralmenu" runat="server"></asp:Literal>   								
								
                                <li id="Li1"><a href="page.aspx?PID=1">عن الموقع</a></li>
								<li id="contactItem"><a href="page.aspx?PID=2">اتصل بنا</a></li>
							</ul><!-- end menu -->
						</nav>