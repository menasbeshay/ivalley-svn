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

$(function(){ car.init(); });
