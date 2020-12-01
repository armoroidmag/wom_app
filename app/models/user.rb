class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #mount_uploader :profile_image, ImageUploader
  attachment :profile_image
  has_many :items, dependent: :destroy
end
