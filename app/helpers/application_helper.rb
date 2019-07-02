module ApplicationHelper

	def datebr(date)
		date = date.strftime("%d/%m/%Y")
		date
	end

	def hourbr(hour)
		hour = hour.strftime("%H:%M")
		hour
	end

end
