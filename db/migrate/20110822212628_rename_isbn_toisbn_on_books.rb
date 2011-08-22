class RenameIsbnToisbnOnBooks < ActiveRecord::Migration
  def self.up
    rename_column :books, :ISBN, :isbn 
  end

  def self.down
    rename_column :books, :isbn, :ISBN
  end
end
