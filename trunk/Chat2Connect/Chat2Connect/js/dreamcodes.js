// <![CDATA[
$(function() {

  /* show or hide gadget */
  $('a.js_hs_a').click(function(){
	$(this).parents('.js_hide_gadget').children('.js_hide_box').slideToggle('slow');
    if ($(this).parents('.js_hide_gadget').hasClass('js_minimized'))
	  { $(this).parents('.js_hide_gadget').removeClass('js_minimized');}
	else
	  { $(this).parents('.js_hide_gadget').addClass('js_minimized');}
	return false;
  });
  
  var arr_links = location.href.split('/');
  var length = arr_links.length;
  $('.sc_menu li').each(function () {
	if ($(this).children('a').attr('href') == '../'+arr_links[(length-2)]+"/index.html") {
	  $(this).addClass('active');
	}  	
  })

  /* tab-navigation */
  $('#mstabs').find('ul:first').find('li:first').children('a').addClass('ms_active');
  $('#mstabs').children('div').css({'display':'none'});
  $('#'+$('#mstabs').find('a.ms_active:first').attr('rel')).css({'display':'block'});
  $('#mstabs').find('ul:first').children('li').children('a').click(function() {
	$('#mstabs').find('ul:first').children('li').children('a').removeClass('ms_active');
	$(this).addClass('ms_active');
	$('#mstabs').children('div').css({'display':'none'});
	$('#'+$(this).attr('rel')).css({'display':'block'});
	return false;
  });

});	





	/* Slide Menu */


            $(function() {
				/**
				 * the menu
				 */
				var $menu = $('#ldd_menu');
				
				/**
				 * for each list element,
				 * we show the submenu when hovering and
				 * expand the span element (title) to 510px
				 */
				$menu.children('li').each(function(){
					var $this = $(this);
					var $span = $this.children('span');
					$span.data('width',$span.width());
					
					$this.bind('mouseenter',function(){
						$menu.find('.ldd_submenu').stop(true,true).hide();
						$span.stop().animate({'width':'315px'},300,function(){
							$this.find('.ldd_submenu').slideDown(300);
						});
					}).bind('mouseleave',function(){
						$this.find('.ldd_submenu').stop(true,true).hide();
						$span.stop().animate({'width':$span.data('width')+'px'},300);
					});
				});
            });



// ]]>

