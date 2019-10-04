FactoryBot.define do
  factory :invoice_item do
    quantity { 1 }
    unit_price { 2 }
    created_at {"2019-10-02 14:54:43"}
    updated_at {"2019-10-03 14:54:43"}
    item
    invoice
  end
end
