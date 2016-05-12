require 'rails_helper'

RSpec.feature 'user visits home page' do
  scenario 'they see the static home page with the links to sign up and sign into the applicaation' do
    switch_to_main_domain
    visit root_path

    expect(page).to have_selector :link, 'Sign in', href: '#'
    expect(page).to have_selector :link, 'Sign up now!', href: '/signup'
  end
end
