class Education < ApplicationRecord
  has_one :status
  has_many :subjects
  validates :name, presence: true,
                  length: { maximum: 100 }
end
