<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="website.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="http://www.google.com/jsapi" type="text/javascript"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true">
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="padding-left:40px;">
    <table border="0" width="96%" cellspacing="0" cellpadding="0">
        <tr>
            <td height="50" valign="bottom">
                
                    <a class="pro_main" href="?view=ho">&gt; Head Office</a>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="uiPanelHO" runat="server" Visible="false">
                    <p class="content_black">
                        <span style="font-weight: 400">
                        <asp:Literal ID="uiLiteralHOContent" runat="server"></asp:Literal>
                        </span>
                        </p>
                    <p class="content_black">
                        <img border="0" src="images/view-map-icon.png"> &nbsp;<a href="#?custom=true&width=400&height=400" rel="prettyphoto">View Map</a>
                    </p>
                    <asp:Literal ID="uiLiteralHOscript" runat="server"></asp:Literal>
                    <script type="text/javascript">

                        $(document).ready(function () {
                            $("a[rel^='prettyPhoto']").prettyPhoto({
                                custom_markup: '<div id="map_canvas" style="width:400px; height:405px"></div>',
                                changepicturecallback: function () { initializeHead(); },
                                social_tools: false, description: false
                            });
                        });
                    </script>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
               
                    <a class="pro_main" href="?view=f">&gt; 
									Factory</a>
                                    
            </td>
        </tr>
        
        <tr>
            <td>
            <asp:Panel ID="uiPanelFactory" runat="server" Visible="false">
                <asp:Literal ID="uiLiteralFactScript" runat="server"></asp:Literal>
                <p class="content_black">
                    <span style="font-weight: 400">
                    <asp:Literal ID="uiLiteralFactoryContent" runat="server"></asp:Literal>
                    </span>
                    </p>
                <p class="content_black">
                    <img border="0" src="images/view-map-icon.png">
                    &nbsp;<a href="#?custom=true&width=400&height=400" rel="prettyphoto">View Map</a>
                    </p>
                
                <script type="text/javascript">
        
        $(document).ready(function () {
            $("a[rel^='prettyPhoto']").prettyPhoto({
                custom_markup: '<div id="map_canvas" style="width:400px; height:405px"></div>',
                changepicturecallback: function () { initializeFact(); },
                social_tools: false, description: false
            });
        });
                </script>
                
            </asp:Panel>
            </td>
        </tr>        
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <a class="pro_main" href="?view=s">&gt; Showrooms</a>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="uiPanelShowrooms" runat="server" Visible="false">
                    <p class="content_black">
                        If you have any inquiries regarding a product you have purchased from any of Mehrez
                        + Krema’s showrooms, please direct your inquiries to the showroom from where you’ve
                        purchased the product.                        
                        </p>
                    
                    <asp:Repeater ID="uiRepeaterRooms" runat="server" 
                        onitemdatabound="uiRepeaterRooms_ItemDataBound">
                        
                    <ItemTemplate>
                       
                        <p class="content_black" style="width: 80%; background-color: #C1B6B3">
                            &nbsp; <%# Eval("Title") %>:</p>
                        <ul>
                            <li>
                        <p class="content_black">
                            <span style="font-weight: 400">
                                <%# Eval("Content") %>
                            </span>
                        </p>
                        <p class="content_black">
                        <img border="0" src="images/view-map-icon.png"> &nbsp; <asp:Literal ID="uiLiteralLink" runat="server"></asp:Literal>
                        </p>
                        </li>
                        </ul>
                        <asp:Literal ID="uiLiteralScripts" runat="server"></asp:Literal>
                    </ItemTemplate>
                    </asp:Repeater>                    
                </asp:Panel>
            </td>
        </tr>
       
    </table>
    </div>
</asp:Content>

