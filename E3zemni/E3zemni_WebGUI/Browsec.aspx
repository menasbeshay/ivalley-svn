<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/All.Master" AutoEventWireup="true" CodeBehind="Browsec.aspx.cs" Inherits="E3zemni_WebGUI.Browsec" %>

<%@ MasterType VirtualPath="~/MasterPages/All.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script src="js/purl.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div class="row clearfix mbs">
        <div class="grid_12">
            <div class="products shop clearfix mbf">
                <asp:Repeater ID="uiRepeaterCats" runat="server"
                    onitemdatabound="uiRepeaterCats_ItemDataBound">
                    <ItemTemplate>
                         <div class="product grid_3">
                             <asp:HyperLink ID="uiHyperLinkCat1st" runat="server" >
                                 <asp:Image ID="uiImageProduct" CssClass="product_img" runat="server" />                                
                                <img class="product_img_hover" src='<%# Eval("HoverImage") %>' alt=""><!-- featured thumbnail hover -->
                             </asp:HyperLink>              
                    <div class="product_inner">
                        <h3>
                        <asp:HyperLink ID="uiHyperLinkCat2nd" runat="server" >                        
                        </asp:HyperLink>                           
                        </h3>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="clear" style="height: 5px;">
                </div>
                <div class="pagination-tt clearfix">
                    <ul>
                        <li>
                            <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click"
                                Font-Bold="True" Font-Size="Medium"><i class="arrow_left"></i> Prev</asp:LinkButton>
                        </li>
                        <li>
                            <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click"
                                Font-Bold="True" Font-Size="Medium"> Next <i class="arrow_right"></i></asp:LinkButton>
                        </li>
                    </ul>
                </div>
                <!-- pagination -->
            </div>
        </div>       
    </div>
</asp:Content>
