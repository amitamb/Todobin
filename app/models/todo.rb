class Todo < ActiveRecord::Base

	belongs_to :user

	def scheduled_on_day(day)
		where("date(scheduled_day) = ?",day)
	end
	
	def by_day()
		group("date(scheduled_day)")
	end
end
