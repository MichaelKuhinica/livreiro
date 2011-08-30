# encoding: UTF-8
class Book < ActiveRecord::Base
  scope :free, where("with_id is null")
  scope :lent, where("with_id is not null")

  Locations = ["SP", "MG"]
  Categories = ["Gestão empresarial", "Auto ajuda", "Gastronomia", "Dicionários e Gramática", "Engenharia e Tecnologia", "Empreendedorismo e inovação", "Outros"]

  searchable do
    text :title, :default_boost => 3
    text :author, :default_boost => 2
    text :owner_name do 
      owner.name
    end
    text :category, :default_boost => 1
    text :isbn
    integer :owner_id, :references => User
  end

  def lend(user)
    self.with = user
    self.save!
  end

  def return
    self.with = nil
    self.save!
  end

  belongs_to :owner, :class_name => "User"
  belongs_to :with, :class_name => "User"
  validates_presence_of :owner, :title, :author
end
