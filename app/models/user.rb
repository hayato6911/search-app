class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        validates :username, presence: true
  def update_without_current_password(params, *options)
    params.delete(:current_password)
      
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
      
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
  
  has_many :locations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :username,        presence: true
  validates :password,        presence: true
  validates :email,           presence: true,uniqueness: true
  
  def already_favorited?(location)
    self.favorites.exists?(location_id: location.id)
  end
end
