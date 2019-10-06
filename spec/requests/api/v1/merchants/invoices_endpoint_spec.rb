require 'rails_helper'

describe 'Merchants Invoices API' do
  it 'displays all invoices for a particular merchant' do
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    merchant = create(:merchant)
    invoice_1 = create(:invoice, customer: customer_1, merchant: merchant)
    invoice_2 = create(:invoice, customer: customer_2, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/invoices"

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
end
