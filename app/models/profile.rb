class Profile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true,
                  length: { maximum: 100 }
  validates :job, length: { maximum: 100 }
  def self.ransackable_attributes(auth_object = nil)
    %w(name job)
  end
  def self.ransackable_associations(auth_object = nil) 
    %w(job)
  end
end
