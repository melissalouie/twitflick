class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, except: [:new, :create, :index]

  def index
    @users = User.all
  end

  def new
    @user = User.new

  end

  def show

  end

  def edit

  end

  def create
    @user = User.new(user_params)


    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, notice: "Thanks for signing up!"
    else
      render :new
    end
  end

  def update
    if current_user.id == @user.id || current_user.admin == true
      @user.update(user_params)
        redirect_to user_path(@user), notice: 'User was successfully updated.'
      else
        flash[:alert] = "You do not have permission to edit this user."
        redirect_to users_path
      end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: 'User was successfully deleted.'
    end
  end

  def add_like
    @user = User.find(params[:id])
    if @user.likes == nil
      @user.likes = 1
    else
      @user.likes += 1
    end
    @user.save
    redirect_to :back
  end


  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :bio, :email, :avatar, :password, :password_confirmation, :admin)
    end

end
