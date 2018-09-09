require 'rails_helper'

RSpec.describe MemoriesController, type: :controller do

  describe "GET #new" do
    let(:user) { create(:user) }

    it "returns http success" do
      sign_in(user)
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    let(:user) { create(:user) }
    let(:story) { create(:story, user: user) }

    it "returns http redirect to index" do
      sign_in(user)
      post :create, {
        params: {
          memory: {
            name: "Fake memory",
            description: "Fake description",
            date: Date.new,
            image: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/me.jpg'), 'image/jpeg'),
            story_id: story.id
          }
        }
      }
      expect(response).to redirect_to :action => :index
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_successful
    end
  end
end
