// JavaScript Document

function Slider(container, nav) {
	this.container = container;
	this.nav = nav;
	
	this.imgs = this.container.find('img');
	this.imgWidth = this.imgs[0].width;
	this.imgsLen = this.imgs.length;
	
	this.current = 0;
};

Slider.prototype.transition = function(coords) {
  this.container.animate({
	  'margin-left' : coords || -(this.current * this.imgWidth)
  });
};

Slider.prototype.setCurrent = function(dir) {
	var pos = this.current;
	
	pos += (~~(dir === 'next') || -1);
	this.current = (pos < 0) ? this.imgsLen - 1 : pos % this.imgsLen;
	
	return pos;
};

function Slider2(container, nav) {
	this.container = container;
	this.nav = nav;
	
	this.imgs = this.container.find('li');
	this.imgWidth = this.imgs.outerWidth(true);
	this.imgsLen = this.imgs.length - 3;
	
	this.current = 0;
};

Slider2.prototype.transition = function(coords) {
  this.container.animate({
	  'margin-left' : coords || -(this.current * this.imgWidth)
  });
};

Slider2.prototype.setCurrent = function(dir) {
	var pos = this.current;
	
	pos += (~~(dir === 'next') || -1);
	this.current = (pos < 0) ? this.imgsLen - 1 : pos % this.imgsLen;
	
	return pos;
};

$(document).ready(function(e) {
	$('.ui-accordion h3').on('click', function(e) {
		if ($('.ui-accordion h3').hasClass('activeAcc')) {
			$('.ui-accordion h3').removeClass('activeAcc');
			$('.ui-accordion h3').addClass('non-active');
		} else {
			$('.ui-accordion h3').removeClass('non-active');
			$('.ui-accordion h3').addClass('activeAcc');
		};
	});
	
    $('.ui-accordion h3').on('click', function(e) {
		if ($(this).hasClass('activeAcc')) {
			$(this).removeClass('activeAcc');
			$(this).addClass('non-active');
		} else {
			$(this).removeClass('non-active');
			$(this).addClass('activeAcc');
		};
	});
});








