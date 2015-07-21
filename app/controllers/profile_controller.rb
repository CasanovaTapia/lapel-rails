class ProfileController < ApplicationController
  before_action :authenticate_user!

  def view
     @items = Item.all
     @order_statuses = OrderStatus.all
     @user = current_user
     @appointment_statuses = AppointmentStatus.all
  end


end
