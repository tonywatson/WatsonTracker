class Prerequisites < ActiveRecord::Base
  attr_accessible :tasks
  
  belongs_to :task
end
