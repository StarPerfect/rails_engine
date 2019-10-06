require 'rails_helper'

describe 'Invoice Search API' do
  it 'find a single invoice based on id' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)

    get "/api/v1/invoices/find?id=#{invoice.id}"

    expected = {
                data: {
                  id: "#{invoice.id}",
                  type: "invoice",
                  attributes: {
                    id: invoice.id,
                    customer_id: customer.id,
                    merchant_id: merchant.id,
                    status: "MyString",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single invoice based on customer id' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)

    get "/api/v1/invoices/find?customer_id=#{invoice.customer_id}"

    expected = {
                data: {
                  id: "#{invoice.id}",
                  type: "invoice",
                  attributes: {
                    id: invoice.id,
                    customer_id: customer.id,
                    merchant_id: merchant.id,
                    status: "MyString",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single invoice based on merchant id' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)

    get "/api/v1/invoices/find?merchant_id=#{invoice.merchant_id}"

    expected = {
                data: {
                  id: "#{invoice.id}",
                  type: "invoice",
                  attributes: {
                    id: invoice.id,
                    customer_id: customer.id,
                    merchant_id: merchant.id,
                    status: "MyString",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find a single invoice based on status' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)

    get "/api/v1/invoices/find?status=#{invoice.status}"

    expected = {
                data: {
                  id: "#{invoice.id}",
                  type: "invoice",
                  attributes: {
                    id: invoice.id,
                    customer_id: customer.id,
                    merchant_id: merchant.id,
                    status: "MyString",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find a single invoice based on status - case insensitive' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)

    get "/api/v1/invoices/find?status=MYSTRING"

    expected = {
                data: {
                  id: "#{invoice.id}",
                  type: "invoice",
                  attributes: {
                    id: invoice.id,
                    customer_id: customer.id,
                    merchant_id: merchant.id,
                    status: "MyString",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single invoice based on created timestamp' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)

    get "/api/v1/invoices/find?created_at=#{invoice.created_at}"

    expected = {
                data: {
                  id: "#{invoice.id}",
                  type: "invoice",
                  attributes: {
                    id: invoice.id,
                    customer_id: customer.id,
                    merchant_id: merchant.id,
                    status: "MyString",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single invoice based on updated timestamp' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)

    get "/api/v1/invoices/find?updated_at=#{invoice.updated_at}"

    expected = {
                data: {
                  id: "#{invoice.id}",
                  type: "invoice",
                  attributes: {
                    id: invoice.id,
                    customer_id: customer.id,
                    merchant_id: merchant.id,
                    status: "MyString",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end
