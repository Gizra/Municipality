jQuery(document).ready(function ($) { 
 function stickymenu() {

	var $this = this,
		$body = $("body"),
		header = $("#header"),
		headerContainer = header.parent(),
		menuAfterHeader = (typeof header.data('after-header') !== 'undefined'),
		headerHeight = header.height(),
		flatParentItems = $("#header.flat-menu ul.nav-main > li > a"),
		logoWrapper = header.find(".logo"),
		logo = header.find(".logo img"),
		logoWidth = logo.attr("width"),
		logoHeight = logo.attr("height"),
		logoPaddingTop = parseInt(logo.attr("data-sticky-padding") ? logo.attr("data-sticky-padding") : "28"),
		logoSmallWidth = parseInt(logo.attr("data-sticky-width") ? logo.attr("data-sticky-width") : "82"),
		logoSmallHeight = parseInt(logo.attr("data-sticky-height") ? logo.attr("data-sticky-height") : "40");

	if(menuAfterHeader) {
		headerContainer.css("min-height", header.height());
	}

	$(window).afterResize(function() {
		headerContainer.css("min-height", header.height());
	});

	$this.checkStickyMenu = function() {

		if(!menuAfterHeader) {

			if($(window).scrollTop() > ((headerHeight - 15) - logoSmallHeight)) {

				$this.stickyMenuActivate();

			} else {

				$this.stickyMenuDeactivate();

			}

		} else {

			if($(window).scrollTop() > header.parent().offset().top) {

				header.addClass("fixed");

			} else {

				header.removeClass("fixed");

			}

		}

	}

	$this.stickyMenuActivate = function() {

		if($body.hasClass("sticky-menu-active"))
			return false;

		logo.stop(true, true);

		$body.addClass("sticky-menu-active").css("padding-top", headerHeight);
		flatParentItems.addClass("sticky-menu-active");

		logoWrapper.addClass("logo-sticky-active");

		logo.animate({
			width: logoSmallWidth,
			height: logoSmallHeight,
			top: logoPaddingTop + "px"
		}, 200, function() {});

	}

	$this.stickyMenuDeactivate = function() {

		if($body.hasClass("sticky-menu-active")) {

			$body.removeClass("sticky-menu-active").css("padding-top", 0);
			flatParentItems.removeClass("sticky-menu-active");

			logoWrapper.removeClass("logo-sticky-active");

			logo.animate({
				width: logoWidth,
				height: logoHeight,
				top: "0px"
			}, 200);

		}

	}


	$(window).on("scroll", function() {

		$this.checkStickyMenu();

	});

	$this.checkStickyMenu();

			
	}
	
	stickymenu();
		
});