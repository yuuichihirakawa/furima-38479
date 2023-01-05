class ItemsController < ApplicationController
  def index
    @user = User.all
  end

  def show
  end

  private

  def user_params
    params.require(:tweet).permit(:nickname, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date)
  end

end
