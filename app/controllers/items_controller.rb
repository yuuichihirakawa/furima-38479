class ItemsController < ApplicationController
  before_action :move_to_index, expect: [:index, :show, :new, :create]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  private

  def user_params
    params.require(:item).permit(:item_name, :product_description, :item_category_id, :item_state_id, :item_price, :delivery_charge_burden_id, :days_up_to_delivery_id, :address_prefecture_id, :user).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end