class TodoMailer < ActionMailer::Base
  default from: "amit@castbin.com"
  
  def daily_todo_email() #user, todos)
		#@user = user
		@todos = ["Go home", "Go to sleep"]
    mail(:to => "#{ 'amit ambardekar' } <#{ 'amitamb@gmail.com' }>", :subject => "Daily todo list")
  end
end
