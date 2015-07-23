class ClientController < ApplicationController
	before_action :authenticate_user!

	def req
	end

	def wardrobe
		@delivered_orders = current_user.orders.where(order_status_id: 4)
	end
end
