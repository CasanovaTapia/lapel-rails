class ProfileController < ApplicationController
  before_action :authenticate_user!

  def view
     @items = Item.all
  end

  def show
     @user = User.find(params[:id])
  end
end
