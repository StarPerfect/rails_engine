require 'rails_helper'

describe 'Multiple Invoices Search API' do
  it 'find all invoices with id' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)

    get "/api/v1/invoices/find_all?id=#{invoice.id}"

    expected = {
                data: [{
                  id: "#{invoice.id}",
                  type: "invoice",
                  attributes: {
                    id: invoice.id,
                    customer_id: customer.id,
                    merchant_id: merchant.id,
                    status: "MyString",
                    },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find all invoices with the same customer id' do
    customer = create(:customer)
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    invoice_1 = create(:invoice, customer: customer, merchant: merchant_1)
    invoice_2 = create(:invoice, customer: customer, merchant: merchant_2)

    get "/api/v1/invoices/find_all?customer_id=#{customer.id}"

    expected = {
                data: [{
                  id: "#{invoice_1.id}",
                  type: "invoice",
                  attributes: {
                    id: invoice_1.id,
                    customer_id: customer.id,
                    merchant_id: merchant_1.id,
                    status: "MyString",
                    },
                  }, {
                    id: "#{invoice_2.id}",
                    type: "invoice",
                    attributes: {
                      id: invoice_2.id,
                      customer_id: customer.id,
                      merchant_id: merchant_2.id,
                      status: "MyString",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find all invoices with the same merchant id' do
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    merchant = create(:merchant)
    invoice_1 = create(:invoice, customer: customer_1, merchant: merchant)
    invoice_2 = create(:invoice, customer: customer_2, merchant: merchant)

    get "/api/v1/invoices/find_all?merchant_id=#{merchant.id}"

    expected = {
                data: [{
                  id: "#{invoice_1.id}",
                  type: "invoice",
                  attributes: {
                    id: invoice_1.id,
                    customer_id: customer_1.id,
                    merchant_id: merchant.id,
                    status: "MyString",
                    },
                  }, {
                    id: "#{invoice_2.id}",
                    type: "invoice",
                    attributes: {
                      id: invoice_2.id,
                      customer_id: customer_2.id,
                      merchant_id: merchant.id,
                      status: "MyString",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find all invoices with the same status' do
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    invoice_1 = create(:invoice, customer: customer_1, merchant: merchant_1)
    invoice_2 = create(:invoice, customer: customer_2, merchant: merchant_2)

    get "/api/v1/invoices/find_all?status=MyString"

    expected = {
                data: [{
                  id: "#{invoice_1.id}",
                  type: "invoice",
                  attributes: {
                    id: invoice_1.id,
                    customer_id: customer_1.id,
                    merchant_id: merchant_1.id,
                    status: "MyString",
                    },
                  }, {
                    id: "#{invoice_2.id}",
                    type: "invoice",
                    attributes: {
                      id: invoice_2.id,
                      customer_id: customer_2.id,
                      merchant_id: merchant_2.id,
                      status: "MyString",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find all invoices with the same status - case insensitive' do
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    invoice_1 = create(:invoice, status: 'mystring', customer: customer_1, merchant: merchant_1)
    invoice_2 = create(:invoice, status: 'MyStRiNg', customer: customer_2, merchant: merchant_2)

    get "/api/v1/invoices/find_all?status=MYSTRING"

    expected = {
                data: [{
                  id: "#{invoice_1.id}",
                  type: "invoice",
                  attributes: {
                    id: invoice_1.id,
                    customer_id: customer_1.id,
                    merchant_id: merchant_1.id,
                    status: "mystring",
                    },
                  }, {
                    id: "#{invoice_2.id}",
                    type: "invoice",
                    attributes: {
                      id: invoice_2.id,
                      customer_id: customer_2.id,
                      merchant_id: merchant_2.id,
                      status: "MyStRiNg",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find all invoices with the same created at' do
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    invoice_1 = create(:invoice, customer: customer_1, merchant: merchant_1)
    invoice_2 = create(:invoice, customer: customer_2, merchant: merchant_2)

    get "/api/v1/invoices/find_all?created_at=#{invoice_1.created_at}"

    expected = {
                data: [{
                  id: "#{invoice_1.id}",
                  type: "invoice",
                  attributes: {
                    id: invoice_1.id,
                    customer_id: customer_1.id,
                    merchant_id: merchant_1.id,
                    status: "MyString",
                    },
                  }, {
                    id: "#{invoice_2.id}",
                    type: "invoice",
                    attributes: {
                      id: invoice_2.id,
                      customer_id: customer_2.id,
                      merchant_id: merchant_2.id,
                      status: "MyString",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find all invoices with the same updated at' do
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    invoice_1 = create(:invoice, customer: customer_1, merchant: merchant_1)
    invoice_2 = create(:invoice, customer: customer_2, merchant: merchant_2)

    get "/api/v1/invoices/find_all?updated_at=#{invoice_1.updated_at}"

    expected = {
                data: [{
                  id: "#{invoice_1.id}",
                  type: "invoice",
                  attributes: {
                    id: invoice_1.id,
                    customer_id: customer_1.id,
                    merchant_id: merchant_1.id,
                    status: "MyString",
                    },
                  }, {
                    id: "#{invoice_2.id}",
                    type: "invoice",
                    attributes: {
                      id: invoice_2.id,
                      customer_id: customer_2.id,
                      merchant_id: merchant_2.id,
                      status: "MyString",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end
