FactoryBot.define do
  factory :item do
    association :user

    name                  { '商品名' }
    description           { '商品説明' }
    status_id             { 2 }
    cost_id               { 2 }
    area_id               { 2 }
    delivery_id           { 2 }
    category_id           { 2 }
    price                 { 300 }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
