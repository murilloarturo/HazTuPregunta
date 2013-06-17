class AcommentsController < ApplicationController
  def create
  	@question = Question.find(params[:question_id])
  	@acomment = @question.acomments.build(params[:acomment])
  	@acomment.save

  	redirect_to @question
  end

  def edit
  end

  def destroy
  	@acomment = Acomment.find(params[:id])
  	@acomment.destroy
  	
  	redirect_to @acomment.answer.question
  end
end
