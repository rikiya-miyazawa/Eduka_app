class Affiliation < ApplicationRecord
  belongs_to :user
  belongs_to :division
  def user_name
    user.profile.name
  end
end
