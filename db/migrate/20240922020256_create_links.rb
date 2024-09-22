class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links, id: false do |t|
      t.string :link_id, null: false, primary_key: true, limit: 36  # link_id を主キーとして設定
      t.string :user_id, null: false, limit: 36

      t.string :from_node_type, null: false, limit: 10
      t.string :from_node_id, null: false, limit: 36
      t.string :to_node_type, null: false, limit: 10
      t.string :to_node_id, null: false, limit: 36


      t.timestamps
    end

    # 外部キー制約を設定する際に、参照先の主キーを指定
    add_foreign_key :links, :users, column: :user_id, primary_key: 'user_id'

    # ポリモーフィック関連付けのため、from_nodeとto_nodeへの外部キーは追加しません

    add_index :links, :user_id
    add_index :links, :from_node_type
    add_index :links, :from_node_id
    add_index :links, :to_node_type
    add_index :links, :to_node_id
    add_index :links, [:from_node_type, :from_node_id], name: 'index_links_on_from_node'
    add_index :links, [:to_node_type, :to_node_id], name: 'index_links_on_to_node'
  end
end
