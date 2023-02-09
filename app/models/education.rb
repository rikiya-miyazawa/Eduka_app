class Education < ApplicationRecord
  has_one :status
  has_many :subjects
  validates :name, presence: true,
                  length: { maximum: 100 }
  accepts_nested_attributes_for :status, allow_destroy: true, update_only: true
end
