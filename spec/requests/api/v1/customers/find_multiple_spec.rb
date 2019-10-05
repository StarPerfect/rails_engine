require 'rails_helper'

describe 'Multiple Customers Search API' do
  it 'can find all customers by id' do
    customer = create(:customer)

    get "/api/v1/customers/find_all?id=#{customer.id}"

    expected = {
                data: [{
                  id: "#{customer.id}",
                  type: "customer",
                  attributes: {
                    id: customer.id,
                    first_name: "MyString",
                    last_name: "MyString",
                    },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all customers by first name' do
    customer_1 = create(:customer, first_name: 'First')
    customer_2 = create(:customer, first_name: 'First')

    get "/api/v1/customers/find_all?first_name=First"

    expected = {
                data: [{
                  id: "#{customer_1.id}",
                  type: "customer",
                  attributes: {
                    id: customer_1.id,
                    first_name: "First",
                    last_name: "MyString",
                    },
                  }, {
                    id: "#{customer_2.id}",
                    type: "customer",
                    attributes: {
                      id: customer_2.id,
                      first_name: "First",
                      last_name: "MyString",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all customers by first name - case insensitive' do
    customer_1 = create(:customer, first_name: 'FiRsT')
    customer_2 = create(:customer, first_name: 'first')

    get "/api/v1/customers/find_all?first_name=FIRST"

    expected = {
                data: [{
                  id: "#{customer_1.id}",
                  type: "customer",
                  attributes: {
                    id: customer_1.id,
                    first_name: "FiRsT",
                    last_name: "MyString",
                    },
                  }, {
                    id: "#{customer_2.id}",
                    type: "customer",
                    attributes: {
                      id: customer_2.id,
                      first_name: "first",
                      last_name: "MyString",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all customers by last name' do
    customer_1 = create(:customer, last_name: 'Last')
    customer_2 = create(:customer, last_name: 'Last')

    get "/api/v1/customers/find_all?last_name=Last"

    expected = {
                data: [{
                  id: "#{customer_1.id}",
                  type: "customer",
                  attributes: {
                    id: customer_1.id,
                    first_name: "MyString",
                    last_name: "Last",
                    },
                  }, {
                    id: "#{customer_2.id}",
                    type: "customer",
                    attributes: {
                      id: customer_2.id,
                      first_name: "MyString",
                      last_name: "Last",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all customers by last name - case insensitive' do
    customer_1 = create(:customer, last_name: 'LAST')
    customer_2 = create(:customer, last_name: 'LaSt')

    get "/api/v1/customers/find_all?last_name=last"

    expected = {
                data: [{
                  id: "#{customer_1.id}",
                  type: "customer",
                  attributes: {
                    id: customer_1.id,
                    first_name: "MyString",
                    last_name: "LAST",
                    },
                  }, {
                    id: "#{customer_2.id}",
                    type: "customer",
                    attributes: {
                      id: customer_2.id,
                      first_name: "MyString",
                      last_name: "LaSt",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all customers by created timestamp' do
    customer_1 = create(:customer)
    customer_2 = create(:customer)

    get "/api/v1/customers/find_all?created_at=#{customer_1.created_at}"

    expected = {
                data: [{
                  id: "#{customer_1.id}",
                  type: "customer",
                  attributes: {
                    id: customer_1.id,
                    first_name: "MyString",
                    last_name: "MyString",
                    },
                  }, {
                    id: "#{customer_2.id}",
                    type: "customer",
                    attributes: {
                      id: customer_2.id,
                      first_name: "MyString",
                      last_name: "MyString",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all customers by updated timestamp' do
    customer_1 = create(:customer)
    customer_2 = create(:customer)

    get "/api/v1/customers/find_all?updated_at=#{customer_1.updated_at}"

    expected = {
                data: [{
                  id: "#{customer_1.id}",
                  type: "customer",
                  attributes: {
                    id: customer_1.id,
                    first_name: "MyString",
                    last_name: "MyString",
                    },
                  }, {
                    id: "#{customer_2.id}",
                    type: "customer",
                    attributes: {
                      id: customer_2.id,
                      first_name: "MyString",
                      last_name: "MyString",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end
