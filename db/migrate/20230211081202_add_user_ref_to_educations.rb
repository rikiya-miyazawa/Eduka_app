class AddUserRefToEducations < ActiveRecord::Migration[6.1]
  def change
    add_reference :educations, :user, null: false, foreign_key: true
  end
end
