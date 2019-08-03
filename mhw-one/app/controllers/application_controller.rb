class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?


	private

	def check_admin
	  if user_signed_in?
	    if current_user.email != 'ore@admin'
	      redirect_to choices_path
	      flash[:notice] = "管理者のみ閲覧できます"
	    end
	  end
	end

	protected

	  def after_sign_in_path_for(resourece)
	  	  user_path(current_user)
	  end

	  def after_sign_out_path_for(resoure)
	  	  user_session_path
	  end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
end
