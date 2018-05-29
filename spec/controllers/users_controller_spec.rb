require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET signup" do
    it "returns http success" do
      get :new
      expect(response).to be_successful
    end
  end

end
