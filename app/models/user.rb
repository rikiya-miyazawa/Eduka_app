class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :teachings, dependent: :destroy
  has_many :affiliations, dependent: :destroy
  has_many :affiliation_divisions, through: :affiliations, source: :division
  has_many :superior_relationships, foreign_key: 'superior_id', class_name: 'Relationship', dependent: :destroy
  has_many :subordinate_relationships, foreign_key: 'subordinate_id', class_name: 'Relationship', dependent: :destroy
  has_many :teaching, through: :superior_relationships, source: :subordinate
  has_many :taught, through: :subordinate_relationships, source: :superior
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  validates :email, presence: true, length: { maximum: 255 },
          format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  accepts_nested_attributes_for :profile, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :affiliations, allow_destroy: true, update_only: true
  def self.ransackable_attributes(auth_object = nil)
        %w(name)
  end
end
