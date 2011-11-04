class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :timezone_offset
  
  has_many :todos
  
  def self.send_daily_todo_emails
		User.all.each do |user|
			TodoMailer.daily_todo_email(user).deliver
		end
  end
  
  def local_time
		offset_seconds = ( timezone_offset || 0 ) * -1 * 60
		Time.now.utc.localtime(offset_seconds)
  end
  
  def local_date
		local_time.to_date
  end
  
end
