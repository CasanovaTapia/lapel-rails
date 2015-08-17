class InternalController < ApplicationController
	before_action :authenticate_user!

	def clientele
	end

	def inventory
		@items = Item.all
		@item_categories = ItemCategory.all
	end
end
