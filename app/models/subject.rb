class Subject < ApplicationRecord
  belongs_to :education
  validates :name, presence: true,
                  length: { maximum: 100 }
  enum status: { "未": false, '合格': true }
end
