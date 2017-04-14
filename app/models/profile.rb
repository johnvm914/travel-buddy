class Profile < ApplicationRecord
  has_attached_file :profile_pic,
                    styles: { thumb: ["250x250#", :jpg] },
                    storage: :s3,
                    s3_host_name: ENV['AWS_HOST_NAME'],
                    s3_region: ENV['AWS_REGION'],
                    s3_credentials: {
                      bucket: ENV['S3_BUCKET_NAME'],
                      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
                    }
  validates_attachment :profile_pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  belongs_to :user
  validates :age, :location, :bio, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
end
