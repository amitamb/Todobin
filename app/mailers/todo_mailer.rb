class TodoMailer < ActionMailer::Base
  default from: "amit@todobin.com"
  
  def daily_todo_email(user)
		@user = user
		@todos = user.todos #todays_
		#@yesterdays_todos = user.yesterdays_todos
		#@past_todos = user.past_todos
		puts "Sending email to " + user.email
		
    mail(:to => "#{ user.email } <#{ user.email }>", :subject => "Daily todo list")
  end
end
