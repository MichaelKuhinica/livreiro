class AddIsbnToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :ISBN, :string
  end

  def self.down
    remove_column :books, :ISBN
  end
end
