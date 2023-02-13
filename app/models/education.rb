class Education < ApplicationRecord
  belongs_to :user
  belongs_to :division
  has_one :status, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :assigns, dependent: :destroy
  has_many :assign_users, through: :assigns, source: :user
  validates :name, presence: true,
                  length: { maximum: 100 }
  accepts_nested_attributes_for :status, allow_destroy: true, update_only: true
end
