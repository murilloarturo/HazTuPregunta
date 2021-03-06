class ActivitiesController < ApplicationController
  before_filter :authenticate_user!
	
  def index
  	@activities = PublicActivity::Activity.order("created_at desc")
  end

  def show
  	@user = User.find(params[:user_id])
  	@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: @user.id)
  end
end
