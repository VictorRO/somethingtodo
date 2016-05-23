require 'rails_helper'

RSpec.describe UsersController do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "when the user is invalid" do
      it "does not save the new user in the database" do
        expect {
          post :create, user: attributes_for(:user, :invalid)
        }.not_to change(User, :count)
      end

      it "re-renders the form" do
        post :create, user: attributes_for(:user, :invalid)
        expect(response).to render_template :new
      end
    end
  end
end
