class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.boolean :clique_only, default: false
      t.boolean :removed, default: false
      t.belongs_to :poster
      t.datetime :created_at
      t.timestamps null: false
    end
  end
end
