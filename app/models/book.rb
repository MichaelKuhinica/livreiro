class Book < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  belongs_to :with, :class_name => "User"
  validates_associated :owner
  validates_presence_of :owner, :title, :author
end
