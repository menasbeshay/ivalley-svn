﻿$(document).ready(function() {	
		InitGOLinforma();
	
		var nItems = $('.scrollable .items > div').size();
		var WidthItems = $('.scrollable .items > div').width();
		$('.scrollable .items').width(nItems * WidthItems);

		$('.Carrossel .next').show();
		$('.Carrossel .prev').show();
		
		$('.Carrossel .scrollable ').scrollingCarousel({
			autoScroll      : true,
			scrollSpeed     : 'slow',
			autoScrollSpeed : '10000',	
			ScrollerOffset : '50'	
		});
		
		var ScrollLeftFirst;
		var ScrollLeftLast;
		$('.Carrossel .next').mouseover(function(){
			ScrollLeftFirst = $('.scrollable > div:first').css('left');
			ScrollLeftLast = $('.scrollable > div:last').css('left');
			var myCarroussel = $('.Carrossel .scrollable ').scrollingCarousel();
			myCarroussel.Update({
				beforeCreateFunction : function(){
											var nItems = $('.scrollable .items > div').size();
											var WidthItems = $('.scrollable .items > div').width();
											$('.scrollable .items').width(nItems * WidthItems);
										},
				autoScroll      : true,
				scrollSpeed     : 'slow',
				autoScrollSpeed : '10000',
				autoScrollDirection : 'right'
			});
		});
		$('.Carrossel .prev').mouseover(function(){
			ScrollLeftFirst = $('.scrollable > div:first').css('right');
			ScrollLeftLast = $('.scrollable > div:last').css('right');
			var myCarroussel = $('.Carrossel .scrollable ').scrollingCarousel();
			myCarroussel.Update({
				beforeCreateFunction : function(){
											var nItems = $('.scrollable .items > div').size();
											var WidthItems = $('.scrollable .items > div').width();
											$('.scrollable .items').width(nItems * WidthItems);
										},
				autoScroll      : true,	
				scrollSpeed     : 'slow',
				autoScrollSpeed : '10000',
				autoScrollDirection : 'left'
			});
		});
	$('.scrollable .items a img').hover(function(){ $(this).width('160px') },function(){ $(this).width('157px') });
}); 

function InitGOLinforma()
{

    var itensGolInforma = $('.GolInforma .Conteudo').size();

	if(itensGolInforma > 1){
    	$(".GolInforma .Conteudo").hide();
		$(".GolInforma .Conteudo").eq(0).show();
	
		IsGOLinformaOnLooping = true;
		IntervalTransition = 10000;
		LastTransition = (new Date()).getTime();
	
	
		LoopingGOLinforma();
	}
	
}

function LoopingGOLinforma()
{
	window.setInterval(function() {
		if (IsGOLinformaOnLooping && ((new Date()).getTime() - LastTransition) > IntervalTransition)
		{
			ProximoGOLinforma();
		}
	}, IntervalTransition);
}
	
