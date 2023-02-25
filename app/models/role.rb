class Role < ApplicationRecord
  validates :name, presence: true,
            length: { maximum: 100 }
  has_many :positions, dependent: :destroy
  has_many :users, through: :positions, source: :user
end
