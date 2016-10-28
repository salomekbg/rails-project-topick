class RoomsController < ApplicationController
  before_action :check_for_back, only: [:show]

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

  def check_for_back
    if params[:commit] == "Go Back to My Profile"
      redirect_to user_path
    end
  end

  def room_params
    params.require(:room).permit(:name, :topic_id)
  end
end
