class Prerequisite < ActiveRecord::Base
  attr_accessible :prereq, :tasks
  
  belongs_to :task
end
