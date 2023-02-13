class Relationship < ApplicationRecord
  belongs_to :superior, class_name: "User"
  belongs_to :subordinate, class_name: "User"
end
