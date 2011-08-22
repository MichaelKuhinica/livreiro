# encoding: UTF-8
class Book < ActiveRecord::Base
  scope :free, where("with_id is null")
  scope :lent, where("with_id is not null")

  Locations = ["SP", "MG"]
  Categories = ["Gestão empresarial", "Auto ajuda", "Gastronomia", "Dicionários e Gramática", "Engenharia e Tecnologia", "Empreendedorismo e inovação", "Outros"]

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
