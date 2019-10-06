FactoryBot.define do
  factory :invoice do
    status { "MyString" }
    created_at {"2019-10-02 14:54:43"}
    updated_at {"2019-10-03 14:54:43"}
    customer
    merchant
  end
end
