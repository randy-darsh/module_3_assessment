class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.delete
  end

  def create
    item = Item.create(item_params)
    if item.save
      render json: Item.find_by(name: params['name']), status: 201
    else
      render json: {message: "Couldn't create item"}
    end
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end

end
