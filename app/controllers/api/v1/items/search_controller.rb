class Api::V1::Items::SearchController < ApplicationController
  def find
    if params[:id]
      item = Item.find_by(find_params)
    elsif params[:name]
      item = Item.find_by( 'lower(name) = ?' , params[:name].downcase )
    elsif params[:description]
      item = Item.find_by( 'lower(description) = ?' , params[:description].downcase )
    elsif params[:unit_price]
      item = Item.find_by(find_params)
    elsif params[:created_at]
      item = Item.find_by(find_params)
    elsif params[:updated_at]
      item = Item.find_by(find_params)
    end
    render json: ItemSerializer.new(item)
    # DRY up with: render json: ItemSerializer.new(Item.find_by(find_params))
  end

private
  def find_params
    params.permit(:name, :id, :description, :unit_price, :created_at, :updated_at)
  end
end
