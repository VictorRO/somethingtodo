require 'rails_helper'

RSpec.describe SessionsController do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with invalid information" do
      it "re-renders the form" do
        post :create, session: { email: 'invalid email', password: nil }
        expect(response).to render_template :new
      end
    end

    context "with valid information" do
      let(:user) { create(:user) }

      it "logs in the user" do
        post :create, session: { email: user.email, password: user.password }
        expect(session[:user_id]).to eq user.id
      end

      it "redirects to the application root path" do
        post :create, session: { email: user.email, password: user.password }
        expect(response).to redirect_to root_url(subdomain: 'app')
      end
    end
  end
end
