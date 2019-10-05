FactoryBot.define do
  factory :transaction do
    credit_card_number { "MyString" }
    credit_card_expiration_date { "" }
    result { "success" }
    created_at {"2019-10-02 14:54:43"}
    updated_at {"2019-10-03 14:54:43"}
    invoice
  end
end
