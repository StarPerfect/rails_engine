require 'rails_helper'

describe 'Transaction Search API' do
  it 'can find all transactions by id' do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/find_all?id=#{transaction.id}"

    expected = {
                data: [{
                  id: "#{transaction.id}",
                  type: "transaction",
                  attributes: {
                    id: transaction.id,
                    invoice_id: invoice.id,
                    credit_card_number: "MyString",
                    result: "success",
                    },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find all transactions based on invoice id' do
    invoice = create(:invoice)
    transaction_1 = create(:transaction, invoice: invoice)
    transaction_2 = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/find_all?invoice_id=#{invoice.id}"

    expected = {
                data: [{
                  id: "#{transaction_1.id}",
                  type: "transaction",
                  attributes: {
                    id: transaction_1.id,
                    invoice_id: invoice.id,
                    credit_card_number: "MyString",
                    result: "success",
                    },
                  }, {
                    id: "#{transaction_2.id}",
                    type: "transaction",
                    attributes: {
                      id: transaction_2.id,
                      invoice_id: invoice.id,
                      credit_card_number: "MyString",
                      result: "success",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find all transactions based on credit card number' do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    transaction_1 = create(:transaction, credit_card_number: '123', invoice: invoice_1)
    transaction_2 = create(:transaction, credit_card_number: '123', invoice: invoice_2)

    get "/api/v1/transactions/find_all?credit_card_number=123"

    expected = {
                data: [{
                  id: "#{transaction_1.id}",
                  type: "transaction",
                  attributes: {
                    id: transaction_1.id,
                    invoice_id: invoice_1.id,
                    credit_card_number: "123",
                    result: "success",
                    },
                  }, {
                    id: "#{transaction_2.id}",
                    type: "transaction",
                    attributes: {
                      id: transaction_2.id,
                      invoice_id: invoice_2.id,
                      credit_card_number: "123",
                      result: "success",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find all transactions based on result' do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    transaction_1 = create(:transaction, result: 'success', invoice: invoice_1)
    transaction_2 = create(:transaction, result: 'success', invoice: invoice_2)

    get "/api/v1/transactions/find_all?result=success"

    expected = {
                data: [{
                  id: "#{transaction_1.id}",
                  type: "transaction",
                  attributes: {
                    id: transaction_1.id,
                    invoice_id: invoice_1.id,
                    credit_card_number: "MyString",
                    result: "success",
                    },
                  }, {
                    id: "#{transaction_2.id}",
                    type: "transaction",
                    attributes: {
                      id: transaction_2.id,
                      invoice_id: invoice_2.id,
                      credit_card_number: "MyString",
                      result: "success",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find all transactions based on created at' do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_2)

    get "/api/v1/transactions/find_all?created_at=#{transaction_1.created_at}"

    expected = {
                data: [{
                  id: "#{transaction_1.id}",
                  type: "transaction",
                  attributes: {
                    id: transaction_1.id,
                    invoice_id: invoice_1.id,
                    credit_card_number: "MyString",
                    result: "success",
                    },
                  }, {
                    id: "#{transaction_2.id}",
                    type: "transaction",
                    attributes: {
                      id: transaction_2.id,
                      invoice_id: invoice_2.id,
                      credit_card_number: "MyString",
                      result: "success",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find all transactions based on updated at' do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_2)

    get "/api/v1/transactions/find_all?updated_at=#{transaction_1.updated_at}"

    expected = {
                data: [{
                  id: "#{transaction_1.id}",
                  type: "transaction",
                  attributes: {
                    id: transaction_1.id,
                    invoice_id: invoice_1.id,
                    credit_card_number: "MyString",
                    result: "success",
                    },
                  }, {
                    id: "#{transaction_2.id}",
                    type: "transaction",
                    attributes: {
                      id: transaction_2.id,
                      invoice_id: invoice_2.id,
                      credit_card_number: "MyString",
                      result: "success",
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end
