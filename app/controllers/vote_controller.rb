class VoteController < ApplicationController
  def add
  	@question = Question.find(params[:Qid])
  	@answer = Answer.find(params[:Aid])

  	@answer.votos += 1
  	@answer.save

  	redirect_to @question
  end

  def remove
  	@question = Question.find(params[:Qid])
  	@answer = Answer.find(params[:Aid])

  	@answer.votos -= 1
  	@answer.save

  	redirect_to @question
  end
end
