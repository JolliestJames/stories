class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
    @new_story = Story.new(
      name: params[:story][:name],
      description: params[:story][:description],
      user_id: current_user_id
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

  def show
    @story = Story.find(params[:id])
    @memories = @story.memories.sort_by { |memory| memory.date }
  end

  private

  def current_user_id
    current_user.id
  end
end