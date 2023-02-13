class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :superior_id
      t.integer :subordinate_id

      t.timestamps
    end
    add_index :relationships, :superior_id
    add_index :relationships, :subordinate_id
    add_index :relationships, [:superior_id, :subordinate_id], unique:true
  end
end
