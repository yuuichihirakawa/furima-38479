class ItemsController < ApplicationController
  # before_action :move_to_index, expect: [:index, :show]

  def index
  end

  def show
  end

  private

  def user_params
    params.require(:tweet).permit(:nickname, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date)
  end

  # def move_to_index
    # unless user_signed_in?
      # redirect_to action: :index
    # end
  # end

end