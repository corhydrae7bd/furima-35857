require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  it 'imageが空では出品できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it 'items_nameが空では出品できない' do
    @item.items_name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Items name can't be blank")
  end

  it 'items_descriptionが空では出品できない' do
    @item.items_description = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Items description can't be blank")
  end

  it 'category_idが空では出品できない' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end

  it 'condition_idが空では出品できない' do
    @item.condition_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end

  it 'burden_idが空では出品できない' do
    @item.burden_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Burden can't be blank")
  end

  it 'prefecture_idが空では出品できない' do
    @item.prefecture_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end

  it 'days_to_ship_idが空では出品できない' do
    @item.days_to_ship_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Days to ship can't be blank")
  end

  it 'priceが空では出品できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it 'priceが¥300より少ない時は出品できない' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is out of setting range")
  end

  it 'priceが¥9999999より多い時は出品できない' do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is out of setting range")
  end

  it 'priceが半角でないと出品できない' do
    @item.price = "３０００"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
  end
end