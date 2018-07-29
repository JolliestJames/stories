class MemoriesController < ApplicationController

  def new
    @memory = Memory.new
  end

  def create

    @user_id = current_user_id

    @new_memory = Memory.new(
      name: params[:memory][:name],
      description: params[:memory][:description],
      date: params[:memory][:date],
      image: params[:memory][:image],
      story_id: params[:memory][:story_id],
      user_id: @user_id
    )

    @new_memory.save

    if @new_memory.valid?
      redirect_to memories_path
    else
      @memory = @new_memory
      render :new
    end

  end

  def index
    @memories = Memory.all
  end

  def current_user_id
    current_user.id
  end

end
