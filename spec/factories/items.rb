FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    items_name            {'テスト商品'}
    items_description     {'テスト商品です'}
    category_id           {2}
    condition_id          {2}
    burden_id             {2}
    prefecture_id         {2}
    days_to_ship_id       {2}
    price                 {3000}
    association :user, factory: :user
  end
end
