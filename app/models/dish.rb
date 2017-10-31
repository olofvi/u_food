class Dish < ApplicationRecord
  belongs_to :dish_category
  belongs_to :restaurant
  has_many :menu_lines
  has_many :menus, through: :menu_lines
  has_attached_file :image,
                    storage: :s3,
                    s3_credentials: {
                        bucket: ENV['AWS_BUCKET'],
                        access_key_id: ENV['AWS_ACCESS_KEY'],
                        secret_access_key: ENV['AWS_SECRET_KEY'],
                        s3_region: ENV['AWS_REGION'],
                        url: ':s3_domain_url',
                        s3_host_name: "s3-#{ENV['AWS_REGION']}.amazonaws.com"
                    },
                    default_url: "/#{Rails.root}public/default_pic.jpg"

  validates_attachment :image,
                       content_type:
                           {content_type: %w(image/jpg image/jpeg image/png image/gif)}

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
end
