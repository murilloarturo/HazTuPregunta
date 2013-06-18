class Qcomment < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
  attr_accessible :question_id, :text, :user_id
  

  validates_presence_of :text
end
