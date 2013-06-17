class Qcomment < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
  attr_accessible :question_id, :text, :user_id
end
