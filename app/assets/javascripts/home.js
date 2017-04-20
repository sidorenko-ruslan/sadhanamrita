$( document ).on('turbolinks:load', function() {
	$('.button').click(function () {
		var clickedButton = $(this);
		var buttonClass = "";
		if (clickedButton.hasClass("year-button")) {
			buttonClass = ".year-button";
		}
		else if (clickedButton.hasClass("month-button")) {
			buttonClass = ".month-button";
		}
		console.log(buttonClass);
		$(buttonClass).each(function () {
			console.log(clickedButton.text());
			if ($(this).text() == clickedButton.text()) {
				$(this).toggleClass('active');
			}
			else {
				$(this).removeClass('active');
			}
		});
		var currentYear = $(".year-button.active").attr("year-number");
		var currentMonth = $(".month-button.active").attr("month-number");
		if (currentYear != null && currentMonth != null) {
			window.location = "/?m=" + currentMonth + "&y=" + currentYear;
		}
		else {
			window.location = "/";
		}
		
	});

	$('.time').mask('00:00');
	$('.number').mask('000');
	$('table').colResizable({resizeMode:'overflow', postbackSafe:true});
	
});


function changeDate() {
	// var currentYear = $(".year-button.active").attr("year-number");
	// var currentMonth = $(".month-button.active").attr("month-number");
	// if (currentYear != null && currentMonth != null) {
	// 	window.location = "/?m=" + currentMonth + "&y=" + currentYear;
	// }
	// else {
	// 	window.location = "/";
	// }
}
