class AccountsController < ApplicationController
	def create
		@account = current_user.accounts.build(:client_id = params[:client_id])
		if @account.save
			flash[:notice] = "Added client."
			redirect_to profile_view_path
		else
			flash[:notice] = "Unable to add client. Please try again."
			redirect_to new_user_registration_path
		end
	end
end
