class AddDeletedToTabs < ActiveRecord::Migration
  def change
  	add_column :tabs, :deleted, :boolean, :default => false
  end
end
