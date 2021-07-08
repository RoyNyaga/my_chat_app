class MessagesController < ApplicationController

  def create 
    @message = Message.create(message_params)
    respond_to do |format|
      format.html
      format.js { render :enable_btn }
    end
  end 

  def message_params
    params.require(:message).permit(:context, :user_id, :room_id)
  end 
end

