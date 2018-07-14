class StoriesController < ApplicationController

  def new
    @story = Story.new
  end

  def create
  end

  def index
    @stories = Story.all
  end
  
end