class Status < ApplicationRecord
  belongs_to :education
  validates :purpose, presence: true
  validates :remarks, length: { maximum: 5000 }
  # validates :education_period, comparison: { greater_than: :created_date }
  validate :date_check

  private

  def date_check
    if education_period.present? && created_date.present?
      if education_period < created_date
        errors.add(:education_period, 'は開始日より前の日を設定することはできません。')
      end
    end
  end
end
