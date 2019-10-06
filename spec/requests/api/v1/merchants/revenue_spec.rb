require 'rails_helper'

describe 'Revenue Business Intell Logic' do
  before :each do
    @merchant_1 = create(:merchant, name: 'Merch1')
    @merchant_2 = create(:merchant, name: 'Merch2')
    @merchant_3 = create(:merchant, name: 'Merch3')
    @customer_1 = create(:customer)
    @customer_2 = create(:customer)
    @customer_3 = create(:customer)
    @item_1 = create(:item, unit_price: 2, merchant: @merchant_1)
    @item_2 = create(:item, unit_price: 2, merchant: @merchant_2)
    @item_3 = create(:item, unit_price: 3, merchant: @merchant_3)
    @invoice_1 = create(:invoice, merchant: @merchant_1, customer: @customer_1)
    @invoice_2 = create(:invoice, merchant: @merchant_2, customer: @customer_2)
    @invoice_3 = create(:invoice, merchant: @merchant_3, customer: @customer_3)
    @transaction_1 = create(:transaction, invoice: @invoice_1)
    @transaction_2 = create(:transaction, invoice: @invoice_2)
    @transaction_3 = create(:transaction, invoice: @invoice_3)
    @invoice_item_1 = create(:invoice_item, item: @item_1, invoice: @invoice_1, unit_price: @item_1.unit_price)
    @invoice_item_2 = create(:invoice_item, item: @item_2, invoice: @invoice_2, unit_price: @item_2.unit_price)
    @invoice_item_3 = create(:invoice_item, item: @item_3, invoice: @invoice_3, unit_price: @item_3.unit_price)
  end

  it 'can find top merchants by revenue' do
    quantity = 1

    get "/api/v1/merchants/most_revenue?quantity=#{quantity}"

    expected = {
                "data": [{
                  "id": "#{@merchant_3.id}",
                  "type": "merchant",
                  "attributes": {
                    "id": @merchant_3.id,
                    "name": "Merch3"
                  }
                }]
              }

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end

  it 'can find total revenue for a particular date for all merchants' do
    date = "2019-10-03 14:54:43"

    get "/api/v1/merchants/revenue?date=#{date}"

    expected = ({"total_revenue" => "6.00"})

    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end
