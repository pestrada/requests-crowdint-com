class DeviseCreateUsers < ActiveRecord::Migration
  def change
    change_table(:voting_app_users) do |t|
      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.string   :authentication_token
      t.string   :uid
      t.string   :provider
    end

    add_index :voting_app_users, :email,                :unique => true
    add_index :voting_app_users, :authentication_token, :unique => true
  end
end
