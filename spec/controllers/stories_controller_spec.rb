require 'rails_helper'

RSpec.describe StoriesController, type: :controller do

  describe "GET new" do

    #a user can/should only get new story if they are logged in
    it "returns http success" do
      get :new
      expect(response).to be_successful
    end

  end

end
