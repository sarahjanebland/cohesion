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

});