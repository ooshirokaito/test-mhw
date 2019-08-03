class UsersController < ApplicationController
	before_action :ensure_correct_user, only: [:show,:edit,:update, :index]

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(current_user)
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :passcode)
	end

	def ensure_correct_user
	    @user = User.find_by(id:params[:id])
	    if current_user.email != "ore@admin" && @user.id != current_user.id
	      flash[:notice] = "権限がありません"
	      redirect_to user_path(current_user)
	 	end
	end
end
