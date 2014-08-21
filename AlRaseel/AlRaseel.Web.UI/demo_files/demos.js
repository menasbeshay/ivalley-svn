/*
 * This CSS is only used for the demo / description pages.
 * This is not a requirement for Boutique work
 */

$(document).ready(function(){

	// External controls example box
	var $controls = $('#controls');
	if($controls.length){
		var controls_open = true;
		var $controls_button = $('#controls_button');
		var $controls_button_arrow = $controls_button.find('div');
		var $controls_inner = $('#controls_inner');
		var controls_width = $controls.css('width');
		$controls.show();
		$controls_button.click(function(){
			if(controls_open){
				$controls_inner.hide();
				$controls.width(0);
				controls_open = false;
				$controls_button_arrow.html('<');
			}else{
				$controls_inner.show();
				$controls.width(controls_width);
				controls_open = true;
				$controls_button_arrow.html('>');
			}
		});
	}

});