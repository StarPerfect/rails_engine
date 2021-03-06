class Api::V1::Merchants::SearchController < ApplicationController

  def find
    if params[:id]
      merchant = Merchant.find_by(find_params)
    elsif params[:name]
      merchant = Merchant.find_by( 'lower(name) = ?' , params[:name].downcase )
    elsif params[:created_at]
      merchant = Merchant.find_by(find_params)
    elsif params[:updated_at]
      merchant = Merchant.find_by(find_params)
    end
    render json: MerchantSerializer.new(merchant)
  end

  def find_all
    if params[:name]
      merchant = Merchant.where( 'lower(name) = ?' , params[:name].downcase )
    else
      merchant = Merchant.where(find_params)
    end
    render json: MerchantSerializer.new(merchant)
  end

private
  def find_params
    params.permit(:name, :id, :created_at, :updated_at)
  end
end
