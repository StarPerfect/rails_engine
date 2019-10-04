class Api::V1::Customers::SearchController < ApplicationController

  def find
    if params[:id]
      customer = Customer.find_by(find_params)
    elsif params[:first_name]
      customer = Customer.find_by( 'lower(first_name) = ?' , params[:first_name].downcase )
    elsif params[:last_name]
      customer = Customer.find_by( 'lower(last_name) = ?' , params[:last_name].downcase )
    elsif params[:created_at]
      customer = Customer.find_by(find_params)
    elsif params[:updated_at]
      customer = Customer.find_by(find_params)
    end
    render json: CustomerSerializer.new(customer)
    # DRY up with: render json: CustomerSerializer.new(Customer.find_by(find_params))
  end

private
  def find_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end