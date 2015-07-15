class AccountsController < ApplicationController
	def create
		@account = current_user.accounts.build(:client_id = params[:user_id])
		if @account.save
			flash[:notice] = "Added client."
			redirect_to root_url
		else
			flash[:notice] = "Unable to add client. Please try again."
			redirect_to root_url
		end
	end
end
