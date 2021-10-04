class Location < ApplicationRecord
  mount_uploader :location_image, ImageUploader
  belongs_to :user, optional: true
end
