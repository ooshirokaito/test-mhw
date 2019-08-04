class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :user_check, only: [:show, :edit, :update, :destroy]
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.save
		redirect_to user_path(@user)
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
	end

	private

	def user_check
		@user = User.find(params[:id])
		if current_user.email != "ore@admin" && @user.id != current_user.id
			redirect_to user_path(current_user)
		end
	end
end
