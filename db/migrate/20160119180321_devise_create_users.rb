class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      # Basic Info
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :birthday
      t.string :phone
      t.string :username
      t.integer :type
      # Pictures
      t.attachment :profile_picture
      t.attachment :cover_picture
      t.string :cover_picture_url
      t.string :profile_picture_url
      t.text :bio
      # Location
      t.string :location
      t.string :address
      t.string :city
      t.string :country
      # Contact
      t.string :email
      t.string :soundcloud_name
      t.timestamps null: false
      # Omniauth
      t.string :provider
      t.string :uid
      # Devise
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      # Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      # Rememberable
      t.datetime :remember_created_at
      # Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      # Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email
      t.timestamps null: false
      # Lockable
      t.integer  :failed_attempts, default: 0 # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at
      t.timestamps null: false
    end
    add_index :users, :email,                unique: true
  end
end
