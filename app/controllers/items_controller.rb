class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]


  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user.id != @item.user.id || @item.customer != nil
      redirect_to root_path
    end
  end

  def update
   if @item.update(item_params)
    redirect_to item_path
   else
    render :edit
   end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :shipping_cost_id, :shipping_date_id, :shipping_region_id, :item_category_id, :item_state_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
