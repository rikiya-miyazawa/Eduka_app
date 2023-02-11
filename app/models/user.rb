class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :teachings, dependent: :destroy
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  validates :email, presence: true, length: { maximum: 255 },
          format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  accepts_nested_attributes_for :profile, allow_destroy: true, update_only: true
end
