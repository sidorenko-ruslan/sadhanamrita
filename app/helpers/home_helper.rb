module HomeHelper
	def days_in_month(year, month)
  		Date.new(year, month, -1).day
	end
end
