class DeliveryAddressMultiplesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_delivery, only: [:index, :create]
  before_action :set_address, only: [:index, :create]

  def index
    @delivery_address_multiples = DeliveryAddressMultiples.new
  end

  def create
    @delivery_address_multiples = DeliveryAddressMultiples.new(delivery_address_multiples_params)
      if @delivery_address_multiples.valid?
        pay_item
        @delivery_address_multiples.save
        return redirect_to root_path
      else
        render 'index'
      end
  end

  private

  def set_delivery
    @item = Item.find(params[:item_id])
  end

  def set_address
    if @item.user_id == current_user.id || @item.purchase_record != nil
      redirect_to root_path
    end
  end

  def delivery_address_multiples_params
    params.require(:delivery_address_multiples).permit(:postal_code, :address_municipality, :address_block, :telephone_number, :address_prefecture_id, :address_building, :item_price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: delivery_address_multiples_params[:token],
      currency: 'jpy'
    )
  end

end
