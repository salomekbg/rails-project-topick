class RoomsController < ApplicationController
  before_action :check_for_back, only: [:show]

  def show
    @room = Room.find(params[:id])
    @post = Post.new
    session[:room_id] = @room.id
    @user = current_user
  end

  def create
    @room = Room.new(room_params)
    user = User.find(session[:user_id])
    @room.users << user
    @room.save
    redirect_to room_path(@room)
  end

  def update
      @room = Room.find(params[:id])
      @user = User.find(session[:user_id])
      @room.users << @user
      redirect_to @room
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
