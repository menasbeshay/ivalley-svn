// Styleswitcher by UnitedThemes
(function($){
		
	$(document).ready(function(){
                
                var originalurl = $('#styleswitch-css').attr('href');
                var weburl = $('#ut_styleswitcher').data('url');
                
                $('#pagelayout').live('change', function () {
                    
                    var url = $(this).val(); // get selected value
						if (url) { // require a URL
							window.location = url; // redirect
					  	}
					return false;
                    
                });                
                
                $('#ut_styleswitcher .toggle').click(function(e){
                    
					e.preventDefault();
					
					$( '#ut_styleswitcher' ).stop().animate({ 
					left: ( $( '#ut_styleswitcher' ).css('left')== '0px' ? '-' +$('#ut_styleswitcher').outerWidth()-5+'px':'0px')})
						
				});
                
               
                                
        });
	
})(jQuery);	