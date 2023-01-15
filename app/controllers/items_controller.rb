class ItemsController < ApplicationController
  # before_action :move_to_index, expect: [:index, :show, :new, :create]

  def index
    @items = Item.order("created_at DESC")
  end

  # def show
  # end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :product_description, :item_category_id, :item_state_id, :item_price, :delivery_charge_burden_id, :days_up_to_delivery_id, :address_prefecture_id, :user, :image).merge(user_id: current_user.id)
  end

  # def move_to_index
    # unless user_signed_in?
      # redirect_to action: :index
    # end
  # end

end