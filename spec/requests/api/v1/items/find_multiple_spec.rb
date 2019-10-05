require 'rails_helper'

describe 'Items Search API' do
  it 'can find all merchants with particular id' do
    merchant = create(:merchant)
    item = create(:item, name: 'First', merchant: merchant)

    get "/api/v1/items/find_all?id=#{item.id}"

    expected = {
                  data: [{
                    id: "#{item.id}",
                    type: "item",
                    attributes: {
                      id: item.id,
                      name: "First",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant.id,
                    },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all items with the same name' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    item_1 = create(:item, name: 'Second', merchant: merchant_1)
    item_2 = create(:item, name: 'Second', merchant: merchant_2)

    get "/api/v1/items/find_all?name=Second"

    expected = {
                  data: [{
                    id: "#{item_1.id}",
                    type: "item",
                    attributes: {
                      id: item_1.id,
                      name: "Second",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant_1.id,
                    },
                  }, {
                    id: "#{item_2.id}",
                    type: "item",
                    attributes: {
                      id: item_2.id,
                      name: "Second",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant_2.id,
                    },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all items with the same name case insensitive' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    item_1 = create(:item, name: 'ThIrD', merchant: merchant_1)
    item_2 = create(:item, name: 'third', merchant: merchant_2)

    get "/api/v1/items/find_all?name=THIRD"

    expected = {
                  data: [{
                    id: "#{item_1.id}",
                    type: "item",
                    attributes: {
                      id: item_1.id,
                      name: "ThIrD",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant_1.id,
                    },
                  }, {
                    id: "#{item_2.id}",
                    type: "item",
                    attributes: {
                      id: item_2.id,
                      name: "third",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant_2.id,
                    },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all items with the same description' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    item_1 = create(:item, description: 'Fourth', merchant: merchant_1)
    item_2 = create(:item, description: 'Fourth', merchant: merchant_2)

    get "/api/v1/items/find_all?description=Fourth"

    expected = {
                  data: [{
                    id: "#{item_1.id}",
                    type: "item",
                    attributes: {
                      id: item_1.id,
                      name: "MyString",
                      description: "Fourth",
                      unit_price: 1,
                      merchant_id: merchant_1.id,
                    },
                  }, {
                    id: "#{item_2.id}",
                    type: "item",
                    attributes: {
                      id: item_2.id,
                      name: "MyString",
                      description: "Fourth",
                      unit_price: 1,
                      merchant_id: merchant_2.id,
                    },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all items with the same description case insensitive' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    item_1 = create(:item, description: 'FiFtH', merchant: merchant_1)
    item_2 = create(:item, description: 'fifth', merchant: merchant_2)

    get "/api/v1/items/find_all?description=FIFTH"

    expected = {
                  data: [{
                    id: "#{item_1.id}",
                    type: "item",
                    attributes: {
                      id: item_1.id,
                      name: "MyString",
                      description: "FiFtH",
                      unit_price: 1,
                      merchant_id: merchant_1.id,
                    },
                  }, {
                    id: "#{item_2.id}",
                    type: "item",
                    attributes: {
                      id: item_2.id,
                      name: "MyString",
                      description: "fifth",
                      unit_price: 1,
                      merchant_id: merchant_2.id,
                    },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all items with the same unit price' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    item_1 = create(:item, unit_price: 1, merchant: merchant_1)
    item_2 = create(:item, unit_price: 1, merchant: merchant_2)

    get "/api/v1/items/find_all?unit_price=1"

    expected = {
                  data: [{
                    id: "#{item_1.id}",
                    type: "item",
                    attributes: {
                      id: item_1.id,
                      name: "MyString",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant_1.id,
                    },
                  }, {
                    id: "#{item_2.id}",
                    type: "item",
                    attributes: {
                      id: item_2.id,
                      name: "MyString",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant_2.id,
                    },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all items with the same merchant' do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant)
    item_2 = create(:item, merchant: merchant)

    get "/api/v1/items/find_all?merchant_id=#{merchant.id}"

    expected = {
                  data: [{
                    id: "#{item_1.id}",
                    type: "item",
                    attributes: {
                      id: item_1.id,
                      name: "MyString",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant.id,
                    },
                  }, {
                    id: "#{item_2.id}",
                    type: "item",
                    attributes: {
                      id: item_2.id,
                      name: "MyString",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant.id,
                    },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all items with the same created at' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    item_1 = create(:item, merchant: merchant_1)
    item_2 = create(:item, merchant: merchant_2)

    get "/api/v1/items/find_all?created_at=#{item_1.created_at}"

    expected = {
                  data: [{
                    id: "#{item_1.id}",
                    type: "item",
                    attributes: {
                      id: item_1.id,
                      name: "MyString",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant_1.id,
                    },
                  }, {
                    id: "#{item_2.id}",
                    type: "item",
                    attributes: {
                      id: item_2.id,
                      name: "MyString",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant_2.id,
                    },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all items with the same updated at' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    item_1 = create(:item, merchant: merchant_1)
    item_2 = create(:item, merchant: merchant_2)

    get "/api/v1/items/find_all?updated_at=#{item_1.updated_at}"

    expected = {
                  data: [{
                    id: "#{item_1.id}",
                    type: "item",
                    attributes: {
                      id: item_1.id,
                      name: "MyString",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant_1.id,
                    },
                  }, {
                    id: "#{item_2.id}",
                    type: "item",
                    attributes: {
                      id: item_2.id,
                      name: "MyString",
                      description: "MyString",
                      unit_price: 1,
                      merchant_id: merchant_2.id,
                    },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end
