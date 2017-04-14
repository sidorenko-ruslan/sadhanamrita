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
	});
	
});
