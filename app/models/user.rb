class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  validates_presence_of :email, :name

  has_many :books, :foreign_key => 'owner_id'
  has_many :loans, :foreign_key => 'with_id', :class_name => 'Book'

  def to_s
    self.name
  end
end
