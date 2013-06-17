class FollowController < ApplicationController
  def create
    @user = User.find(params[:user_id])
  	if current_user.following?(@user)
    	flash[:notice] = "Ya estas siguiendo al usuario"
    else 	
  		current_user.follow(@user)
      current_user.send_message(@user,  current_user.username+" te esta siguiendo.", " Nuevo Seguidor")
    	@user.create_activity key: 'follow.create', owner: current_user
      flash[:notice] = "Eres seguidor"
    end
    redirect_to :back
  end

  def destroy
  @user = User.find(params[:user_id])
	if current_user.following?(@user)
  		current_user.stop_following(@user)
      @user.create_activity key: 'follow.destroy' , owner: current_user
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