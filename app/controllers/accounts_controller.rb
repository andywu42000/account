class AccountsController < ApplicationController
	 # before_action :set_account, only: [:show, :edit, :update, :destroy]
	def index
		@accounts=Account.where(user: current_user).last(5)
	end

	def new
		@account = Account.new
	end
	
	def create
		@account = Account.new(account_params)
		@account.user = current_user
		if @account.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@account = Account.find(params[:id])
	end

	def update
		@account = Account.find(params[:id])
		if @account.update(account_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@account = Account.find(params[:id])
		@account.destroy
		redirect_to root_path
	end

	def dashboard
		@data = Account.dashboard(current_user)
	end

	private
	def set_account
	      @account = Account.find(params[:id])
	end
	def account_params
		params.require(:account).permit(:title ,:expense, :datetime)
		
	end
end
