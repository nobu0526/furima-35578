class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index, :show]
  before_action :find_action,only:[:show, :edit, :update,:destroy]
  before_action :move_to_index,only:[:edit,:update,:destroy]
  before_action :order_action,only:[:edit, :update, :destroy]
  
  def index
    @items = Item.all.order(created_at: :DESC)
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
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :status_id, :category_id, :charge_id, :shipping_area_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless current_user == @item.user
  end

  def find_action
    @item = Item.find(params[:id])
  end

  def order_action
    if @item.order.present?
      redirect_to root_path
    end
  end

end
