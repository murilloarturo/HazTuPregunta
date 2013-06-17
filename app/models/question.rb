class Question < ActiveRecord::Base
  belongs_to :user
  has_many :qcomments
  has_many :answers
  attr_accessible :title, :user_id
end
