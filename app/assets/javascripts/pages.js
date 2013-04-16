$(function() {
	$("form.search-users").on("ajax:success", function(event, data){
		if(data.error) {
			data = "<h1>" + data.error + "</h1>";
		}
		$(".search-box").html(data);
	});

});