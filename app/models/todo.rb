class Todo < ActiveRecord::Base

	belongs_to :user
	
	def form_uid=(val)
		@form_id = val
	end
	
	def form_uid
		@form_id ||= SecureRandom.random_number(9999999)
	end

	def scheduled_on_day(day)
		where("date(scheduled_day) = ?",day)
	end
	
	def by_day()
		group("date(scheduled_day)")
	end
end
