class RecordAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :city, :house_number, :building_name, :phone_number, :prefecture_id, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ , message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }

  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    record = Record.create( user_id: user_id, item_id: item_id )
    Address.create(postal_code: postal_code, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, prefecture_id: prefecture_id, record_id: record.id)
  end
end