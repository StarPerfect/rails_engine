require 'rails_helper'

describe 'Merchant Search API' do
  it 'find a single merchants based on id' do
    merchant = create(:merchant, name: 'FirstTest')

    get "/api/v1/merchants/find?id=#{merchant.id}"

    expected = {
                "data": {
                  "id": "#{merchant.id}",
                  "type": "merchant",
                  "attributes": {
                    "id": merchant.id,
                    "name": "FirstTest"
                  }
                }
              }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single merchants based on name' do
    merchant = create(:merchant, name: 'SecondTest')

    get "/api/v1/merchants/find?name=#{merchant.name}"

    expected = {
                "data": {
                  "id": "#{merchant.id}",
                  "type": "merchant",
                  "attributes": {
                    "id": merchant.id,
                    "name": "SecondTest"
                  }
                }
              }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single merchants based on name case independent' do
    merchant = create(:merchant, name: 'Queen Bee')

    get "/api/v1/merchants/find?name=#{merchant.name.downcase}"

    expected = {
                "data": {
                  "id": "#{merchant.id}",
                  "type": "merchant",
                  "attributes": {
                    "id": merchant.id,
                    "name": "Queen Bee"
                  }
                }
              }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single merchants based on created timestamp' do
    merchant = create(:merchant, name: 'FourthTest')

    get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

    expected = {
                "data": {
                  "id": "#{merchant.id}",
                  "type": "merchant",
                  "attributes": {
                    "id": merchant.id,
                    "name": "FourthTest"
                  }
                }
              }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single merchants based on updated timestamp' do
    merchant = create(:merchant, name: 'FifthTest')

    get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"

    expected = {
                "data": {
                  "id": "#{merchant.id}",
                  "type": "merchant",
                  "attributes": {
                    "id": merchant.id,
                    "name": "FifthTest"
                  }
                }
              }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end
