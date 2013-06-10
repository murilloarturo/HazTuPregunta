class User < ActiveRecord::Base
  	devise :database_authenticatable, :recoverable, 
         	:rememberable, :trackable, :validatable, :registerable 
  	
  	attr_accessible :login, :name, :lname, :username, :email, :password, :password_confirmation, 
                  	:remember_me

  validates_uniqueness_of :username

    # Virtual attribute for authenticating by either username or email
	# This is in addition to a real persisted field like 'username'
	attr_accessor :login

	# app/models/user.rb

    def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end

	### This is the correct method you override with the code above
	### def self.find_for_database_authentication(warden_conditions)
	### end 
end