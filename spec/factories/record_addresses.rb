FactoryBot.define do
  factory :record_address do
    postal_code        { '123-4567' }
    prefecture_id      { 14 }
    city               { '横浜市緑区' }
    house_number       { '青山1-1-1' }
    building_name      { '柳ビル103' }
    phone_number       { '09012345678' }
    token              { 'tok_28588f7a2c9aab541662f9bec9fc' }
    association :user, factory: :user
    association :item, factory: :item
  end
end
