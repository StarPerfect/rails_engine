require 'rails_helper'

describe 'Invoices Transactions API' do
  it 'displays all transactions for a particular invoice' do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_1)
    transaction_3 = create(:transaction, invoice: invoice_2)

    get "/api/v1/invoices/#{invoice_1.id}/transactions"

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
                      invoice_id: invoice_1.id,
                      credit_card_number: "MyString",
                      result: "success",
                      },
                  }]
                }

    transactions = JSON.parse(response.body)

    binding.pry
    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
    expect(transactions["data"].count).to eq(2)
  end
end
