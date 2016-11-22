class User < ApplicationRecord

  has_many :locations
	attr_accessor :remember_token, :activation_token, :reset_token

	before_save { email.downcase! }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :fname, presence: true, length: { maximum: 20 }
	validates :lname, presence: true, length: { maximum: 20 }
	validates :email, presence: true, length: { maximum: 255 },
	 					format: { with: VALID_EMAIL_REGEX },
	  					uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true


	after_initialize :init_config
	def init_config
      self.point  ||= 0          #will set the default value of point only if it's nil
    end

end
