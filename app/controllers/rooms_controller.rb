class RoomsController < ApplicationController
  before_action :find_room, only: [:show, :update]

  def show
    @post = Post.new
    session[:room_id] = @room.id
    @user = current_user
  end

  def create
    @room = Room.new(room_params)
    if @room.valid?
      find_user_by_session_id
      @room.users << @user
      @room.save
      redirect_to @room
    else
      find_user_by_session_id
      render '/users/show'
    end
  end

  def update
    if params[:name] == 'join'
      find_user_by_session_id
      @room.users << @user
      redirect_to @room
    else
      find_user_by_session_id
      @room.users.delete(@user)
      redirect_to @user
    end
  end

  private

  def find_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :topic_id)
  end
end
