class Api::V1::InvoiceItems::SearchController < ApplicationController

  def find
    # if params[:id]
    #   customer = Customer.find_by(find_params)
    # elsif params[:quantity]
    #   customer = Customer.find_by( 'lower(first_name) = ?' , params[:first_name].downcase )
    # elsif params[:last_name]
    #   customer = Customer.find_by( 'lower(last_name) = ?' , params[:last_name].downcase )
    # elsif params[:created_at]
    #   customer = Customer.find_by(find_params)
    # elsif params[:updated_at]
    #   customer = Customer.find_by(find_params)
    # end
    # render json: CustomerSerializer.new(customer)
    render json: InvoiceItemSerializer.new(InvoiceItem.find_by(find_params))
  end

private
  def find_params
    params.permit(:id, :quantity, :unit_price, :invoice_id, :item_id, :created_at, :updated_at)
  end
end
