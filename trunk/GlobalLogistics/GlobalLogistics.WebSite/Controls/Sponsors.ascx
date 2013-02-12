<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sponsors.ascx.cs" Inherits="GlobalLogistics.WebSite.Controls.Sponsors" %>
<!-- Sponsers -->
<div class="clear" style="height:20px;"></div>
<asp:Panel ID="EnPanel" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            $jScroller.add("#divScroll", "#<%= SponsorsDivEn.ClientID %>", "right", 6, true);
            $jScroller.start();
        });
    
    </script>
                <div class="ContentLeftDiv">
                <h1 style="background-image: url('images/title1000.png'); width: 985px;">
                    sponsers</h1>
                <div class="Details675" id="divScroll">
                    
                        	<div class="SponsorsDiv" id="SponsorsDivEn" runat="server">
                            
                            <asp:Repeater ID="uiRepeaterEn" runat="server">
                            <ItemTemplate>
                            <a href='<%# Eval("URL") %>' target="_blank">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("EnFilePath") %>' BorderWidth="0"></asp:Image></a>
                            </ItemTemplate>
                            </asp:Repeater>
                            
                            </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
             </asp:Panel>
<asp:Panel ID="ArPanel" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            $jScroller.add("#divScroll", "#<%= SponsorsDivAr.ClientID %>", "left", 6, true);
            $jScroller.start();
        });
    
    </script>
  <div class="ContentLeftDiv">
                	<h1 style="background-image: url('images/title1000.png');width:985px;">الرعاة</h1>
                    <div class="Details675" id="divScroll">
                    	
                        	<div class="SponsorsDiv" id="SponsorsDivAr" runat="server">
                            
                            <asp:Repeater ID="uiRepeaterAr" runat="server">
                            <ItemTemplate>
                            <a href='<%# Eval("URL") %>' target="_blank">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ArFilePath") %>' BorderWidth="0" ></asp:Image></a>
                            </ItemTemplate>
                            </asp:Repeater>
                            </div>
                       
                        <div class="clear"></div>
                    </div>
                </div>
 </asp:Panel>
