FactoryBot.define do
  factory :transaction do
    invoice { nil }
    credit_card_number { "MyString" }
    credit_cart_expiration_date { "MyString" }
    result { "MyString" }
  end
end
