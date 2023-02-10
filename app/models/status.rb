class Status < ApplicationRecord
  belongs_to :education
  validates :purpose, presence: true
  validates :remarks, length: { maximum: 5000 }
end
