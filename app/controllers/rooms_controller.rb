class RoomsController < ApplicationController
  def show
    find_room
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
    find_room
    if params[:name] == 'join' && room.users.include?(@user) == false
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

  def room_params
    params.require(:room).permit(:name, :topic_id)
  end
end
