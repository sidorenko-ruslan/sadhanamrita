class HomeController < ApplicationController
	def index
		@years = (2015..2018)
		@months = [ { number: 1, name: "Январь" }, { number: 2, name: "Февраль" }, { number: 3, name: "Март" }, { number: 4, name: "Апрель" }, 
					{ number: 5, name: "Май" }, { number: 6, name: "Июнь" }, { number: 7, name: "Июль" }, { number: 8, name: "Август" }, 
					{ number: 9, name: "Сентябрь" }, { number: 10, name: "Октябрь" }, { number: 11, name: "Ноябрь" }, { number: 12, name: "Декабрь" } ]
	end

	def update_cell

	end
end
