class RoomsController < ApplicationController

  def open_room
    @belong_to_common_room = nil 
    @user = User.find_by(id: params[:user_id])
    if(@user == current_user) then
      respond_to do |format|
        format.html { redirect_to root_path, notice: "you can't send message to yourseld" }
      end 
      return
    end
    @user_rooms = @user.rooms
    @current_user_rooms = current_user.rooms
    @user_rooms.each do |room| 
      if @current_user_rooms.include?(room)
        redirect_to room_path(room)
      else
        @room = Room.create()
        @room.users << @user 
        @room.users << current_user
        redirect_to room_path(@room)
      end 
    end 
  end 

  def show
    @room = Room.find_by(id: params[:room_id])
  end

  def index
  end

  private 

end
