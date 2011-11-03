module TodosHelper
	def capitalise_sentense(todo_text)
		todo_text.split(/\. /).map { |sen| sen.capitalize }.join(". ")
	end
end
