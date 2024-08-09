class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]
  def index
    @users = User.all.order(created_at: :asc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    @user.email.downcase!
    if @user.save
      login @user
      redirect_to root_path, notice: "You have been signed in"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
