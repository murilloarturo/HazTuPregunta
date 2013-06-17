class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  protect_from_forgery

   	def authenticate_active_admin_user!
    	authenticate_user! 
    	unless current_user.superadmin?
      		flash[:alert] = "Acceso no autorizado!"
      		redirect_to root_path 
    	end
  	end

  	def after_sign_in_path_for(resource)
		  if current_user.superadmin?
        admin_dashboard_path
		  else
        user_path(current_user)
		  end
    end
    
    def after_update_path_for(resource)
        user_path(current_user)
    end
end
