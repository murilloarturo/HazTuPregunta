class Question < ActiveRecord::Base
  include PublicActivity::Common
  
  belongs_to :user
  has_many :qcomments, 	:dependent => :delete_all
  has_many :answers, 	:dependent => :delete_all
  has_many :acomments, 	:dependent => :delete_all
  accepts_nested_attributes_for :answers
  attr_accessible :title, :text, :user_id, :mejor_respuesta
  

  validates_presence_of :title
end
