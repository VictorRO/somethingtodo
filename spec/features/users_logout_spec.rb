require 'rails_helper'

RSpec.feature "users logout" do
  scenario "they are back the home page" do
    user = create(:user)

    switch_to_main_domain
    sign_in(user)
    switch_to_subdomain('app')

    click_on 'Log out'

    expect(page).to have_selector :link, 'Sign in', href: '/login'
    expect(page).to have_selector :link, 'Sign up now!', href: '/signup'
  end
end
