class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people, id: false do |t|
      t.string :person_id, null: false, primary_key: true, limit: 36  # person_id を主キーとして設定
      t.string :user_id, null: false, limit: 36  # 外部キーとして user_id を追加
      t.string :name, null: false, limit: 100
      t.string :phone_number, limit: 20
      t.string :email, limit: 100
      t.text :address
      t.string :organization, limit: 100
      t.date :met_date
      t.text :notes
      t.string :url, limit: 255

      t.timestamps
    end

    add_foreign_key :people, :users, column: :user_id, primary_key: :user_id
    add_index :people, :user_id
    add_index :people, :name
    add_index :people, :phone_number
    add_index :people, :email
  end
end
