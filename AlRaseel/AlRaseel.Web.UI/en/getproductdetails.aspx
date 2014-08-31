<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getproductdetails.aspx.cs" Inherits="Web.UI.en.getproductdetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="grid-container parallax-content">
                    <!-- parallax header -->
                    <div class="grid-70 prefix-15 mobile-grid-100 tablet-grid-100" style="margin-top: 65px;">
                        <header class="parallax-header pt-style-2">
                            <h2 class="parallax-title" style=""><span>
                                <asp:Literal ID="lblProductTitle" runat="server" /></span></h2>
                            <p class="parallax-content" style="">
                                <asp:Literal ID="lblProductFullDescrition" runat="server" />
                            </p>
                        </header>
                    </div>
                    <!-- close parallax header -->
                    <div class="clear"></div>
                </div>
                <div class="grid-container section-content">
                    <!-- contact wrap -->
                    <div class="grid-100 mobile-grid-100 tablet-grid-100">
                        <div class="contact-wrap">
                            <!-- contact message -->
                            <asp:Repeater ID="dlAlbums" runat="server" OnItemDataBound="dlAlbums_ItemDataBound">
                                <ItemTemplate>
                                    <div class="grid-30 mobile-grid-100 tablet-grid-100 " style="float: left;">
                                        <div class="ut-left-footer-area clearfix" style="width: 100%;">
                                            <div id="divAlbumImages">
                                                <header class="parallax-header pt-style-2">

                                                    <h3 class="parallax-title" style=""><span>
                                                        <asp:Literal ID="lblAlbumTitle" Text='<%# Eval("Title") %>' runat="server" /></span></h3>

                                                    <p class="parallax-content" style="">
                                                        <asp:Literal ID="lblAlbumDescription" Text='<%# Eval("AlbumDescription") %>' runat="server" />
                                                    </p>
                                                </header>
                                                <asp:Label ID="lblAlbumId" Text='<%# Eval("Id") %>' Visible="false" runat="server" />
                                                <div id="divAlbums_<%# Container.ItemIndex  %>" style="margin: 0 auto; text-align: center; width: 70%; direction: ltr;">
                                                    <div title='<%# Eval("Title") %>'>

                                                        <asp:Repeater ID="dlImages" runat="server">
                                                            <ItemTemplate>
                                                                <a href="../Files/Products/<%# Eval("ImageFile") %>" data-thumbnail="Files/Products/<%# Eval("ImageFile") %>" data-description="" title=""></a>
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
                        </div>
                    </div>
                    <!-- close contact wrap -->
                </div>
    </form>
</body>
</html>
