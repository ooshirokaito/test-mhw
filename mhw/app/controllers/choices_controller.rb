class ChoicesController < ApplicationController
	before_action :check_admin?, only: [:new, :create, :edit, :update, :destroy]
	def new
		@choice = Choice.new
	end

	def create
		@choice = Choice.new(choice_params)
		@choice.save
		redirect_to choices_path
	end

	def index
		@choices = Choice.all
	end

	def edit
		@choice = Choice.find(params[:id])
	end

	def update
		@choice = Choice.find(params[:id])
		@choice.update(choice_params)
		redirect_to choices_path
	end

	def destroy
		@choice = Choice.find(params[:id])
		@choice.destroy
		redirect_to choices_path
	end

	private

	def choice_params
		params.require(:choice).permit(:genre)
	end
end
