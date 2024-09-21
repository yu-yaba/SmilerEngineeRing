class CreateCustomFields < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_fields, id: false do |t|
      t.string :custom_field_id, null: false, primary_key: true, limit: 36  # custom_field_id を主キーとして設定
      t.string :user_id, null: false, limit: 36  # 外部キーとして user_id を追加
      t.string :entity_type, null: false, limit: 10
      t.string :entity_id, null: false, limit: 36
      t.string :field_name, null: false, limit: 100
      t.text :field_value, null: false

      t.timestamps
    end

    add_foreign_key :custom_fields, :users, column: :user_id, primary_key: :user_id
    add_index :custom_fields, :user_id
    add_index :custom_fields, [:entity_type, :entity_id]
  end
end
