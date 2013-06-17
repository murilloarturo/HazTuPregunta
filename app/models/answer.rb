class Answer < ActiveRecord::Base
  belongs_to :question
  attr_accessible :question_id, :text, :user_id
end
