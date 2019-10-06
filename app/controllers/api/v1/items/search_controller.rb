class Api::V1::Items::SearchController < ApplicationController
  def find
    if params[:name]
      item = Item.find_by( 'lower(name) = ?' , params[:name].downcase )
    elsif params[:description]
      item = Item.find_by( 'lower(description) = ?' , params[:description].downcase )
    else
      item = Item.find_by(find_params)
    end
    render json: ItemSerializer.new(item)
  end

  def find_all
    if params[:name]
      item = Item.where( 'lower(name) = ?' , params[:name].downcase )
    elsif params[:description]
      item = Item.where( 'lower(description) = ?' , params[:description].downcase )
    else
      item = Item.where(find_params)
    end
    render json: ItemSerializer.new(item)
  end

private
  def find_params
    params.permit(:name, :id, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
