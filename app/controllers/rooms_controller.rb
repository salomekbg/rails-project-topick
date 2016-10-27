class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @posts = @room.posts
  end

  def create
    @room = Room.create(room_params)
    byebug
    @room.users << session[:user_id]
    redirect_to room_path(@room)
  end

  private

  def room_params
    params.require(:room).permit(:name, :topic_id)
  end
end
