require 'rails_helper'

RSpec.describe MemoriesController, type: :controller do

  describe "GET new" do

    it "returns http success" do
      get :new
      expect(response).to be_successful
    end

  end

  describe "GET create" do
    let(:story) { create(:story) }

    it "returns http redirect to index" do
      @user = User.find(story.user_id)
      sign_in(@user)
      post :create, {
        params: {
          memory: {
            name: "Fake memory",
            description: "Fake description",
            date: Date.new,
            image: "Fake image",
            story_id: story.id
          }
        }
      }
      expect(response).to redirect_to :action => :index
    end

  end

  describe "GET index" do

    it "returns http success" do
      get :index
      expect(response).to be_successful
    end

  end

end
