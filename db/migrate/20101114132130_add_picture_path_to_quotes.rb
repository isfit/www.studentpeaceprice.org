class AddPicturePathToQuotes < ActiveRecord::Migration
  def self.up
    add_column :quotes, :picture_path, :string
  end

  def self.down
    remove_column :quotes, :picture_path
  end
end
