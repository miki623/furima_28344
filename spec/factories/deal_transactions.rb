FactoryBot.define do
  factory :deal_transaction do
    # :user_id, :item_id, :postal_code, :shipping_area_id, :city,
    #  :house_number, :building_name, :phone_number, :token

    postal_code         {"039-3501"}
    shipping_area_id    {ShippingArea.all.sample}
    city                {"青森市浅虫"}
    house_number        {"1-1"}
    phone_number        {"0752127757"}
    token               {"token"}
    # user {1}
    # item {1}
    association :user
    association :item
    # user_id {FactoryBot.create(:user).id}
    # item_id {FactoryBot.create(:item).id}
  end
end