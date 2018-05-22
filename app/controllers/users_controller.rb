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
    result = @new_user.save
    unless result
      @user = @new_user
      render :new
    end
  end

  def index
    @users = User.all
  end

end
