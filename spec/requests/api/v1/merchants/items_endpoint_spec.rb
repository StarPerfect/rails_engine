require 'rails_helper'

describe 'Merchants Items API' do
  it 'displays all items for a particular merchant' do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant)
    item_2 = create(:item, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    expected = { data: [
                      {
                      id: "#{item_1.id}",
                      type: "item",
                      attributes: {
                      name: "MyString",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant.id,
                      },
                      },
                      {
                      id: "#{item_2.id}",
                      type: "item",
                      attributes: {
                      name: "MyString",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant.id,
                      },
                      },
                    ]
                  }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end
