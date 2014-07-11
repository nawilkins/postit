class UsersController < ApplicationController

  before_action :find_user_id, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      current_user
      flash[:notice] = "Account successfully created, hello #{@current_user.username}"
      redirect_to root_path
    else
      render :new
    end
  end

  def show;  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your information has been updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def find_user_id
    @user = User.find_by slug: params[:id]
  end

end