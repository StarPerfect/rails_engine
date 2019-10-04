require 'rails_helper'

describe 'InvoiceItem Search API' do
  it 'find a single invoice item based on id' do
    invoice = create(:invoice)
    item = create(:item)
    invoice_item = create(:invoice_item, invoice: invoice, item: item)

    get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

    expected = {
                data: {
                  id: "#{invoice_item.id}",
                  type: "invoice_item",
                  attributes: {
                    id: invoice_item.id,
                    invoice_id: invoice.id,
                    item_id: item.id,
                    quantity: 1,
                    unit_price: 2,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single invoice_items based on invoice id' do
    invoice = create(:invoice)
    item = create(:item)
    invoice_item = create(:invoice_item, invoice: invoice, item: item)

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_item.invoice_id}"

    expected = {
                data: {
                  id: "#{invoice_item.id}",
                  type: "invoice_item",
                  attributes: {
                    id: invoice_item.id,
                    invoice_id: invoice.id,
                    item_id: item.id,
                    quantity: 1,
                    unit_price: 2,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single invoice_items based on name item id' do
    invoice = create(:invoice)
    item = create(:item)
    invoice_item = create(:invoice_item, invoice: invoice, item: item)

    get "/api/v1/invoice_items/find?item_id=#{invoice_item.item_id}"

    expected = {
                data: {
                  id: "#{invoice_item.id}",
                  type: "invoice_item",
                  attributes: {
                    id: invoice_item.id,
                    invoice_id: invoice.id,
                    item_id: item.id,
                    quantity: 1,
                    unit_price: 2,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find a single invoice item based on quantity' do
    invoice = create(:invoice)
    item = create(:item)
    invoice_item = create(:invoice_item, invoice: invoice, item: item)

    get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"

    expected = {
                data: {
                  id: "#{invoice_item.id}",
                  type: "invoice_item",
                  attributes: {
                    id: invoice_item.id,
                    invoice_id: invoice.id,
                    item_id: item.id,
                    quantity: 1,
                    unit_price: 2,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find a single invoice item based on unit price' do
    invoice = create(:invoice)
    item = create(:item)
    invoice_item = create(:invoice_item, invoice: invoice, item: item)

    get "/api/v1/invoice_items/find?unit_price=#{invoice_item.unit_price}"

    expected = {
                data: {
                  id: "#{invoice_item.id}",
                  type: "invoice_item",
                  attributes: {
                    id: invoice_item.id,
                    invoice_id: invoice.id,
                    item_id: item.id,
                    quantity: 1,
                    unit_price: 2,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single invoice_items based on created timestamp' do
    invoice = create(:invoice)
    item = create(:item)
    invoice_item = create(:invoice_item, invoice: invoice, item: item)

    get "/api/v1/invoice_items/find?created_at=#{invoice_item.created_at}"

    expected = {
                data: {
                  id: "#{invoice_item.id}",
                  type: "invoice_item",
                  attributes: {
                    id: invoice_item.id,
                    invoice_id: invoice.id,
                    item_id: item.id,
                    quantity: 1,
                    unit_price: 2,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'find a single invoice_items based on updated timestamp' do
    invoice = create(:invoice)
    item = create(:item)
    invoice_item = create(:invoice_item, invoice: invoice, item: item)

    get "/api/v1/invoice_items/find?updated_at=#{invoice_item.updated_at}"

    expected = {
                data: {
                  id: "#{invoice_item.id}",
                  type: "invoice_item",
                  attributes: {
                    id: invoice_item.id,
                    invoice_id: invoice.id,
                    item_id: item.id,
                    quantity: 1,
                    unit_price: 2,
                    },
                  }
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end
