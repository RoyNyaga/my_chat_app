class RoomsController < ApplicationController
  before_action :set_room, only: [:show]
  
  def show
  end

  def index
  end

  private 

  def set_room
    @room = Room.find_by(id: params[:id])
  end 
end
