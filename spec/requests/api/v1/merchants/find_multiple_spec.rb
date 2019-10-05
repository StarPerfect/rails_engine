require 'rails_helper'

describe 'Merchants Search API' do
  it 'can find all merchants by id' do
    merchant = create(:merchant, name: 'First')

    get "/api/v1/merchants/find_all?id=#{merchant.id}"

    expected = {
                "data": [{
                  "id": "#{merchant.id}",
                  "type": "merchant",
                  "attributes": {
                    "id": merchant.id,
                    "name": "First"
                    }
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all merchants with the same name' do
    merchant_1 = create(:merchant, name: 'Second')
    merchant_2 = create(:merchant, name: 'Second')
    merchant_3 = create(:merchant, name: 'Second')

    get '/api/v1/merchants/find_all?name=Second'

    expected = {
                "data": [{
                  "id": "#{merchant_1.id}",
                  "type": "merchant",
                  "attributes": {
                    "id": merchant_1.id,
                    "name": "Second"
                    }
                  }, {
                    "id": "#{merchant_2.id}",
                    "type": "merchant",
                    "attributes": {
                      "id": merchant_2.id,
                      "name": "Second"
                      }
                  }, {
                      "id": "#{merchant_3.id}",
                      "type": "merchant",
                      "attributes": {
                        "id": merchant_3.id,
                        "name": "Second"
                        }
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all merchants with the same name - case independent' do
    merchant_1 = create(:merchant, name: 'Third')
    merchant_2 = create(:merchant, name: 'ThIrD')
    merchant_3 = create(:merchant, name: 'third')

    get '/api/v1/merchants/find_all?name=third'

    expected = {
                "data": [{
                  "id": "#{merchant_1.id}",
                  "type": "merchant",
                  "attributes": {
                    "id": merchant_1.id,
                    "name": "Third"
                    }
                  }, {
                    "id": "#{merchant_2.id}",
                    "type": "merchant",
                    "attributes": {
                      "id": merchant_2.id,
                      "name": "ThIrD"
                      }
                  }, {
                      "id": "#{merchant_3.id}",
                      "type": "merchant",
                      "attributes": {
                        "id": merchant_3.id,
                        "name": "third"
                        }
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all merchants created at the same time' do
    merchant_1 = create(:merchant, name: 'Fourth')
    merchant_2 = create(:merchant, name: 'Fourth')

    get "/api/v1/merchants/find_all?created_at=#{merchant_1.created_at}"

    expected = {
                "data": [{
                  "id": "#{merchant_1.id}",
                  "type": "merchant",
                  "attributes": {
                    "id": merchant_1.id,
                    "name": "Fourth"
                    }
                  }, {
                    "id": "#{merchant_2.id}",
                    "type": "merchant",
                    "attributes": {
                      "id": merchant_2.id,
                      "name": "Fourth"
                      }
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all merchants updated at the same time' do
    merchant_1 = create(:merchant, name: 'Fifth')
    merchant_2 = create(:merchant, name: 'Fifth')

    get "/api/v1/merchants/find_all?updated_at=#{merchant_1.updated_at}"

    expected = {
                "data": [{
                  "id": "#{merchant_1.id}",
                  "type": "merchant",
                  "attributes": {
                    "id": merchant_1.id,
                    "name": "Fifth"
                    }
                  }, {
                    "id": "#{merchant_2.id}",
                    "type": "merchant",
                    "attributes": {
                      "id": merchant_2.id,
                      "name": "Fifth"
                      }
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end
