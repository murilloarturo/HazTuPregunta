class MessageController < ApplicationController
  def show
    current_user.received_messages.process do |message|
    	message.open # open message
		message.read
		message.mark_as_read
	end
  end

  def destroy
  	current_user.messages.with_id(params[:message_id]).process do |message|
  		message.delete # @alice delete message
	end
    redirect_to :back
  end
end
