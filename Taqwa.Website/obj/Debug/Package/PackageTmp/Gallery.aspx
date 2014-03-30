<%@ Page Title="" Language="C#" MasterPageFile="~/ZahraaAr.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Taqwa.Website.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%-- <link href="styles/flickrGallery-large.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-ui-personalized-1.6rc2.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.flickr-1.0.js" type="text/javascript"></script>
    <script src="Scripts/jquery.flickrGallery-1.0.2.js" type="text/javascript"></script>--%>
   <%-- <link  href="css/camera.css" rel="stylesheet" type="text/css" />--%>
 <%--   <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>--%>
    <script src="js/modernizr.custom.js" type="text/javascript"></script>
    <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="Scripts/jquery.prettyPhoto.js" type="text/javascript"></script>
    <script src="Scripts/jquery.isotope.min.js" type="text/javascript"></script>
    <%--<script src="js/camera.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        $().ready(function () {

            $("#menuItemGallery").addClass("current");
            /* $('#Gallery').flickrGallery({
            galleryHeight: 450
            });*/
            /* $('#camera_wrap_4').camera({
            height: 'auto',
            loader: 'bar',
            pagination: false,
            thumbnails: false,
            hover: false,
            opacityOnGrid: false,
            imagePath: 'placeholders/'
            
            });*/

            $.Isotope.prototype._getCenteredMasonryColumns = function () {
                this.width = this.element.width();

                var parentWidth = this.element.parent().width();

                // i.e. options.masonry && options.masonry.columnWidth
                var colW = this.options.masonry && this.options.masonry.columnWidth ||
                // or use the size of the first item
                  this.$filteredAtoms.outerWidth(true) ||
                // if there's no items, use size of container
                  parentWidth;

                var cols = Math.floor(parentWidth / colW);
                cols = Math.max(cols, 1);

                // i.e. this.masonry.cols = ....
                this.masonry.cols = cols;
                // i.e. this.masonry.columnWidth = ...
                this.masonry.columnWidth = colW;
            };

            $.Isotope.prototype._masonryReset = function () {
                // layout-specific props
                this.masonry = {};
                // FIXME shouldn't have to call this again
                this._getCenteredMasonryColumns();
                var i = this.masonry.cols;
                this.masonry.colYs = [];
                while (i--) {
                    this.masonry.colYs.push(0);
                }
            };

            $.Isotope.prototype._masonryResizeChanged = function () {
                var prevColCount = this.masonry.cols;
                // get updated colCount
                this._getCenteredMasonryColumns();
                return (this.masonry.cols !== prevColCount);
            };

            $.Isotope.prototype._masonryGetContainerSize = function () {
                var unusedCols = 0,
        i = this.masonry.cols;
                // count unused columns
                while (--i) {
                    if (this.masonry.colYs[i] !== 0) {
                        break;
                    }
                    unusedCols++;
                }

                return {
                    height: Math.max.apply(Math, this.masonry.colYs),
                    // fit container to columns that have been used;
                    width: (this.masonry.cols - unusedCols) * this.masonry.columnWidth
                };
            };


            $(function () {

                var $container = $('#container');

                $container.isotope({
                    itemSelector: '.element',
                    masonry: {
                        columnWidth: 295
                    }
                });


                var $optionSets = $('#options .option-set'),
          $optionLinks = $optionSets.find('a');

                $optionLinks.click(function () {
                    var $this = $(this);
                    // don't proceed if already selected
                    if ($this.hasClass('selected')) {
                        return false;
                    }
                    var $optionSet = $this.parents('.option-set');
                    $optionSet.find('.selected').removeClass('selected');
                    $this.addClass('selected');

                    // make option object dynamically, i.e. { filter: '.my-filter-class' }
                    var options = {},
            key = $optionSet.attr('data-option-key'),
            value = $this.attr('data-option-value');
                    // parse 'false' as false boolean
                    value = value === 'false' ? false : value;
                    options[key] = value;
                    if (key === 'layoutMode' && typeof changeLayoutMode === 'function') {
                        // changes in layout modes need extra logic
                        changeLayoutMode($this, options)
                    } else {
                        // otherwise, apply new options
                        $container.isotope(options);
                    }

                    return false;
                });
            });

            /* =========================================================
            **************************prettyPhoto***********************
            ==========================================================*/
            $(window).load(function () {
                $("a[rel^='prettyPhoto']").prettyPhoto({
                    overlay_gallery: false,
                    "theme": 'light_rounded',
                    keyboard_shortcuts: true,
                    social_tools: false
                });
            });
        });

</script>

<style type="text/css">

/*#largeImageWrap { background:url(images/ajax-loader.gif) center 65px no-repeat; }*/

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-12 row">
        <div class="clearfix" style="height:10px;"></div>
        <h3>
            معرض الصور
        </h3>
        <div style="display:none;">
        <div class="AdminLeft">
            <asp:Label ID="Label2" runat="server" CssClass="Label" 
                Text="إختر القسم  :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:DropDownList ID="uiDropDownListCat" runat="server" AutoPostBack="True" 
                onselectedindexchanged="uiDropDownListCat_SelectedIndexChanged" Width="400px">
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
            &nbsp;
        </div>
        <div class="clear"></div>
        </div>
    
        
        <asp:Repeater ID="uiRepeaterCats" runat="server">
        <HeaderTemplate>
        <div id="options" class="clearfix col-lg-12">
                        <ul id="filters" class="option-set clearfix" data-option-key="filter">
                            <li><a href="#filter" data-option-value="*" class="selected" >جميع الأقسام</a></li>
        </HeaderTemplate>
        <ItemTemplate>        
                            <li><a href="#filter" data-option-value='.<%# Eval("displayname").ToString().Trim() %>'><%# Eval("ArTitle")%></a></li>                            
        </ItemTemplate>
        <FooterTemplate>
         </ul><!--end:filters-->
                    </div>
        </FooterTemplate>
        </asp:Repeater>
        <hr  style="width:50%" class="centered"/>

        <asp:Repeater ID="uiRepeaterPhotos" runat="server">
            <HeaderTemplate>
            <ul id="container" class="clickable cs-style-5 grid clearfix col-12">
    
           <%-- <div id="Gallery">
                <ul id="thumbs_1" class="thumbs">--%>
            </HeaderTemplate>
            <ItemTemplate>
            <li class='element <%# Eval("displayname") %>'>
                      <figure>
                          <img src='<%# Eval("PhotoPath") %>' alt='<%# Eval("ArTitle") %>' />
                          <figcaption>
                          <h3><a href="#"><%# Eval("ArTitle") %></a></h3>
                          <footer>
                                    <a class="border-line-btn white-btn link-gallery" href='<%# Eval("PhotoPath") %>' rel="prettyPhoto[flx-gallery-photo]">View</a>                                    
                                </footer>
                            </figcaption>
                        </figure>
                        </li>

            
                <%--<li><img src='<%# Eval("PhotoPath") %>' title='<%# Eval("ArTitle") %>' alt='<%# Eval("ArTitle") %>' width="300" /></li>--%>
            </ItemTemplate>
            <FooterTemplate>
                <%--</ul>
                </div>--%>
                 </ul>
                
<div class="clear"></div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
