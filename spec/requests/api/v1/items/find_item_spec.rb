require 'rails_helper'

describe 'Items Search API' do
  it 'can find a single item based on id' do
    merchant = create(:merchant)
    item = create(:item, name: 'FirstItem', merchant: merchant)

    get "/api/v1/items/find?id=#{item.id}"

    expected = {
                  data: {
                    id: "#{item.id}",
                    type: "item",
                    attributes: {
                      id: item.id,
                      name: "FirstItem",
                      description: "MyString",
                      unit_price: 2,
                      merchant_id: merchant.id,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find a single item based on name' do
    merchant = create(:merchant)
    item = create(:item, name: 'SecondItem', merchant: merchant)

    get "/api/v1/items/find?name=#{item.name}"

    expected = {
                  data: {
                    id: "#{item.id}",
                    type: "item",
                    attributes: {
                      id: item.id,
                      name: "SecondItem",
                      description: "MyString",
                      unit_price: 2,
                      merchant_id: merchant.id,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find a single item based on case insensitive name' do
    merchant = create(:merchant)
    item = create(:item, name: 'ThirdItem', merchant: merchant)

    get "/api/v1/items/find?name=#{item.name.downcase}"

    expected = {
                  data: {
                    id: "#{item.id}",
                    type: "item",
                    attributes: {
                      id: item.id,
                      name: "ThirdItem",
                      description: "MyString",
                      unit_price: 2,
                      merchant_id: merchant.id,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find a single item based on description' do
    merchant = create(:merchant)
    item = create(:item, name: 'FourthItem', merchant: merchant)

    get "/api/v1/items/find?description=#{item.description}"

    expected = {
                  data: {
                    id: "#{item.id}",
                    type: "item",
                    attributes: {
                      id: item.id,
                      name: "FourthItem",
                      description: "MyString",
                      unit_price: 2,
                      merchant_id: merchant.id,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find a single item based on case insensitive description' do
    merchant = create(:merchant)
    item = create(:item, name: 'FifthItem', merchant: merchant)

    get "/api/v1/items/find?description=#{item.description.downcase}"

    expected = {
                  data: {
                    id: "#{item.id}",
                    type: "item",
                    attributes: {
                      id: item.id,
                      name: "FifthItem",
                      description: "MyString",
                      unit_price: 2,
                      merchant_id: merchant.id,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find a single item based on unit price' do
    merchant = create(:merchant)
    item = create(:item, name: 'SixthItem', merchant: merchant)

    get "/api/v1/items/find?unit_price=#{item.unit_price}"

    expected = {
                  data: {
                    id: "#{item.id}",
                    type: "item",
                    attributes: {
                      id: item.id,
                      name: "SixthItem",
                      description: "MyString",
                      unit_price: 2,
                      merchant_id: merchant.id,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find a single item based on created_at' do
    merchant = create(:merchant)
    item = create(:item, name: 'SeventhItem', merchant: merchant)

    get "/api/v1/items/find?created_at=#{item.created_at}"

    expected = {
                  data: {
                    id: "#{item.id}",
                    type: "item",
                    attributes: {
                      id: item.id,
                      name: "SeventhItem",
                      description: "MyString",
                      unit_price: 2,
                      merchant_id: merchant.id,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find a single item based on updated_at' do
    merchant = create(:merchant)
    item = create(:item, name: 'EigthItem', merchant: merchant)

    get "/api/v1/items/find?updated_at=#{item.updated_at}"

    expected = {
                  data: {
                    id: "#{item.id}",
                    type: "item",
                    attributes: {
                      id: item.id,
                      name: "EigthItem",
                      description: "MyString",
                      unit_price: 2,
                      merchant_id: merchant.id,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find a single item based on merchant id' do
    merchant = create(:merchant)
    item = create(:item, name: 'NinthItem', merchant: merchant)

    get "/api/v1/items/find?merchant_id=#{merchant.id}"

    expected = {
                  data: {
                    id: "#{item.id}",
                    type: "item",
                    attributes: {
                      id: item.id,
                      name: "NinthItem",
                      description: "MyString",
                      unit_price: 2,
                      merchant_id: merchant.id,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end
