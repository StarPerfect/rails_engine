require 'rails_helper'

describe 'Transaction Search API' do
  it 'find a single transaction based on id' do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/find?id=#{transaction.id}"

    expected = {
                data: {
                  id: "#{transaction.id}",
                  type: "transaction",
                  attributes: {
                    id: transaction.id,
                    invoice_id: invoice.id,
                    credit_card_number: "MyString",
                    result: "success",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single transaction based on invoice id' do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/find?invoice_id=#{transaction.invoice_id}"

    expected = {
                data: {
                  id: "#{transaction.id}",
                  type: "transaction",
                  attributes: {
                    id: transaction.id,
                    invoice_id: invoice.id,
                    credit_card_number: "MyString",
                    result: "success",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single transaction based on credit card number' do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/find?credit_card_number=#{transaction.credit_card_number}"

    expected = {
                data: {
                  id: "#{transaction.id}",
                  type: "transaction",
                  attributes: {
                    id: transaction.id,
                    invoice_id: invoice.id,
                    credit_card_number: "MyString",
                    result: "success",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find a single transaction based on result' do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/find?result=#{transaction.result}"

    expected = {
                data: {
                  id: "#{transaction.id}",
                  type: "transaction",
                  attributes: {
                    id: transaction.id,
                    invoice_id: invoice.id,
                    credit_card_number: "MyString",
                    result: "success",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single transaction based on created timestamp' do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/find?created_at=#{transaction.created_at}"

    expected = {
                data: {
                  id: "#{transaction.id}",
                  type: "transaction",
                  attributes: {
                    id: transaction.id,
                    invoice_id: invoice.id,
                    credit_card_number: "MyString",
                    result: "success",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single transaction based on updated timestamp' do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/find?updated_at=#{transaction.updated_at}"

    expected = {
                data: {
                  id: "#{transaction.id}",
                  type: "transaction",
                  attributes: {
                    id: transaction.id,
                    invoice_id: invoice.id,
                    credit_card_number: "MyString",
                    result: "success",
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end
