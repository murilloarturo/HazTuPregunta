class QcommentsController < ApplicationController
  def create
  	@question = Question.find(params[:question_id])
  	@qcomment = @question.qcomments.build(params[:qcomment])
  	@qcomment.save

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