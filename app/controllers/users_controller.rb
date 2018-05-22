class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @new_user = User.new(
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      email: params[:user][:email],
      password: params[:user][:password],
    )
    @new_user.save
  end

  def index
    @users = User.all
  end

end
