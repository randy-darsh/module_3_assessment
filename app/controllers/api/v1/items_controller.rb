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
      render json: Item.find(params[:id])
    else
      redirect_to 'rake route'
  end

  def destroy
    item = Item.find(params[:id])
    item.delete
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end

end
