class User < ApplicationRecord
  has_secure_password
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :trips
  has_one :profile
  validates :first_name, :last_name, :email, :user_name, presence: true
  validates :email, :user_name, uniqueness: { case_sensitive: false }
end
