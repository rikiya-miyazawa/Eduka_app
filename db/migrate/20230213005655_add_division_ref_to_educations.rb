class AddDivisionRefToEducations < ActiveRecord::Migration[6.1]
  def change
    add_reference :educations, :division, null: false, foreign_key: true
  end
end
