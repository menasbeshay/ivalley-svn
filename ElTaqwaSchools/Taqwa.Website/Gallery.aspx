<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Taqwa.Website.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/flickrGallery-large.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-ui-personalized-1.6rc2.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.flickr-1.0.js" type="text/javascript"></script>
    <script src="Scripts/jquery.flickrGallery-1.0.2.js" type="text/javascript"></script>
    <script type="text/javascript">
        $().ready(function () {
            $('#Gallery').flickrGallery({
                galleryHeight: 450
            });
        });

</script>

<style type="text/css">

#largeImageWrap { background:url(images/ajax-loader.gif) center 65px no-repeat; }

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent">
        <h3>
            معرض الصور
        </h3>
        <asp:Repeater ID="uiRepeaterPhotos" runat="server">
            <HeaderTemplate>
            <div id="Gallery">
                <ul id="thumbs_1" class="thumbs">
            </HeaderTemplate>
            <ItemTemplate>
                <li><img src='<%# Eval("PhotoPath") %>' title='<%# Eval("ArTitle") %>' alt='<%# Eval("ArTitle") %>' width="300" /></li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
