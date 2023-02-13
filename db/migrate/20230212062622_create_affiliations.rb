class CreateAffiliations < ActiveRecord::Migration[6.1]
  def change
    create_table :affiliations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :division, null: false, foreign_key: true

      t.timestamps
    end
  end
end
