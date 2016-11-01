class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :check_for_cancel, only: [:update]

  def new
    redirect_to current_user unless !logged_in?
    @user = User.new
  end

  def create
    if !User.find_by(username: "deleted_user")
       User.create(username: 'deleted_user', password: 'password')
    end
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
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to user_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def require_login
    redirect_to '/signin' unless session.include?(:user_id)
  end
end
