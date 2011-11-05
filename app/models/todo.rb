class Todo < ActiveRecord::Base

	belongs_to :user
	
	def form_uid=(val)
		@form_id = val
	end
	
	def form_uid
		@form_id ||= SecureRandom.random_number(9999999)
	end
	
	def self.completed
		where(:complete => true)
	end
	
	def self.inprogress
		where(:complete => false)
	end
	
	def self.date_range(start_date, end_date)
		where( :scheduled_day => (start_date.to_date..end_date.to_date) )
	end
	
	def self.day_range(past_days, future_days, local_time)
		date_range(local_time+past_days.days, local_time+future_days.days)
	end
	
	def self.today(local_time)
		day_range(0, 1, local_time)
	end
	
	def self.current_week(local_time)
		day_range(0, 0, local_time)
	end

	def self.last_week(local_time)
		date_range((local_time - 1.week).beginning_of_week, local_time.beginning_of_week)
	end

	def self.last_5_days(local_time)
		day_range(-5, 0, local_time)
	end
	
	def self.current_5_days(local_time)
		day_range(-2, 3, local_time)
	end
	
	def self.yesterday(local_time)
		day_range(-1, 0, local_time)
	end
	
	def self.group_by_day()
		all.group_by { |todo| todo.scheduled_day.beginning_of_day }
	end

end
