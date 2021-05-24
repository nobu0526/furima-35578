FactoryBot.define do
  factory :item do
    name               {"商品"}
    description        {"説明"}
    price              {1000}
    category_id        {2}
    status_id          {2}
    charge_id          {2}
    shipping_area_id   {2}
    shipping_day_id    {2}
    association :user

  after(:build) do |item|
    item.image.attach(io: File.open("spec/images/sample1.png"), filename: "sample1.png")
  end
 end
end
