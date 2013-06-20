class VoteController < ApplicationController
  def add
  	@question = Question.find(params[:Qid])
  	@answer = Answer.find(params[:Aid])
  	@voto = Vote.where(:answer_id => @answer.id , :user_id => current_user.id)
    if @voto.empty?

    	@vote = Vote.new
    	@vote.answer_id = @answer.id
    	@vote.user_id = current_user.id
    	@vote.save

  		@answer.votos += 1
  		@answer.save

      @user = User.find(@answer.user_id)
      current_user.send_message(@user, "Up" , @question.id)
    	flash[:notice] = "Voto guardado"
  	else
    	flash[:alert] = "No puedes votar dos veces en la misma respuesta."
  	end
  	redirect_to @question
  end

  def remove
  	@question = Question.find(params[:Qid])
  	@answer = Answer.find(params[:Aid])
  	
  	@voto = Vote.where(:answer_id => @answer.id , :user_id => current_user.id)
    if @voto.empty?

    	@vote = Vote.new
    	@vote.answer_id = @answer.id
    	@vote.user_id = current_user.id
    	@vote.save

  		@answer.votos -= 1
  		@answer.save

      @user = User.find(@answer.user_id)
      current_user.send_message(@user, "Down" , @question.id)
    	flash[:notice] = "Voto guardado"
  	else
    	flash[:alert] = "No puedes votar dos veces en la misma pregunta."
  	end
  	redirect_to @question
  end
end
