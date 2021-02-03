class CustomersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_customer = UserCustomer.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.customer != nil
      redirect_to root_path
    end
  end

  def create
    @user_customer = UserCustomer.new(customer_params)
    @item = Item.find(params[:item_id])
    if @user_customer.valid?
      pay_item
      @user_customer.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def customer_params
    params.require(:user_customer).permit(:postal_code, :shipping_region_id, :city, :house_number, :building_number, :tell, :customer).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
