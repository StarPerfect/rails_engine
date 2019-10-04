class Api::V1::Transactions::SearchController < ApplicationController
  def find
    render json: TransactionSerializer.new(Transaction.find_by(find_params))
  end

private
  def find_params
    params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
  end
end
