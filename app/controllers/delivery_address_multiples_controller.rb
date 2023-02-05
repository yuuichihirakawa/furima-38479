class DeliveryAddressMultiplesController < ApplicationController
  def index
    @delivery_address_multiples = DeliveryAddressMultiples.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @delivery_address_multiples = DeliveryAddressMultiples.new(delivery_address_multiples_params)
      if @delivery_address_multiples.valid?
        @delivery_address_multiples.save
        return redirect_to root_path
      else
        render 'index'
      end
  end

  private

  def delivery_address_multiples_params
    params.require(:delivery_address_multiples).permit(:postal_code, :address_municipality, :address_block, :telephone_number, :address_prefecture_id).merge(user_id: current_user.id, item_id: @item.id)
  end

end
