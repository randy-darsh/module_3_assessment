class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: Item.find(item_params)
    else
      redirect_to '/api/v1/items'
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.delete
  end

  private

  def item_params
    binding.pry
    params.require(:item).permit(:name, :description, :image_url)
  end

end
