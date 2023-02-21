class Subject < ApplicationRecord
  belongs_to :education
  belongs_to :user
  has_many :teachings, dependent: :destroy
  validates :name, presence: true,
                  length: { maximum: 100 }
  enum status: { "未": false, '合格': true }
end
