class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :check_for_cancel, only: [:update]

  def new
    redirect_to current_user unless !logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    find_user
    @room = Room.new
  end

  def edit
    find_user
  end

  def update
    find_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to user_path
    end
  end

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def require_login
    redirect_to '/signin' unless session.include?(:user_id)
  end
end
