class OrderItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_order, only: [:create, :update, :destroy]
	before_action :set_user, only: [:create, :update, :destroy]

	def create
		@order_item = @order.order_items.build(order_item_params)

		if @order_item.save
			flash[:notice] = "Your item was added"
			redirect_to [@user, @order]
		else
			flash[:error] = "Your item was not added. Please try again."
			redirect_to [@user, @order]
		end
	end

	def update
		@order_item = @order.order_items.find(params[:id])
		@order_items = @order.order_items

		if @order_item.update_attributes(order_item_params)
			flash[:notice] = "Your item was added"
			redirect_to [@user, @order]
		else
			flash[:error] = "Your item was not added. Please try again."
			redirect_to [@user, @order]
		end
	end

	def destroy
		@order_item = @order.order_items.find(params[:id])
		@order_items = @order.order_items
		if @order_item.destroy
			flash[:notice] = "Item was removed."
			redirect_to [@user, @order]
		else
			flash[:error] = "Your item was not removed. Please try again."
			redirect_to [@user, @order]
		end
	end

	private
		def order_item_params
			params.fetch(:order_item, {}).permit(:quantity, :item_id, :order_id, :total)
		end

		def set_order
			@order = Order.find(params[:order_id])
		end

		def set_user
			@user = User.find(params[:user_id])
		end
end
