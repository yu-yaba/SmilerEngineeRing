class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.string :user_id, null: false, primary_key: true, limit: 36  # user_id を主キーとして設定

      ## Deviseのフィールド
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## 追加フィールド
      t.string :username, null: false, limit: 50
      t.timestamp :last_login
      t.boolean :is_active, null: false, default: true

      ## Deviseのその他のフィールド
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :user_id, unique: true
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
