class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.belongs_to :song
      t.belongs_to :clique
      t.belongs_to :downloader
      t.timestamps null: false
    end
  end
end
