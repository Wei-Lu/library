class Book < ActiveRecord::Base
  attr_accessible :author, :title

  validates :title, presence: true
  belongs_to :user	

end
