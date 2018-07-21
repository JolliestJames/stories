class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    
    @user_id = current_user_id

    @new_story = Story.new(
      name: params[:story][:name],
      description: params[:story][:description],
      user_id: @user_id
    )

    @new_story.save

    if @new_story.valid?
      redirect_to stories_path
    else
      @story = @new_story
      render :new
    end

  end

  def index
    @stories = Story.all
  end

  def current_user_id
    current_user.id
  end
  
end