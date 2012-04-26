class Task < ActiveRecord::Base
  attr_accessible :title, :description, :current_state
  
  belongs_to :user
  
  has_many :prerequisites
  
end
