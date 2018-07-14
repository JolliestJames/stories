require 'rails_helper'

RSpec.describe StoriesController, type: :controller do

  describe "GET new" do

    it "returns http success" do
      get :new
      expect(response).to be_successful
    end

  end

  describe "POST create" do

    it "returns http success" do
      post :create
      expect(response).to be_successful
    end

  end

end
