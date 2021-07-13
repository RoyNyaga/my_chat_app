class MessagesController < ApplicationController
  include CableReady::Broadcaster

  def create 
    @message = Message.create(message_params)
    room_messages_selector = "#messages-of-room-#{params[:message][:room_id]}"
    cable_ready["chats"].insert_adjacent_html(
      selector: room_messages_selector,
      position: 'afterBegin',
      html: render_to_string(partial: 'message', locals: {message: @message})
    )
    cable_ready.broadcast
    respond_to do |format|
      format.html
      format.js { render :enable_btn }
    end
  end 

  def message_params
    params.require(:message).permit(:context, :user_id, :room_id)
  end 
end

