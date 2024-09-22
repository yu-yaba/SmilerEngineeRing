class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places, id: false do |t|
      t.string :place_id, null: false, primary_key: true, limit: 36  # place_id を主キーとして設定
      t.string :user_id, null: false, limit: 36  # 外部キーとして user_id を追加
      t.string :name, null: false, limit: 100
      t.text :address
      t.date :visited_date
      t.text :description
      t.string :url, limit: 255

      t.timestamps
    end

    add_foreign_key :places, :users, column: :user_id, primary_key: :user_id
    add_index :places, :user_id
    add_index :places, :name
    add_index :places, :visited_date
  end
end
