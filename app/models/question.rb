class Question < ActiveRecord::Base
  belongs_to :user
  has_many :qcomments
  has_many :answers
  has_many :acomments
  accepts_nested_attributes_for :answers
  attr_accessible :title, :user_id
end
