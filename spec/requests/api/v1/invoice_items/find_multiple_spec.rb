require 'rails_helper'

describe 'Multiple InvoiceItem Search API' do
  it 'can find all InvoiceItems by id' do
    invoice = create(:invoice)
    item = create(:item)
    invoice_item = create(:invoice_item, invoice: invoice, item: item)

    get "/api/v1/invoice_items/find_all?id=#{invoice_item.id}"

    expected = {
                data: [{
                  id: "#{invoice_item.id}",
                  type: "invoice_item",
                  attributes: {
                    id: invoice_item.id,
                    invoice_id: invoice.id,
                    item_id: item.id,
                    quantity: 1,
                    unit_price: 2,
                    },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all InvoiceItems by invoice' do
    invoice = create(:invoice)
    item_1 = create(:item)
    item_2 = create(:item)
    invoice_item_1 = create(:invoice_item, invoice: invoice, item: item_1)
    invoice_item_2 = create(:invoice_item, invoice: invoice, item: item_2)

    get "/api/v1/invoice_items/find_all?invoice_id=#{invoice.id}"

    expected = {
                data: [{
                  id: "#{invoice_item_1.id}",
                  type: "invoice_item",
                  attributes: {
                    id: invoice_item_1.id,
                    invoice_id: invoice.id,
                    item_id: item_1.id,
                    quantity: 1,
                    unit_price: 2,
                    },
                  }, {
                    id: "#{invoice_item_2.id}",
                    type: "invoice_item",
                    attributes: {
                      id: invoice_item_2.id,
                      invoice_id: invoice.id,
                      item_id: item_2.id,
                      quantity: 1,
                      unit_price: 2,
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all InvoiceItems by item' do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    item = create(:item)
    invoice_item_1 = create(:invoice_item, invoice: invoice_1, item: item)
    invoice_item_2 = create(:invoice_item, invoice: invoice_2, item: item)

    get "/api/v1/invoice_items/find_all?item_id=#{item.id}"

    expected = {
                data: [{
                  id: "#{invoice_item_1.id}",
                  type: "invoice_item",
                  attributes: {
                    id: invoice_item_1.id,
                    invoice_id: invoice_1.id,
                    item_id: item.id,
                    quantity: 1,
                    unit_price: 2,
                    },
                  }, {
                    id: "#{invoice_item_2.id}",
                    type: "invoice_item",
                    attributes: {
                      id: invoice_item_2.id,
                      invoice_id: invoice_2.id,
                      item_id: item.id,
                      quantity: 1,
                      unit_price: 2,
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all InvoiceItems by quantity' do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    item_1 = create(:item)
    item_2 = create(:item)
    invoice_item_1 = create(:invoice_item, quantity: 5, invoice: invoice_1, item: item_1)
    invoice_item_2 = create(:invoice_item, quantity: 5, invoice: invoice_2, item: item_2)

    get "/api/v1/invoice_items/find_all?quantity=5"

    expected = {
                data: [{
                  id: "#{invoice_item_1.id}",
                  type: "invoice_item",
                  attributes: {
                    id: invoice_item_1.id,
                    invoice_id: invoice_1.id,
                    item_id: item_1.id,
                    quantity: 5,
                    unit_price: 2,
                    },
                  }, {
                    id: "#{invoice_item_2.id}",
                    type: "invoice_item",
                    attributes: {
                      id: invoice_item_2.id,
                      invoice_id: invoice_2.id,
                      item_id: item_2.id,
                      quantity: 5,
                      unit_price: 2,
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all InvoiceItems by unit price' do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    item_1 = create(:item)
    item_2 = create(:item)
    invoice_item_1 = create(:invoice_item, unit_price: 11, invoice: invoice_1, item: item_1)
    invoice_item_2 = create(:invoice_item, unit_price: 11, invoice: invoice_2, item: item_2)

    get "/api/v1/invoice_items/find_all?unit_price=11"

    expected = {
                data: [{
                  id: "#{invoice_item_1.id}",
                  type: "invoice_item",
                  attributes: {
                    id: invoice_item_1.id,
                    invoice_id: invoice_1.id,
                    item_id: item_1.id,
                    quantity: 1,
                    unit_price: 11,
                    },
                  }, {
                    id: "#{invoice_item_2.id}",
                    type: "invoice_item",
                    attributes: {
                      id: invoice_item_2.id,
                      invoice_id: invoice_2.id,
                      item_id: item_2.id,
                      quantity: 1,
                      unit_price: 11,
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all InvoiceItems with same created at' do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    item_1 = create(:item)
    item_2 = create(:item)
    invoice_item_1 = create(:invoice_item, invoice: invoice_1, item: item_1)
    invoice_item_2 = create(:invoice_item, invoice: invoice_2, item: item_2)

    get "/api/v1/invoice_items/find_all?created_at=#{invoice_item_1.created_at}"

    expected = {
                data: [{
                  id: "#{invoice_item_1.id}",
                  type: "invoice_item",
                  attributes: {
                    id: invoice_item_1.id,
                    invoice_id: invoice_1.id,
                    item_id: item_1.id,
                    quantity: 1,
                    unit_price: 2,
                    },
                  }, {
                    id: "#{invoice_item_2.id}",
                    type: "invoice_item",
                    attributes: {
                      id: invoice_item_2.id,
                      invoice_id: invoice_2.id,
                      item_id: item_2.id,
                      quantity: 1,
                      unit_price: 2,
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find all InvoiceItems with same updated at' do
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    item_1 = create(:item)
    item_2 = create(:item)
    invoice_item_1 = create(:invoice_item, invoice: invoice_1, item: item_1)
    invoice_item_2 = create(:invoice_item, invoice: invoice_2, item: item_2)

    get "/api/v1/invoice_items/find_all?updated_at=#{invoice_item_1.updated_at}"

    expected = {
                data: [{
                  id: "#{invoice_item_1.id}",
                  type: "invoice_item",
                  attributes: {
                    id: invoice_item_1.id,
                    invoice_id: invoice_1.id,
                    item_id: item_1.id,
                    quantity: 1,
                    unit_price: 2,
                    },
                  }, {
                    id: "#{invoice_item_2.id}",
                    type: "invoice_item",
                    attributes: {
                      id: invoice_item_2.id,
                      invoice_id: invoice_2.id,
                      item_id: item_2.id,
                      quantity: 1,
                      unit_price: 2,
                      },
                  }]
                }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end
