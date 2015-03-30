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
        height: '395px',
        position: 'right'
    });

    $('.closePortfolio').click(function () {
        $('#portfolio_grid').fadeOut(300);
        $('#default_port').delay(300).fadeIn(300);
        $('#port-text-def').delay(300).fadeIn(300);
        $('#port-text-caption').fadeOut(300);
        $('#port-text-caption').html('');
        try {
            $('#3agrat_video').stopYTP();
            $('#3agarat_play').fadeIn("slow");
        } catch (err) { }

    });

    $('.open-gallery').click(function () {
        $('#port-text-def').fadeOut(300);
        var content = $(this).next('.item-caption').html();
        $('#port-text-caption').html(content);
        $('#port-text-caption').delay(300).fadeIn(300);
    });

    $('.gallery-back').click(function () {
        $('#port-text-caption').fadeOut(300);
        $('#port-text-def').delay(300).fadeIn(300);        
        $('#port-text-caption').html('');
        try {
            $('#3agrat_video').stopYTP();
            $('#3agarat_play').fadeIn("slow");
        } catch (err) { }
        
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
        $('#testmon_grid').fadeOut(300);
        $('#default_port').delay(300).fadeIn(300);
        $('#port-text-def').delay(300).fadeIn(300);
        try {            
            $('#testmon_vedio').stopYTP();
            $('#testmon_play').fadeIn("slow");
        } catch (err) { }
    });

    $('.testmon_grid .galleryContainer').slimScroll({
        railVisible: true,
        height: '395px',
        position: 'right'
    });

    $('#testmon_play').click(function () {
        $('#testmon_play').fadeOut("slow");
        $("#testmon_vedio").playYTP();
    });

    $('#3agarat_play').click(function () {
        $('#3agarat_play').fadeOut("slow");
        $("#3agrat_video").playYTP();
    });

    $("#testmon_vedio").mb_YTPlayer({ videoURL: $('#testmon_vedio').attr('data-vedioid'), containment: '#testmon_vedio', loop: false, autoPlay: false });
    $("#3agrat_video").mb_YTPlayer({ videoURL: $('#3agrat_video').attr('data-vedioid'), containment: '#3agrat_video', loop: false, autoPlay: false });
});
