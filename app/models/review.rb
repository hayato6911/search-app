class Review < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :score, presence: true
end
