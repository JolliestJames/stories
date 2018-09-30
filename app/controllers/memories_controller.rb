class MemoriesController < ApplicationController
  def new
    @memory = Memory.new
  end

  def create
    @new_memory = Memory.new(
      name: name(params),
      description: description(params),
      date: date(params),
      image: params[:memory][:image],
      story_id: params[:memory][:story_id],
      user_id: current_user_id
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

  def date(params)
    params[:memory][:date].blank? ? Date.today : params[:memory][:date]
  end

  def name(params)
    params[:memory][:name].blank? ? date(params) : params[:memory][:name]
  end

  def description(params)
    params[:memory][:description].blank? ? nil : params[:memory][:description]
  end

  private

  def current_user_id
    current_user.id
  end
end
