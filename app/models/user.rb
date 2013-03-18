class User < ActiveRecord::Base
  attr_accessible :email, :user_name
  
  validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :user_name, presence: true

end
