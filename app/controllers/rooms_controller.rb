class RoomsController < ApplicationController
  before_action :find_room, only: [:show, :update]

  def show
    @post = Post.new
    session[:room_id] = @room.id
    @user = current_user
    room_rec = RoomRecs.new(@room)
    @room_rec = room_rec.recommend

  end

  def create
    @room = Room.new(room_params)
    if @room.valid?
      find_user_by_session_id
      deleted_user = User.find_by(username: "deleted_user")
      @room.users << @user
      @room.users << deleted_user
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
      room_rec = RoomRecs.new(@room)
      @room_rec = room_rec.recommend
      redirect_to @room
    else
      find_user_by_session_id
      deleted_user = User.find_by(username: "deleted_user")
      deleted_user.memberships += @room.memberships.select{|membership| membership.user_id == @user.id}
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
