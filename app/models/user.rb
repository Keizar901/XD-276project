class User < ApplicationRecord

	before_save { email.downcase! }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :fname, presence: true, length: { maximum: 20 }
	validates :lname, presence: true, length: { maximum: 20 }
	validates :email, presence: true, length: { maximum: 255 },
	 					format: { with: VALID_EMAIL_REGEX },
	  					uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }
	has_secure_password
	
	after_initialize :init_config
	def init_config
      self.point  ||= 0          #will set the default value of point only if it's nil
    end

end
