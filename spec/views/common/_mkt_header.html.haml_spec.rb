require 'rails_helper'

RSpec.describe 'common/_mkt_header.html.haml' do
  context "when there is no logged user" do
    it "renders the login button" do
      render partial: "common/mkt_header.html.haml"
      expect(rendered).to have_link('Sign in', href: login_path)
    end
  end

  context "when ther is a logged user" do
    it "renders the 'Manage your tasks' button" do
      user = create(:user)
      set_user_session(user)

      render partial: "common/mkt_header.html.haml"
      expect(rendered).to have_link('Manage your tasks', href: app_root_url)
    end
  end
end
