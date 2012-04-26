class Task < ActiveRecord::Base
  attr_accessible :title, :description, :current_state
  
  belongs_to :user
  
  has_many :prerequisites, :dependent => :destroy
  
  accepts_nested_attributes_for :prerequisites
  
  def next_state
    case current_state
    when 'Not Yet Started'
      'Started'
    when 'Started'
      'Completed'
    end
  end
end
