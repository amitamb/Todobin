module TodosHelper
	def capitalise_sentense(todo_text)
		todo_text.split(/\. /).map { |sen| sen.capitalize }.join(". ")
	end
	
	def day_in_year(date)
		(date.to_date - date.to_date.beginning_of_year).to_i
	end
end
