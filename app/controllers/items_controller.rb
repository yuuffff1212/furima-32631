class ItemsController < ApplicationController
  before_action :authenticate_user!, expect: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect to root_path
    else
      render new
    end
  end

  private
  
  def item_params
    params.requre(:item).permit(:image, :name, :text, :price, :shipping_cost_id, :shipping_date_id, :shipping_region_id, :item_category, :item_state_id)
  
end
