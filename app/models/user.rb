class User < ActiveRecord::Base
  attr_accessible :email_address, :password
  
  acts_as_authentic do |c|
    c.merge_validates_format_of_email_field_options :message => "should look like an email address"
    c.validate_login_field = false
    c.validate_password_field = false
  end
  
  has_many :tasks
  
  validates_with MyPasswordValidator
  
  validates_format_of :password,
                      :if => :require_password?,
                      :with => /^(?=.*\d).{6,}$/,
                      :message => "must be at least 6 characters long",
                      :allow_blank => true
                      
  validates           :email_address,
                      :length => {
                        :maximum => 100
                      },
                      :format => {
                        :with => Authlogic::Regex.email,
                        :allow_blank => true,
                        :message => "should look like an email address"
                      },
                      :allow_blank => false
                      
end
