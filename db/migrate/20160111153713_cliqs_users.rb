class CliqsUsers < ActiveRecord::Migration
  def change
    create_table :cliqs_users, :id => false do |t|
      t.integer :user_id
      t.integer :cliq_id
    end
  end
end
