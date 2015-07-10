class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @orders = current_user.orders
  end

  def show
  end

  def new
    @order = @user.orders.new
  end

  def create
    @order = @user.orders.new(order_params)
    @order.user_id = @user.id
    if @order.save
      flash[:notice] = "Order was sent."
      redirect_to [@user, @order]
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
      redirect_to [@user, @order]
    else
      flash[:error] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    if @order.destroy
      flash[:notice] = "Order was deleted."
      redirect_to profile_view_path
    else
      flash[:error] = "Order was not deleted. Please try again."
      redirect_to [@order.user, @order]
    end
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def order_params
      params.require(:order).permit(:delivery, :status, :notes, :user_id)
    end
end
