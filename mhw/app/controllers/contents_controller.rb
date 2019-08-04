class ContentsController < ApplicationController
	before_action :check_admin?, only: [:new, :create, :edit, :update, :destroy]
	def new
		@content = Content.new
		@choice = Choice.find(params[:choice_id])
	end

	def create
		@content = Content.new(content_params)
		@choice = params[:choice_id]
		@content.choice_id = @choice
		@content.save
		redirect_to choice_contents_path(@choice)
	end

	def index
		@contents = Content.all
		@choice = Choice.find(params[:choice_id])
	end

	def edit
		@choice = Choice.find(params[:choice_id])
		@content = Content.find(params[:id])
	end

	def update
		@choice = Choice.find(params[:choice_id])
		@content = Content.find(params[:id])
		@content.update(content_params)
		redirect_to choice_contents_path(@choice)
	end

	def destroy
		@choice = Choice.find(params[:choice_id])
		@content = Content.find(params[:id])
		@content.destroy
		redirect_to choice_contents_path(@choice)
	end

	private

	def content_params
		params.require(:content).permit(:item)
	end
end
