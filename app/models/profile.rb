class Profile < ApplicationRecord
  belongs_to :user
  validates :image, :age, :location, :bio, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
end
