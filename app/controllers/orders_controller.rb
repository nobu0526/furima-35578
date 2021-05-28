class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  
  def create
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
       @order_shipping_address.save
       redirect_to root_path
    else
      render :index
    end
  end

    private
    def order_params 
      params.require.(:order_shipping_address).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number ).merge(user_id: current_user.id)
    end

   
  
  end
