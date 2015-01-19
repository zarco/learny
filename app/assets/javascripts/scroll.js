// jQuery for page scrolling feature - requires jQuery Easing plugin
$(document).ready(function(){
	$(function() {
	    $('.page-scroll a.item-menu,.index').bind('click', function(event) {
	        var $anchor = $(this);
	        $('html, body').stop().animate({
	            scrollTop: $($anchor.attr('href')).offset().top
	        }, 1500, 'easeInOutExpo');
	        event.preventDefault();
	    });
	});
	
	$('body').scrollspy({
	    target: '.navbar-fixed-top'
	});

	$('.navbar-collapse ul li a.item-menu,.index').click(function() {
	    if($(document).width()>768){
	    	$('.navbar-toggle:visible').click();
	    }else{
	    	$('.navbar').click();
	    }
	});
});