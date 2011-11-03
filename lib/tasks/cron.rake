desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
	puts "I am cron"
  if Time.now.hour == 4 # run at 4 AM
    User.send_daily_todo_emails
  end
end
