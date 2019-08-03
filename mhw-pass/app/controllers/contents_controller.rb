class ContentsController < ApplicationController
	before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]

	def new
		@content = Content.new
		@choice = params[:choice_id]
	end

	def create
		@content = Content.new(content_params)
		@content.choice_id = params[:choice_id]
		@content.save
		@choice = params[:choice_id]
		redirect_to choice_contents_path(@choice)
	end

	def edit
		@choice = params[:choice_id]
		@content = Content.find(params[:id])
	end

	def update
		@choice = params[:choice_id]
		@content = Content.find(params[:id])
		@content.update(content_params)
		redirect_to choice_contents_path(@choice)
	end

	def destroy
		@content = Content.find(params[:id])
		@content.destroy
		@choice = params[:choice_id]
		redirect_to choice_contents_path(@choice)
	end

	def index
		@choice = params[:choice_id]
		@contents = Content.where(choice_id: @choice)
	end

	private
	def content_params
		params.require(:content).permit(:item)
	end
end
