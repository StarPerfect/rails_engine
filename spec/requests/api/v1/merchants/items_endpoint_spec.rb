require 'rails_helper'

describe 'Merchants Items API' do
  it 'displays all items for a particular merchant' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    item_1 = create(:item, merchant: merchant_1)
    item_2 = create(:item, merchant: merchant_1)
    item_3 = create(:item, merchant: merchant_2)

    get "/api/v1/merchants/#{merchant_1.id}/items"

    expected = { data: [
                      {
                      id: "#{item_1.id}",
                      type: "item",
                      attributes: {
                        id: item_1.id,
                        name: "MyString",
                        description: "MyString",
                        unit_price: 2,
                        merchant_id: merchant_1.id,
                      },
                      },
                      {
                      id: "#{item_2.id}",
                      type: "item",
                      attributes: {
                        id: item_2.id,
                        name: "MyString",
                        description: "MyString",
                        unit_price: 2,
                        merchant_id: merchant_1.id,
                      },
                      },
                    ]
                  }

    items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
    expect(items["data"][0]["id"]).to eq("#{item_1.id}")
    expect(items["data"][1]["id"]).to eq("#{item_2.id}")
    expect(items["data"].count).to eq(2)
    expect(items["data"][0]["attributes"]["merchant_id"]).to eq(merchant_1.id)
    expect(items["data"][1]["attributes"]["merchant_id"]).to eq(merchant_1.id)
  end
end
