class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  # def create
  #   binding.pry
  #   @item = Item.new(params[:item])
  #   if @item.save
  #     render json: Item.find(params[:item])
  #   else
  #     redirect_to '/api/v1/items'
  #   end
  # end

  def destroy
    item = Item.find(params[:id])
    item.delete
  end

end
