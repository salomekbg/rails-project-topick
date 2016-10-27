class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @posts = @room.posts
  end

  def create
    @room = Room.new(room_params)
    user = User.find(session[:user_id])
    @room.users << user
    @room.save(validate: false)
    redirect_to room_path(@room)
  end

  private

  def room_params
    params.require(:room).permit(:name, :topic_id)
  end
end
