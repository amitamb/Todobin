class TodoMailer < ActionMailer::Base
	include ActionView::Helpers::TextHelper
  default from: "Todobin <no-reply@todobin.com>"
  
  def daily_todo_email(user)
		@user = user
		@todays_todos_inprogress = user.todos.today(user.local_time).inprogress
		@todays_todos_complete = user.todos.today(user.local_time).completed
		@todays_todos = user.todos.today(user.local_time)
		@yesterdays_todos_inprogress = user.todos.yesterday(user.local_time).inprogress
		@yesterdays_todos_complete = user.todos.yesterday(user.local_time).completed
		@yesterdays_todos = user.todos.yesterday(user.local_time)

		puts "Sending email to " + user.email
		
		@subject = @todays_todos_inprogress.empty? ? "Use Todobin" : "Todobin - #{ @todays_todos_inprogress[0].text }" + ( @todays_todos_inprogress.length > 1 ? " and #{ pluralize(@todays_todos_inprogress.length, "things").sub(" ", " more ") } to do today" : "" )
		
    mail(:to => "#{ user.email } <#{ user.email }>", :subject => @subject)
  end
end
