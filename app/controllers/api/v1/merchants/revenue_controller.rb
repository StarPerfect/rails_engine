class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.top_by_revenue(params[:quantity]))
  end

  def show
    render json: ({total_revenue: Merchant.revenue_by_date(params[:date])})
  end
end
