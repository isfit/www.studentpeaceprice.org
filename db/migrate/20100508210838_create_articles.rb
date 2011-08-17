class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title_en
      t.string :title_no
      t.text :ingress_en
      t.text :ingress_no
      t.text :body_en
      t.text :body_no
      t.boolean :press_release
      t.boolean :deleted
      t.boolean :visible

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
