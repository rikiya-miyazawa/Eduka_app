class Division < ApplicationRecord
  validates :name, presence: true,
                  length: { maximum: 200 }
end
