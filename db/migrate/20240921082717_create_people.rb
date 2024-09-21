class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.references :user, uuid: true, null: false, foreign_key: true
      t.string :name
      t.string :phone_number
      t.string :email
      t.text :address
      t.string :organization
      t.date :met_date
      t.text :notes
      t.string :url

      t.timestamps
    end
  end
end
