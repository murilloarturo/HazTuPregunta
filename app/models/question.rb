class Question < ActiveRecord::Base
  include PublicActivity::Common
  
  belongs_to :user
  has_many :qcomments
  has_many :answers
  has_many :acomments
  accepts_nested_attributes_for :answers
  attr_accessible :title, :text, :user_id, :mejor_respuesta
  

  validates_presence_of :title
end
