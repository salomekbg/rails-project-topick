class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    redirect_to current_user unless !logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @room = Room.new
  end

  def edit
    find_user_by_session_id
  end

  def update
    find_user_by_session_id
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def require_login
    redirect_to '/signin' unless session.include?(:user_id)
  end
end
