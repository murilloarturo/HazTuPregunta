class AnswersController < ApplicationController
  before_filter :authenticate_user!
  
  def create
  	@question = Question.find(params[:question_id])
  	@answer = @question.answers.build(params[:answer])
  	@answer.save
    @question.create_activity key: 'answer.create', owner: current_user
    
    @user = User.find(@question.user_id)
    current_user.send_message(@user,  "Answer" , @question.id)
    redirect_to @question
  end

  def edit
  end

  def destroy
  	@answer = Answer.find(params[:id])
  	@answer.destroy
  	
  	redirect_to @answer.question
  end
end
