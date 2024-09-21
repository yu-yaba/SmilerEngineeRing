# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' # PostgreSQLの場合。MySQLを使用している場合は不要です。

    create_table :users, id: :uuid do |t|
      ## Deviseのフィールド
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## 追加フィールド
      t.string :username, null: false, unique: true, limit: 50
      t.timestamp :last_login
      t.boolean :is_active, null: false, default: true

      ## その他のDeviseフィールド（必要に応じて追加）
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :username, unique: true
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end