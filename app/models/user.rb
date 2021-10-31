class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        validates :username, presence: true
  
  has_many :locations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :username,        presence: true
  validates :password,        presence: true, on: :create
  validates :email,           presence: true,uniqueness: true
  
  def already_favorited?(location)
    self.favorites.exists?(location_id: location.id)
  end
end
