class Location < ApplicationRecord
  mount_uploader :location_image, ImageUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many :reviews, dependent: :destroy

  belongs_to :user, optional: true
end