function ProximoGOLinforma()
{
	$(".GolInforma .Conteudo:visible").hide().next(".Conteudo").fadeIn();
	if ($(".GolInforma .Conteudo:visible").length == 0)
		$(".GolInforma .Conteudo").eq(0).fadeIn();
		
	LastTransition = (new Date()).getTime();
}
(function(a){a.fn.scrollingCarousel=function(d,e){if(this.length>1){var c=new Array();this.each(function(h){c.push(a(this).scrollingCarousel(d,h))});return c}var f=a.extend({},a().scrollingCarousel.defaults,d);var b;var g;this.Destroy=function(h){var i=this;var h=(h!=undefined)?h:false;a(i).removeData("scrollingCarousel");i.children(":eq(1)").remove();if(a(this).find("> div").length>0){i[0].innerHTML=a(this).find("> div")[0].innerHTML;i.children().each(function(){a(this,i)[0].style.cssText=""})}else{i.find("li").each(function(){a(this,i)[0].style.cssText=""})}i.children()[0].style.cssText="";i[0].style.cssText="";i.unbind()};this.Update=function(h){f=null;f=a.extend({},a().scrollingCarousel.defaults,h);this.Destroy(true);return this.Create()};this.Create=function(h,j){if(!a(this).html()){return false}var r=this;var l=r.html();if(a(r).data("scrollingCarousel")==true&&j!="pause"){return this}if(f.beforeCreateFunction!=null&&a.isFunction(f.beforeCreateFunction)){f.beforeCreateFunction(r,f)}var p;var i=0;var n;var m;var s;var o;var q;var x;var t=new Object();var w=r[0];w.style.paddingLeft="0";w.style.paddingRight="0";var C=w.offsetWidth;var u=r.children()[0].nodeName.toLowerCase();switch(u){case"div":if(!j){w.innerHTML="<div>"+r[0].innerHTML+"</div>";w.innerHTML+=w.innerHTML}p=r.find("> div");s=r.find("> div:first > div");break;case"ul":if(!j){w.innerHTML+=w.innerHTML}p=r.find("ul");s=r.find("ul:first > li");break;case"ol":if(!j){w.innerHTML+=w.innerHTML}p=r.find("ol");s=r.find("ol:first > li");break;default:console.log("unable to initialise scroller - please ensure contents are either in a UL, an OL or in DIVs");return}switch(f.scrollSpeed.toLowerCase()){case"slow":m=1;break;case"fast":m=4;break;case"medium":default:m=2}var k=0;var A=0;var B=0;var z;var v;switch(f.scrollerAlignment.toLowerCase()){case"vertical":a(s).each(function(D){k+=a(this,r)[0].offsetHeight+parseInt(a(this,r).css("marginTop"))+parseInt(a(this,r).css("marginBottom"));if(a(this,r)[0].offsetWidth>B){B=a(this,r)[0].offsetWidth}});break;case"horizontal":default:a(s).each(function(D){k+=a(this,r)[0].offsetWidth+parseInt(a(this,r).css("marginLeft"))+parseInt(a(this,r).css("marginRight"));if(a(this,r)[0].offsetHeight>A){A=a(this,r)[0].offsetHeight}});break}if(!j){if(f.scrollerAlignment.toLowerCase()!="vertical"){w.style.height=A+"px"}else{w.style.width=B+"px";w.style.height=(a(w).height()>0)?a(w).height()+"px":a(w).parent().height()+"px";C=w.offsetHeight}if(k>C){var y=Math.round((k/100)*f.scrollerOffset);o=y-(Math.round(C/2));if(o>(k-C)){o=k-C}}else{return false}w.style.overflow="hidden";w.style.position="relative";var z;p.each(function(){a(this,r)[0].style.position="absolute";if(f.scrollerAlignment.toLowerCase()!="vertical"){a(this,r)[0].style.top="0";a(this,r)[0].style.width=k+"px"}else{a(this,r)[0].style.left="0";a(this,r)[0].style.height=k+"px";a(this,r)[0].style.width=B+"px"}a(this).children().each(function(D){if(f.scrollerAlignment.toLowerCase()!="vertical"){a(this,r)[0].style.cssFloat="left"}a(this,r)[0].style.position="static"})});if(f.scrollerAlignment.toLowerCase()!="vertical"){p[0].style.left=(o>0)?"-"+o+"px":"0";if(f.looped==true){p[1].style.left=p[0].offsetLeft-k+"px"}else{p[1].style.display="none";p[1].style.top="-1000px"}}else{p[0].style.top=(o>0)?"-"+o+"px":"0";if(f.looped==true){p[1].style.top=p[0].offsetTop-k+"px"}else{p[1].style.display="none";p[1].style.left="-1000px"}}r.mouseenter(function(){t.startCarousel()});r.mouseleave(function(){t.stopCarousel(true);if(f.autoScroll==true){t.autoScroll()}});r.mousemove(function(E){var F={x:0,y:0};if(E.pageX||E.pageY){F.x=E.pageX;F.y=E.pageY}else{var G=document.documentElement;var D=document.body;F.x=E.clientX+((G.scrollLeft||D.scrollLeft)-(G.clientLeft||0));F.y=E.clientY+((G.scrollTop||D.scrollTop)-(G.clientTop||0))}cursorPosition=F})}t.autoScroll=function(){var D=40;if(f.looped==false){return}if(g){clearInterval(g);g=0}n=n?n:((f.scrollerAlignment.toLowerCase()!="vertical")?parseInt(p[0].style.left):parseInt(p[0].style.top));f.autoScrollSpeed=(f.autoScrollSpeed<1000)?1000:f.autoScrollSpeed;if((f.autoScrollSpeed/D)<C){q=Math.round(C/(f.autoScrollSpeed/D))}else{q=1;D=Math.round(f.autoScrollSpeed/C)}g=setInterval(function(){switch(f.autoScrollDirection.toLowerCase()){case"right":case"down":if((n+q)>k){n=0;i=(i==0)?1:0}else{n=n+q}break;case"left":case"up":default:if((n-q)<(0-(k-C))){n=C;i=(i==0)?1:0}else{n=n-q}}if(f.scrollerAlignment.toLowerCase()!="vertical"){p[i].style.left=n+"px";p[(i==0)?1:0].style.left=n-k+"px"}else{p[i].style.top=n+"px";p[(i==0)?1:0].style.top=n-k+"px"}},D)};t.startCarousel=function(){if(g){clearInterval(g);g=0}x=(f.scrollerAlignment.toLowerCase()!="vertical")?Math.round(a(w).offset().left+(w.offsetWidth/2)):Math.round(a(w).offset().top+(w.offsetHeight/2));n=n?n:((f.scrollerAlignment.toLowerCase()!="vertical")?parseInt(p[0].style.left):parseInt(p[0].style.top));b=setInterval(function(){var F;var E=(f.scrollerAlignment.toLowerCase()!="vertical")?cursorPosition.x:cursorPosition.y;var D=C/2;F=(E<x)?x-E:E-x;q=(F<(Math.ceil((D/100)*30)))?1:((F<(Math.ceil((D/100)*50)))?2*m:((F<(Math.ceil((D/100)*70)))?3*m:((F<(Math.ceil((D/100)*90)))?4*m:6*m)));if(E<x){if((n+q)>0&&f.looped==false){n=0}else{if((n+q)>k){n=0;i=(i==0)?1:0}else{n=n+q}}}else{if(E>x){if((n-q)<(0-(k-C))){if(f.looped==false){n=(0-(k-C))}else{n=C;i=(i==0)?1:0}}else{n=n-q}}}if(f.scrollerAlignment.toLowerCase()!="vertical"){p[i].style.left=n+"px";p[(i==0)?1:0].style.left=n-k+"px"}else{p[i].style.top=n+"px";p[(i==0)?1:0].style.top=n-k+"px"}},40)};t.stopCarousel=function(H){if(!b){return}clearInterval(b);b=0;if(!H||f.looped==false||f.autoScroll==true){return}if(q>1){var E;var G=0;for(E=q;E>1;E--){G+=E}var F=(f.scrollerAlignment.toLowerCase()!="vertical")?cursorPosition.x:cursorPosition.y;if(F<x){if((n+G)>k){n=n-k;i=(i==0)?1:0}}else{if((n-G)<(0-(k-C))){n=n+k;i=(i==0)?1:0}}var D=setInterval(function(){if(q>1){if(F<x){n+=q}else{n-=q}if(f.scrollerAlignment.toLowerCase()!="vertical"){p[i].style.left=n+"px";p[(i==0)?1:0].style.left=n-k+"px"}else{p[i].style.top=n+"px";p[(i==0)?1:0].style.top=n-k+"px"}q--}else{clearInterval(D)}},50)}};if(j!="pause"){if(f.autoScroll==true){t.autoScroll()}}switch(j){case"pause":t.stopCarousel();if(g){clearInterval(g);g=0}r.unbind("mouseenter");r.unbind("mouseleave");a(r).data("scrollingCarousel",false);return;break;case"play":a("html").mousemove(function(E){var F={x:0,y:0};if(E.pageX||E.pageY){F.x=E.pageX;F.y=E.pageY}else{var G=document.documentElement;var D=document.body;F.x=E.clientX+(G.scrollLeft||D.scrollLeft)-(G.clientLeft||0);F.y=E.clientY+(G.scrollTop||D.scrollTop)-(G.clientTop||0)}cursorPosition=F;if(cursorPosition.x>=r.offset().left&&cursorPosition.x<=(r.offset().left+r[0].offsetWidth)&&cursorPosition.y>=r.offset().top&&cursorPosition.y<=(r.offset().top+r[0].offsetHeight)){t.startCarousel()}r.mouseenter(function(){t.startCarousel()});r.mouseleave(function(){t.stopCarousel(true);if(f.autoScroll==true){t.autoScroll()}});a(this).unbind("mousemove");if(f.autoScroll==true){t.autoScroll()}});break}a(r).data("scrollingCarousel",true);if(f.afterCreateFunction!=null&&a.isFunction(f.afterCreateFunction)){f.afterCreateFunction(r,f)}return this};this.Pause=function(){this.Create(e,"pause")};this.Play=function(){this.Create(e,"play")};return this.Create(e)};jQuery.fn.scrollingCarousel.defaults={autoScroll:false,autoScrollDirection:"left",autoScrollSpeed:10000,looped:true,scrollerAlignment:"horizontal",scrollerOffset:0,scrollSpeed:"medium",beforeCreateFunction:null,afterCreateFunction:null}})(jQuery);