require 'rails_helper'

describe 'Merchants Invoices API' do
  it 'displays all invoices for a particular merchant' do
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    invoice_1 = create(:invoice, customer: customer_1, merchant: merchant_1)
    invoice_2 = create(:invoice, customer: customer_2, merchant: merchant_1)
    invoice_3 = create(:invoice, customer: customer_2, merchant: merchant_2)

    get "/api/v1/merchants/#{merchant_1.id}/invoices"

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
                      merchant_id: merchant_1.id,
                      status: "MyString",
                      },
                  }]
                }

    invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
    expect(invoices["data"].count).to eq(2)
    expect(invoices["data"][0]["id"]).to eq("#{invoice_1.id}")
    expect(invoices["data"][1]["id"]).to eq("#{invoice_2.id}")
    expect(invoices["data"][0]["attributes"]["merchant_id"]).to eq(merchant_1.id)
    expect(invoices["data"][1]["attributes"]["merchant_id"]).to eq(merchant_1.id)
  end
end
