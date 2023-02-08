class Subject < ApplicationRecord
  belongs_to :education
  validates :name, presence: true,
                  length: { maximum: 100 }
  #boolean型のpresence: true
  validates :status, inclusion: {in: [true, false]}
end
