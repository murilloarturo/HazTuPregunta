class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :acomments
  attr_accessible :question_id, :text, :user_id, :votos
  

  validates_presence_of :text
end
