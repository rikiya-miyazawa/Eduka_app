class Education < ApplicationRecord
  belongs_to :user
  belongs_to :division
  has_one :status, dependent: :destroy
  has_many :subjects, dependent: :destroy
  validates :name, presence: true,
            length: { maximum: 100 }
  accepts_nested_attributes_for :status, allow_destroy: true, update_only: true
  scope :latest, -> {order(created_at: :desc)}
  def user_name
    user.profile.name
  end
end
