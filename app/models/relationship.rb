class Relationship < ApplicationRecord
  belongs_to :superior, class_name: "User"
  belongs_to :subordinate, class_name: "User"
  validates_uniqueness_of :superior_id, scope: :subordinate_id
end
