class Api::V1::Invoices::SearchController < ApplicationController
  def find
    if params[:status]
      invoice = Invoice.find_by( 'lower(status) = ?' , params[:status].downcase )
    else
      invoice = Invoice.find_by(find_params)
    end
    render json: InvoiceSerializer.new(invoice)
  end

  def find_all
    if params[:status]
      invoice = Invoice.where( 'lower(status) = ?' , params[:status].downcase )
    else
      invoice = Invoice.where(find_params)
    end
    render json: InvoiceSerializer.new(invoice)
  end

private
  def find_params
    params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
  end
end
