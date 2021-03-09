FactoryBot.define do
  factory :purchase_form do

    post_code         { '111-1111' }
    area_id           { 2 }
    city              { '市区町村' }
    address           { '番地' }
    building_name     { '建物名' }
    phone_number      { '09012345678' }
    user_id         { '2' }
    item_id         { '2' }
    
  end
end

