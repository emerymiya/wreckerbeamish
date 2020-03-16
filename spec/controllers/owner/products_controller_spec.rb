require 'rails_helper'

RSpec.describe Owner::ProductsController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe "owner/products#new action" do
    it "should redirect unauthenticated users to sign in page" do
      get :new
      expect(response.status).to eq(302)
    end
  end
end
