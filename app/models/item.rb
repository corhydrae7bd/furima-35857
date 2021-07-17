class Item < ApplicationRecord
  belongs_to :user
  has_one :record
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :days_to_ship


  with_options presence: true do
    validates :images
    validates :items_name
    validates :items_description
    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters", allow_blank: true}
  end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range", allow_blank: true}

  with_options numericality: { other_than: 1, message:"can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :prefecture_id
    validates :days_to_ship_id
  end

end
