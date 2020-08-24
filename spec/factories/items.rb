FactoryBot.define do
  Faker::Config.locale = :ja
  factory :item do
    name               {Faker::Games::Pokemon.name }
    info               {Faker::Lorem.sentence}
    price              {500}
    category           {Category.all.sample}
    sales_status       {SalesStatus.all.sample}
    delivery_fee       {DeliveryFee.all.sample}
    shipping_area      {ShippingArea.all.sample}
    scheduled_delivery {ScheduledDelivery.all.sample}
    association :user  
  end
end
