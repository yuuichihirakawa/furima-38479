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
        return rredirect_to root_path
      else
        render 'index'
      end
  end

  private

  def delivery_address_multiples_params
    params.require(:delivery_address_multiples).permit(:delivery_address)
  end

end
