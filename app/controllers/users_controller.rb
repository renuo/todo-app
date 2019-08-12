class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    add_breadcrumb " Signup", :new_user_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Todo-App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
