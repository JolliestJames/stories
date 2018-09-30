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

    before(:each) do
      sign_in(user)
    end
    
    it "returns http redirect to index" do
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

    it "uses today's date if no date is provided" do
      post :create, {
        params: {
          memory: {
            name: "Fake memory",
            description: "Fake description",
            date: nil,
            image: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/me.jpg'), 'image/jpeg'),
            story_id: story.id
          }
        }
      }
      expect(response).to redirect_to :action => :index
    end

    it "uses the date for the name if no name is provided" do
      post :create, {
        params: {
          memory: {
            name: nil,
            description: "Fake description",
            date: Date.today,
            image: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/me.jpg'), 'image/jpeg'),
            story_id: story.id
          }
        }
      }
      expect(response).to redirect_to :action => :index
    end

    it "allows the user to provide no description" do
      post :create, {
        params: {
          memory: {
            name: "Fake memory",
            description: nil,
            date: Date.today,
            image: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/me.jpg'), 'image/jpeg'),
            story_id: story.id
          }
        }
      }
      expect(response).to redirect_to :action => :index
    end

    it "does not allow the user to provide no image" do
      post :create, {
        params: {
          memory: {
            name: "Fake memory",
            description: "Fake description",
            date: Date.today,
            image: nil,
            story_id: story.id
          }
        }
      }
      expect(response).to be_successful
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_successful
    end
  end
end
