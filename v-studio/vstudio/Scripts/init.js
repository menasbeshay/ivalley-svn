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

    /*******init portfolio videos *******/
    $('#logo1_play').click(function () {
        $('.subgallery.column1.gridsInPlace #logo1_play').fadeOut("slow");
        $('.subgallery.column1.gridsInPlace #logo1_thumb').fadeOut('slow');
        if (!$(".subgallery.column1.gridsInPlace #logo1_video").getPlayer())
            $(".subgallery.column1.gridsInPlace #logo1_video").mb_YTPlayer({ videoURL: $('#logo1_video').attr('data-vedioid'), containment: '.subgallery.column1.gridsInPlace #logo1_video', loop: false, autoPlay: true });        
    });

    $('#logo2_play').click(function () {
        $('.subgallery.column1.gridsInPlace #logo2_play').fadeOut("slow");
        $('.subgallery.column1.gridsInPlace #logo2_thumb').fadeOut('slow');
        if (!$(".subgallery.column1.gridsInPlace #logo2_video").getPlayer())
            $(".subgallery.column1.gridsInPlace #logo2_video").mb_YTPlayer({ videoURL: $('#logo2_video').attr('data-vedioid'), containment: '.subgallery.column1.gridsInPlace #logo2_video', loop: false, autoPlay: true });
    });

    $('#logo3_play').click(function () {
        $('.subgallery.column1.gridsInPlace #logo3_play').fadeOut("slow");
        $('.subgallery.column1.gridsInPlace #logo3_thumb').fadeOut('slow');
        if (!$(".subgallery.column1.gridsInPlace #logo3_video").getPlayer())
            $(".subgallery.column1.gridsInPlace #logo3_video").mb_YTPlayer({ videoURL: $('#logo3_video').attr('data-vedioid'), containment: '.subgallery.column1.gridsInPlace #logo3_video', loop: false, autoPlay: true });
    });

    $('#logo4_play').click(function () {
        $('.subgallery.column1.gridsInPlace #logo4_play').fadeOut("slow");
        $('.subgallery.column1.gridsInPlace #logo4_thumb').fadeOut('slow');
        if (!$(".subgallery.column1.gridsInPlace #logo4_video").getPlayer())
            $(".subgallery.column1.gridsInPlace #logo4_video").mb_YTPlayer({ videoURL: $('#logo4_video').attr('data-vedioid'), containment: '.subgallery.column1.gridsInPlace #logo4_video', loop: false, autoPlay: true });
    });

    $('#logo5_play').click(function () {
        $('.subgallery.column1.gridsInPlace #logo5_play').fadeOut("slow");
        $('.subgallery.column1.gridsInPlace #logo5_thumb').fadeOut('slow');
        if (!$(".subgallery.column1.gridsInPlace #logo5_video").getPlayer())
            $(".subgallery.column1.gridsInPlace #logo5_video").mb_YTPlayer({ videoURL: $('#logo5_video').attr('data-vedioid'), containment: '.subgallery.column1.gridsInPlace #logo5_video', loop: false, autoPlay: true });
    });

    $('#logo8_play').click(function () {
        $('.subgallery.column1.gridsInPlace #logo8_play').fadeOut("slow");
        $('.subgallery.column1.gridsInPlace #logo8_thumb').fadeOut('slow');
        if (!$(".subgallery.column1.gridsInPlace #logo8_video").getPlayer())
            $(".subgallery.column1.gridsInPlace #logo8_video").mb_YTPlayer({ videoURL: $('#logo8_video').attr('data-vedioid'), containment: '.subgallery.column1.gridsInPlace #logo8_video', loop: false, autoPlay: true });
    });

    $('#logo9_play').click(function () {
        $('.subgallery.column1.gridsInPlace #logo9_play').fadeOut("slow");
        $('.subgallery.column1.gridsInPlace #logo9_thumb').fadeOut('slow');
        if (!$(".subgallery.column1.gridsInPlace #logo9_video").getPlayer())
            $(".subgallery.column1.gridsInPlace #logo9_video").mb_YTPlayer({ videoURL: $('#logo9_video').attr('data-vedioid'), containment: '.subgallery.column1.gridsInPlace #logo9_video', loop: false, autoPlay: true });
    });

    $('#logo10_play').click(function () {
        $('.subgallery.column1.gridsInPlace #logo10_play').fadeOut("slow");
        $('.subgallery.column1.gridsInPlace #logo10_thumb').fadeOut('slow');
        if (!$(".subgallery.column1.gridsInPlace #logo10_video").getPlayer())
            $(".subgallery.column1.gridsInPlace #logo10_video").mb_YTPlayer({ videoURL: $('#logo10_video').attr('data-vedioid'), containment: '.subgallery.column1.gridsInPlace #logo10_video', loop: false, autoPlay: true });
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
            $('.subgallery.column1.gridsInPlace #logo1_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo1_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo1_thumb').fadeIn('slow');
        } catch (err) { }
        try {
            $('.subgallery.column1.gridsInPlace #logo2_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo2_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo2_thumb').fadeIn('slow');
        } catch (err) { }
        try {
            $('.subgallery.column1.gridsInPlace #logo3_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo3_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo3_thumb').fadeIn('slow');
        } catch (err) { }
        try {
            $('.subgallery.column1.gridsInPlace #logo4_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo4_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo4_thumb').fadeIn('slow');
        } catch (err) { }
        try {
            $('.subgallery.column1.gridsInPlace #logo5_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo5_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo5_thumb').fadeIn('slow');
        } catch (err) { }
        try {
            $('.subgallery.column1.gridsInPlace #logo8_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo8_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo8_thumb').fadeIn('slow');
        } catch (err) { }
        try {
            $('.subgallery.column1.gridsInPlace #logo9_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo9_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo9_thumb').fadeIn('slow');
        } catch (err) { }
        try {
            $('.subgallery.column1.gridsInPlace #logo10_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo10_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo10_thumb').fadeIn('slow');
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
            $('.subgallery.column1.gridsInPlace #logo1_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo1_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo1_thumb').fadeIn('slow');
        } catch (err) { }
        try {
            $('.subgallery.column1.gridsInPlace #logo2_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo2_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo2_thumb').fadeIn('slow');
        } catch (err) { }
        try {
            $('.subgallery.column1.gridsInPlace #logo3_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo3_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo3_thumb').fadeIn('slow');
        } catch (err) { }
        try {
            $('.subgallery.column1.gridsInPlace #logo4_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo4_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo4_thumb').fadeIn('slow');
        } catch (err) { }
        try {
            $('.subgallery.column1.gridsInPlace #logo5_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo5_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo5_thumb').fadeIn('slow');
        } catch (err) { }
        try {
            $('.subgallery.column1.gridsInPlace #logo8_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo8_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo8_thumb').fadeIn('slow');
        } catch (err) { }
        try {
            $('.subgallery.column1.gridsInPlace #logo9_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo9_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo9_thumb').fadeIn('slow');
        } catch (err) { }
        try {
            $('.subgallery.column1.gridsInPlace #logo10_video').stopYTP();
            $('.subgallery.column1.gridsInPlace #logo10_play').fadeIn("slow");
            $('.subgallery.column1.gridsInPlace #logo10_thumb').fadeIn('slow');
        } catch (err) { }
       
        
    });

    /*************** testmoniols grid and video ************************/

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

    
    $("#testmon_vedio").mb_YTPlayer({ videoURL: $('#testmon_vedio').attr('data-vedioid'), containment: '#testmon_vedio', loop: false, autoPlay: false });
    
});
