var car = {
	init: function(){
		this.portfolio.init();
	},
	portfolio: {
		data: {
		},
		init: function(){
			$('#portfolio-carousel').portfolio(car.portfolio.data);
		}
	}
}

$(function () { car.init(); });

$(document).ready(function () {

    

    $('#portfolio_grid .galleryContainer.customizable').jGalleryTree({
        animationType: 'flipInX', // Animations :  tada, swing, pulse, flipInX flipInY, fadeIn, bounceIn, rotateIn, rollIn
        openGalleryButton: 'a.open-gallery', //selector of the button to expand gallery
        galleryBackButton: 'a.gallery-back', //selector of the button to back to root gallery
        gridsContainer: '.galleryContainer>.gallery-grid', //selector of the parent of the grids
        subGallery: '.subgallery', //subgallery selector
        subGalleryGridsContainer: '.subgallery' //selector of the direct parent of the subgallery grids
    });

    $('.portfolio_grid .galleryContainer').slimScroll({
        railVisible: true,
        height: '300px',
        position: 'right'
    });

    $('.closePortfolio').click(function () {
        $('#portfolio_grid').fadeOut();
        $('#default_port').fadeIn();
        $('#port-text-def').fadeIn();
        $('#port-text-caption').fadeOut();
        $('#port-text-caption').html('');
    });

    $('.open-gallery').click(function () {
        $('#port-text-def').fadeOut();
        var content = $(this).next('.item-caption').html();
        $('#port-text-caption').html(content);
        $('#port-text-caption').fadeIn();
    });

    $('.gallery-back').click(function () {
        $('#port-text-caption').fadeOut();
        $('#port-text-def').fadeIn();        
        $('#port-text-caption').html('');
        
    });

    /***************************************/

    $('#testmon_grid .galleryContainer.customizable').jGalleryTree({
        animationType: 'flipInX', // Animations :  tada, swing, pulse, flipInX flipInY, fadeIn, bounceIn, rotateIn, rollIn
        openGalleryButton: 'a.open-gallery_test', //selector of the button to expand gallery
        galleryBackButton: 'a.gallery-back_test', //selector of the button to back to root gallery
        gridsContainer: '.galleryContainer>.gallery-grid', //selector of the parent of the grids
        subGallery: '.subgallery', //subgallery selector
        subGalleryGridsContainer: '.subgallery' //selector of the direct parent of the subgallery grids
    });

    $('.closetestmon').click(function () {
        $('#testmon_grid').fadeOut();
        $('#default_port').fadeIn();
        $('#port-text-def').fadeIn();        
    });

    $('.testmon_grid .galleryContainer').slimScroll({
        railVisible: true,
        height: '300px',
        position: 'right'
    });
});
