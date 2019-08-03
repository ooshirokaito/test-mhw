class ChecksController < ApplicationController
	def create
		@content = Content.find(params[:content_id])
		@check = current_user.checks.new(content_id: @content.id)
		@check.save
		@choice = params[:choice_id]
		redirect_to choice_contents_path(@choice)
	end

	def destroy
		@content = Content.find(params[:content_id])
		@check = current_user.checks.find_by(content_id: @content.id)
		@check.destroy
		@choice = params[:choice_id]
		redirect_to choice_contents_path(@choice)
	end
end
