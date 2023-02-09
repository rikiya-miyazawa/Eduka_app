class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.string :purpose
      t.date :education_period
      t.date :created_date
      t.text :remarks
      t.references :education, null: false, foreign_key: true

      t.timestamps
    end
  end
end
