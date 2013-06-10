class User < ActiveRecord::Base
  	devise :database_authenticatable, :recoverable, 
         	:rememberable, :trackable, :validatable, :registerable 
  	attr_accessible :user, :email, :password, :password_confirmation, 
                  	:remember_me
end