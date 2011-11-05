class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :user_time, :user_date
  
  def user_time
		current_user.local_time
  end
  
  def user_date
		current_user.local_date
  end
end
