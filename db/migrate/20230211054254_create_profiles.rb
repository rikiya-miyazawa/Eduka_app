class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.date :hire_date
      t.string :job
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
