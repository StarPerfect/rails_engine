FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyString" }
    unit_price { 1.5 }
    created_at {"2019-10-02 14:54:43"}
    updated_at {"2019-10-03 14:54:43"}
    merchant
  end
end
