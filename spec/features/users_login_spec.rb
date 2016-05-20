require 'rails_helper'

RSpec.feature "users login" do
  scenario "they see the application root page" do
    user = create(:user)

    switch_to_main_domain
    sign_in user

    expect(page).to have_content 'Welcome to Something TO-DO!'
    expect(page).to have_selector 'ul#main'
    expect(page).to have_selector 'ul#starred'
    expect(page).to have_selector 'ul#have_time'
  end
end
