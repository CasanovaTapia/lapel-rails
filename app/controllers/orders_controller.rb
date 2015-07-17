class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @orders = @user.orders
    @order = @orders.first
    if @orders.first.nil?
      flash[:notice] = "You have no orders, please submit an order."
      redirect_to new_user_order_path
    else
      authorize @order
    end
  end

  def show
    @items = Item.all
    @cart_items = @order.items
    @order_item = @order.order_items.new
    authorize @order
  end

  def new
    @order = @user.orders.new
    @items = Item.all
    @order_items = @order.order_items
    authorize @order
  end

  def create
    @order = @user.orders.new(order_params)
    @order.user_id = @user.id
    authorize @order
    if @order.save
      flash[:notice] = "Add items to your order."
      redirect_to [@user, @order]
    else
      flash[:error] = "There was an error. Please try again."
      render :new
    end
  end

  def edit
    authorize @order
  end

  def update
    authorize @order
    if @order.update_attributes(order_params)
      flash[:notice] = "Order was updated."
      redirect_to [@user, @order]
    else
      flash[:error] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    authorize @order
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
