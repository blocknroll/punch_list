require 'rails_helper'

RSpec.describe ListsController, type: :controller do

  describe "GET #index" do

    it "responds with an HTTP 200 success status" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end


    it "responds with the index template" do
      get :index

      expect(response).to render_template("index")
    end

  end

end
