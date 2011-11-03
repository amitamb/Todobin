class TodoMailer < ActionMailer::Base
  default from: "amit@todobin.com"
  
  def daily_todo_email(user)
		@user = user
		@todos = user.todos #todays_
		#@yesterdays_todos = user.yesterdays_todos
		#@past_todos = user.past_todos
    mail(:to => "#{ 'amit ambardekar' } <#{ 'amitamb@gmail.com' }>", :subject => "Daily todo list")
  end
end
