class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :name, null: false, limit: 100
      t.date :event_date
      t.text :description
      t.string :url, limit: 255

      t.timestamps
    end

    add_index :events, :name
    add_index :events, :event_date
  end
end
