class LandingController < ApplicationController
  before_action :authenticate_user!, only: :dash_app
  def splash
    @contact_form = ContactForm.new
  end

  def dash_app
    @items = Item.all
    @order_statuses = OrderStatus.all
    @user = current_user
    @appointment_statuses = AppointmentStatus.all
  end

  def faq
     @user = current_user
  end

  def terms
     @user = current_user
  end
end
