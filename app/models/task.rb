class Task < ActiveRecord::Base
  attr_accessible :title, :description, :current_state, :prerequisites
  
  belongs_to :user
  
  serialize :prerequisites, Hash
end
