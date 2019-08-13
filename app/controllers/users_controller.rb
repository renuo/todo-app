class UsersController < ApplicationController
  before_action :only_see_own_page, only: [:show]

  def show
    @user = User.find(params[:id])
    add_breadcrumb " Profile", :new_user_path
  end

  def new
    @user = User.new
    add_breadcrumb " Sign up", :new_user_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Todo-App!"
      redirect_to todos_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def only_see_own_page
    if current_user.id != params[:id]
      redirect_to todos_path
      flash[:danger] = "Sorry, but you are only allowed to view your own profile page."
    end
  end
end
