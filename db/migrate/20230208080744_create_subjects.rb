class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.boolean :status, default: false, null: false
      t.date :deadline
      t.references :education, null: false, foreign_key: true

      t.timestamps
    end
  end
end
