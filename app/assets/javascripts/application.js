// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require best_in_place

$(document).ready(function() {

	/* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();

  function handler1() {
  	$(this).css('color', '#00AF33');
		var el = $(this).find('.vote-count');
	  var num = parseInt(el.text());
	  el.text(num+1);
	  $(this).one("click", handler2);
	}

	function handler2() {
		$(this).css('color', 'black');
	  var el = $(this).find('.vote-count');
	  var num = parseInt(el.text());
	  el.text(num-1);
	  $(this).one("click", handler1);
	}

	$(".voted").one("click", handler2);
	$(".novote").one("click", handler1);

});

/* Activating Google analytics */
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-55613013-3', 'auto');
ga('send', 'pageview');

//= require turbolinks



