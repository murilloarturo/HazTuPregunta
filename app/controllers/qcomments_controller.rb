class QcommentsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
  	@question = Question.find(params[:question_id])
  	@qcomment = @question.qcomments.build(params[:qcomment])
  	@qcomment.save

    @user = User.find(@question.user_id)
    current_user.send_message(@user, "Qcomment" , @question.id)
  	redirect_to @question
  end

  def edit
  end

  def destroy
  	@qcomment = Qcomment.find(params[:id])
  	@qcomment.destroy
  	
  	redirect_to @qcomment.question
  end
end
