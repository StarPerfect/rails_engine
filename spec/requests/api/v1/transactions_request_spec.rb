require 'rails_helper'

describe "Transactions API" do
  it "sends a list of items" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_successful
  end
end
