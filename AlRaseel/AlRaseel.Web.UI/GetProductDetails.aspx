<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetProductDetails.aspx.cs" Inherits="Web.UI.GetProductDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .productTitle {
        }

        .pp_expand {
            display: none !important;
        }

        .pp_details {
            background: #a4a4a4;
            margin: 0px !important;
            padding-bottom: 7px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="grid-container parallax-content">


            <!-- parallax header -->
            <div class="grid-70 prefix-15 mobile-grid-100 tablet-grid-100" style="margin-top: -50px;">
                <header class="parallax-header pt-style-2">

                    <h2 class="parallax-title" style="font-family: 'Droid Arabic Kufi'!important; background: #7e2e30;"><span>
                        <asp:Literal ID="lblProductTitle" runat="server" /></span></h2>

                    <p class="parallax-content" style="font-family: 'Al-Jazeera-Arabic-Regular' !important;">
                        <asp:Literal ID="lblProductFullDescrition" runat="server" />
                    </p>
                </header>

            </div>
            <!-- close parallax header -->

            <div class="clear"></div>


        </div>
        <div class="grid-container parallax-content">

            <!-- contact wrap -->
            <div class="grid-100 mobile-grid-100 tablet-grid-100" style="margin-left:-30px;width:105%;">
                <%--<div class="contact-wrap" style="margin-top: -40px;">--%>
                    <!-- contact message -->
                    <asp:Repeater ID="dlAlbums" runat="server" OnItemDataBound="dlAlbums_ItemDataBound">
                        <ItemTemplate>

                            <div class="grid-22 mobile-grid-100 tablet-grid-100 " style="float: left; margin-bottom:15px;">
                                <div class="ut-left-footer-area clearfix" style="font-family: 'Al-Jazeera-Arabic-Regular' !important; width: 100%;">

                                    <div id="divAlbumImages">
                                        <header class="parallax-header pt-style-2">

                                            <h3 class="parallax-title" style="font-family: 'Droid Arabic Kufi'!important;"><span>
                                                <asp:Literal ID="lblAlbumTitle" Text='<%# Eval("Title") %>' runat="server" /></span></h3>

                                            <p class="parallax-content" style="font-family: 'Al-Jazeera-Arabic-Regular' !important;">
                                                <asp:Literal ID="lblAlbumDescription" Text='<%# Eval("AlbumDescription") %>' runat="server" />
                                            </p>
                                        </header>
                                        <asp:Label ID="lblAlbumId" Text='<%# Eval("Id") %>' Visible="false" runat="server" />
                                        <div id="divAlbums_<%# Container.ItemIndex  %>" style="margin: 0 auto; text-align: center; width: 85%; direction: ltr;">
                                            <div title='<%# Eval("Title") %>'>

                                                <asp:Repeater ID="dlImages" runat="server">
                                                    <ItemTemplate>

                                                        <%--                                                                    <a class="fancy" rel="galleryname" href="Files/Products/<%# Eval("ImageFile") %>">
                                                                    <img src="Files/Products/<%# Eval("ImageFile") %>" width="450" height="450">
                                                                </a>--%>

                                                        <a href="Files/Products/<%# Eval("ImageFile") %>" data-thumbnail="Files/Products/<%# Eval("ImageFile") %>" data-description="" title=""></a>

                                                    </ItemTemplate>

                                                </asp:Repeater>


                                            </div>
                                        </div>

                                        <script type="text/javascript">
                                            jQuery(document).ready(function () {
                                                jQuery('#divAlbums_<%# Container.ItemIndex  %>').fancygallery({
                                                            navigation: 'pagination',
                                                            albumSelection: 'thumbnails',
                                                            thumbnailSelectionOptions: { layout: 'polaroid' },
                                                            showOnlyFirstThumbnail: true
                                                        });
                                                    });

                                        </script>
                                    </div>
                                </div>

                            </div>



                        </ItemTemplate>

                    </asp:Repeater>

                    <div style="clear: both; height: 5px;"></div>
                <%--</div>--%>

            </div>
            <!-- close contact wrap -->


        </div>
        <!-- close container -->

    </form>
</body>
</html>
