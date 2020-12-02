class Item < ApplicationRecord
  attachment :image
  belongs_to :user

  with_options presence: true do
    validates :item_name
    validates :location
    validates :price
    validates :content
    validates :image
  end
end
