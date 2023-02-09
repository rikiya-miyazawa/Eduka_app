class CreateTeachings < ActiveRecord::Migration[6.1]
  def change
    create_table :teachings do |t|
      t.date :date, null: false
      t.string :educator, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.text :advice
      t.text :remarks
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
