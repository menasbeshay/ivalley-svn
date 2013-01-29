<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sponsors.ascx.cs" Inherits="GlobalLogistics.WebSite.Controls.Sponsors" %>
<!-- Sponsers -->
<asp:Panel ID="EnPanel" runat="server">
                <div class="ContentLeftDiv">
                <h1>
                    sponsers</h1>
                <div class="Details675">
                    <marquee>
                        	<div class="SponsorsDiv" id="SponsorsDivEn" runat="server">
                            
                            <asp:Repeater ID="uiRepeaterEn" runat="server">
                            <ItemTemplate>
                            <a href='<%# Eval("URL") %>' >
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("EnFilePath") %>' BorderWidth="0"></asp:Image></a>
                            </ItemTemplate>
                            </asp:Repeater>
                            
                            </div></marquee>
                    <div class="clear">
                    </div>
                </div>
            </div>
             </asp:Panel>
<asp:Panel ID="ArPanel" runat="server">
  <div class="ContentLeftDiv">
                	<h1>الرعاة</h1>
                    <div class="Details675">
                    	<marquee direction="left">
                        	<div class="SponsorsDiv" id="SponsorsDivAr" runat="server">
                            
                            <asp:Repeater ID="uiRepeaterAr" runat="server">
                            <ItemTemplate>
                            <a href='<%# Eval("URL") %>' >
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ArFilePath") %>' BorderWidth="0" ></asp:Image></a>
                            </ItemTemplate>
                            </asp:Repeater>
                            </div>
                        </marquee>
                        <div class="clear"></div>
                    </div>
                </div>
 </asp:Panel>
