class Profile < ApplicationRecord
  has_attached_file :profile_pic,
                    styles: { thumb: ["250x250#", :jpg] }
  validates_attachment :profile_pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  belongs_to :user
  validates :age, :location, :bio, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
end
