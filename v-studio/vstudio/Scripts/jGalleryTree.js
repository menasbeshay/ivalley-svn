(function($) {
    $.fn.closest_descendent = function(filter) {
        var $found = $(),
            $currentSet = this; // Current place
        while ($currentSet.length) {
            $found = $currentSet.filter(filter);
            if ($found.length) break;  // At least one match: break loop
            // Get all children of the current set
            $currentSet = $currentSet.children();
        }
        return $found.first(); // Return first match of the collection
    }    
})(jQuery);

(function($){
	$.fn.jGalleryTree = function(options){

		var open_galleryB = "a.open-gallery";
		var subitem_gallery = ".subgallery";
		var subitem_galleryGP = ".subgallery";
		var gallery_parent = '.galleryContainer';
		var grid_container = ".galleryContainer>.gallery-grid";
		var gallery_back = ".gallery-back";
		var gallery_animation = "NONE";

		var config = {};
		if(options){
			$.extend(config, options);
		}
	
		return this.each(function(){
		

		// Setting PARAMETERS -----
		
			if(config.openGalleryButton)
				open_galleryB = config.openGalleryButton;
			if(config.subGallery)
				subitem_gallery = config.subGallery;
			if(config.galleryBackButton)
				gallery_back = config.galleryBackButton;
			if(config.animationType)
				gallery_animation = config.animationType;			
			if(config.subGalleryGridsContainer)
				subitem_galleryGP = config.subGalleryGridsContainer;			
			if(config.gridsContainer)
				grid_container = config.gridsContainer;
			
			gallery_parent = this;
			// ------- END SETTING PARAMETERS
		
		// EVENTS HANDLING --------
		
			/** CLICKING THE OPEN_GALLERY BUTTON **/
			
			$('.choose').change(function(){
				gallery_animation = ($('.choose option:selected').text())
			})
			
/*			$(gallery_parent).find(subitem_gallery).addClass('hide-it')*/
						
			$(gallery_parent).find($(subitem_gallery)).addClass('hide-it')
			$(gallery_parent).find($(grid_container)).addClass('gridsInPlace');
			$(gallery_parent).find($(grid_container)).children().addClass('gallerygridsitems');
			$(gallery_parent).find($(subitem_galleryGP)).children().addClass('gallerygridsitems');
			
			$(gallery_parent).find($(open_galleryB)).click(function(e){
				//if(!$(this).parents().filter($(grid_container).children()).find($(subitem_gallery)).filter(':eq(0)').length){
				if(!$(this).closest($('.gallerygridsitems')).find($(subitem_gallery)).filter(':eq(0)').length){
					e.preventDefault();
					return 0;
				}

				/*$(this).parent('*').find(subitem_gallery).filter(':eq(0)').clone().appendTo(gallery_parent);*/
//			$(gallery_parent).children(grid_container).filter(':last()').after(($(this).parent('*').find($(subitem_gallery)).filter(':eq(0)').clone(true)))
				$(gallery_parent).find('.gridsInPlace').filter(':last()').after(($(this).closest($('.gallerygridsitems')).find($(subitem_gallery)).first().clone(true)))
				$(gallery_parent).find('.gridsInPlace').addClass('hide-it');
				$(gallery_parent).find('.gridsInPlace').parent().children(subitem_gallery).last().removeClass('hide-it').addClass('gridsInPlace');
				$(gallery_parent).find('.gridsInPlace').filter(':hidden()').children('*').removeClass('animated').removeClass(gallery_animation)
				$(gallery_parent).find('.gallerygridsitems').filter(':hidden()').removeClass('animated').removeClass(gallery_animation)
				$(gallery_parent).find('.gallerygridsitems').filter(':visible()').addClass(gallery_animation).addClass('animated');
				//$(gallery_parent).find('.gridsInPlace').filter(':visible()').children('*').addClass(gallery_animation).addClass('animated');
				e.preventDefault();
			})
			
			/** CLICKING THE GALLERY_BACK BUTTON **/
			
			$(gallery_parent).find($(gallery_back)).click(function(e){
				if($(gallery_parent).find('.gridsInPlace').length < 2){
					e.preventDefault();
					return 0;
				}
				$(gallery_parent).find('.gridsInPlace').filter(':last()').remove();
				$(gallery_parent).find('.gridsInPlace').filter(':last()').removeClass('hide-it');
				
				$(gallery_parent).find('.gridsInPlace').filter(':visible()').children('*').removeClass('animated').removeClass(gallery_animation).addClass(gallery_animation).addClass('animated');
				e.preventDefault();
			})
			
		//-------- END EVENTS HANDLING	
			
		})

	}
})(jQuery)