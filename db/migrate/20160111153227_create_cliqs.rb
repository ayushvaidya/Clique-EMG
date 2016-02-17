class CreateCliqs < ActiveRecord::Migration
  def change
    create_table :cliqs do |t|
      # Attributes
      t.string :name
      t.text :description
      t.text :thank_you_message
      t.decimal :price, :precision => 8, :scale => 2
      # Relations
      t.belongs_to :owner
      t.timestamps null: false
    end
  end
end
