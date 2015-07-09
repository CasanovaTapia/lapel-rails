class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = current_user.orders
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if current_user.role = 'client'
      @order.user_id = current_user.id
    else
      @order.user_id = User.find(params[:user_id])
    end
    if @order.save
      flash[:notice] = "Order was sent."
      redirect_to @order
    else
      flash[:error] = "There was an error. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update_attributes(order_params)
      flash[:notice] = "Order was updated."
      redirect_to @order
    else
      flash[:error] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    if @order.destroy
      flash[:notice] = "Order was deleted."
      redirect_to root_path
    else
      flash[:error] = "Order was not deleted. Please try again."
      render @order
    end
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:delivery, :notes)
    end
end
