class AccountsController < ApplicationController
	before_action :authenticate_user!
	def create
		@account = current_user.accounts.build(client_id: params[:user_id])
		if @account.save
			flash[:notice] = "Added client."
			redirect_to landing_dash_app_path
		else
			flash[:notice] = "Unable to add client. Please try again."
			redirect_to new_user_registration_path
		end
	end

	def new
		# @account = current_user.accounts.New
	end
end
