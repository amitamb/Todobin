class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :user_time, :user_date
  
  def user_time
		#offset_seconds = ( current_user.timezone_offset || 0 ) * -1 * 60
		#Time.now.utc.localtime(offset_seconds)
		current_user.local_time
  end
  
  def user_date
		#user_time.to_date
		current_user.local_date
  end
end
