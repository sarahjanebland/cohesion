$(function() {
	$("form.search-users").on("ajax:success", function(event, data){
		if(data.error) {
			data = "<h1>" + data.error + "</h1>";
		}
		$(".search-box").html(data);
	});

	$(".name_img_span").on("ajax:success", function(event, data){
		
		$(".featured_user").html(data);
	});

	$(document).ready(function() {
		$('.featured_user:first-child').addClass('show');

		$('.l-arrow').click(function() {
			if ($('.featured_user:first-child').hasClass('show')) {
				$('.featured_user:first-child').removeClass('show');
				$('.featured_user:last-child').addClass('show');
			} else {
				$('.featured_user.show').removeClass('show').prev().addClass('show');
			}
		});

		$('.r-arrow').click(function() {
			if ($('.featured_user:last-child').hasClass('show')) {
				$('.featured_user:last-child').removeClass('show');
				$('.featured_user:first-child').addClass('show');
			} else {
				$('.featured_user.show').removeClass('show').next().addClass('show');
			}
		});
	});

});
