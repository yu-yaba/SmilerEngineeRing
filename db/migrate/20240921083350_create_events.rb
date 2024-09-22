class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events, id: false do |t|
      t.string :event_id, null: false, primary_key: true, limit: 36  # event_id を主キーとして設定
      t.string :user_id, null: false, limit: 36  # 外部キーとして user_id を追加
      t.string :name, null: false, limit: 100
      t.date :event_date
      t.text :description
      t.string :url, limit: 255

      t.timestamps
    end

    add_foreign_key :events, :users, column: :user_id, primary_key: :user_id
    add_index :events, :user_id
    add_index :events, :name
    add_index :events, :event_date
  end
end
