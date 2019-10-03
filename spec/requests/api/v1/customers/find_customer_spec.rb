require 'rails_helper'

describe 'Customers Search API' do
  it 'find a single customer based on id' do
    customer = create(:customer, first_name: 'First')

    get "/api/v1/customers/find?id=#{customer.id}"

    expected = {
                data: {
                  id: "#{customer.id}",
                  type: "customer",
                  attributes: {
                    id: customer.id,
                    first_name: "First",
                    last_name: "MyString",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single customers based on name' do
    customer = create(:customer, first_name: 'Second')

    get "/api/v1/customers/find?first_name=#{customer.first_name}"

    expected = {
                data: {
                  id: "#{customer.id}",
                  type: "customer",
                  attributes: {
                    id: customer.id,
                    first_name: "Second",
                    last_name: "MyString",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single customers based on name case independent' do
    customer = create(:customer, first_name: 'Third')

    get "/api/v1/customers/find?last_name=#{customer.last_name.downcase}"

    expected = {
                data: {
                  id: "#{customer.id}",
                  type: "customer",
                  attributes: {
                    id: customer.id,
                    first_name: "Third",
                    last_name: "MyString",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single customers based on created timestamp' do
    customer = create(:customer, first_name: 'Fourth')

    get "/api/v1/customers/find?created_at=#{customer.created_at}"

    expected = {
                data: {
                  id: "#{customer.id}",
                  type: "customer",
                  attributes: {
                    id: customer.id,
                    first_name: "Fourth",
                    last_name: "MyString",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single customers based on updated timestamp' do
    customer = create(:customer, first_name: 'Fifth')

    get "/api/v1/customers/find?updated_at=#{customer.updated_at}"

    expected = {
                data: {
                  id: "#{customer.id}",
                  type: "customer",
                  attributes: {
                    id: customer.id,
                    first_name: "Fifth",
                    last_name: "MyString",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end
