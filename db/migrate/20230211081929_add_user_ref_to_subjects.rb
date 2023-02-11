class AddUserRefToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :subjects, :user, null: false, foreign_key: true
  end
end
