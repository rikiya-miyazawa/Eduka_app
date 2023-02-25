class Teaching < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  validates :educator, presence: true,
            length: { maximum: 100 }
  validates :title, presence: true,
            length: { maximum: 150 }
  validates :content, presence: true,
            length: { maximum: 5000 }
  validates :advice, length: { maximum: 5000 }
  validates :remarks, length: { maximum: 5000 }
end
