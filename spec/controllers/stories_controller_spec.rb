require 'rails_helper'

RSpec.describe StoriesController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    let(:user) { create(:user) }
    
    it "returns http redirect to stories index" do
      sign_in(user)
      post :create, {
        params: { 
          story: {
            name: "Fake story",
            description: "Fake description",
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

  describe "GET #show" do
    let(:story) { create(:story) }
    
    it "returns http success" do
      get :show, { params: { id: story.id } }
      expect(response).to be_successful
    end
  end
end
