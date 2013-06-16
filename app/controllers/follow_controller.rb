class FollowController < ApplicationController
  def create
  	if current_user.following?(User.find(params[:user_id]))
    	flash[:notice] = "Ya estas siguiendo al usuario"
    else 	
  		current_user.follow(User.find(params[:user_id]))
    	flash[:notice] = "Eres seguidor"
    end
    redirect_to :back
  end

  def destroy
	if current_user.following?(User.find(params[:user_id]))
  		current_user.stop_following(User.find(params[:user_id]))
    	flash[:notice] = "Ya no eres seguidor"
    else
    	flash[:notice] = "No estas siguiendo al usuario"
    end
    redirect_to :back
  end

  def show
  	@user = User.find(params[:user_id])
  	if params[:type] == "Siguiendo"
  		@users = @user.all_following
  	else 
  		@users = @user.followers
  	end
  end
end
