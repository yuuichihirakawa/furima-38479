class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_item,only: [:edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show]
  

  def index
    @items = Item.all
    @items = Item.order("created_at DESC")
  end

  def show
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

  def edit
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :product_description, :item_category_id, :item_state_id, :item_price, :delivery_charge_burden_id, :days_up_to_delivery_id, :address_prefecture_id, :image).merge(user_id: current_user.id)
  end

  def correct_item
    @item = Item.find(params[:id])
    unless @item.user.id == current_user.id
      redirect_to items_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end