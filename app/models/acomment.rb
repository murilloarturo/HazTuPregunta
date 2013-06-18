class Acomment < ActiveRecord::Base
	belongs_to :answer
	belongs_to :user
	belongs_to :question
  attr_accessible :answer_id, :text, :user_id, :question_id
  

  validates_presence_of :text
end
