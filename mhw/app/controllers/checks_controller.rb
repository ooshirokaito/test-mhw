class ChecksController < ApplicationController

	def create
		@check = current_user.checks.create(content_id: params[:content_id])
		@choice = params[:choice_id]
		redirect_to choice_contents_path(@choice)
	end

	def destroy
		@check = Check.find_by(content_id: params[:content_id], user_id: current_user.id)
		@check.destroy
		@choice = params[:choice_id]
		redirect_to choice_contents_path(@choice)
	end
end
