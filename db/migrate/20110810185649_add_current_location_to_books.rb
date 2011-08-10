class AddCurrentLocationToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :current_location, :string
  end

  def self.down
    remove_column :books, :current_location
  end
end
