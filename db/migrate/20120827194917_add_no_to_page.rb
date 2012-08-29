class AddNoToPage < ActiveRecord::Migration
  def change
    add_column :pages, :title_no, :string, :default => ""
    add_column :pages, :ingress_no, :text, :default => ""
    add_column :pages, :body_no, :text, :default => ""
  end
end
