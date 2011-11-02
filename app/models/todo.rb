class Todo < ActiveRecord::Base
	def scheduled_on_day(day)
		where("date(scheduled_day) = ?",day)
	end
	
	def by_day()
		group("date(scheduled_day)")
	end
end
