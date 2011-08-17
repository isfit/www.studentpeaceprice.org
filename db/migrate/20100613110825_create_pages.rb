class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title_en
      t.text :ingress_en
      t.text :body_en

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
