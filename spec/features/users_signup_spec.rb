require 'rails_helper'

RSpec.feature "Users signup" do
  scenario "they see the application root page" do
    switch_to_main_domain
    visit root_path
    click_on 'Sign up now!'

    fill_in 'user_name', with: 'James Earl Jones'
    fill_in 'user_email', with: 'james@e-jones.com'
    fill_in 'user_password', with: 'secrets'
    fill_in 'user_password_confirmation', with: 'secrets'

    click_on 'Create my account'

    expect(page).to have_content 'James Earl Jones'
    expect(page).to have_content 'Welcome to Something TO-DO!'
    expect(page).to have_selector 'ul#main'
    expect(page).to have_selector 'ul#starred'
    expect(page).to have_selector 'ul#have_time'
  end
end
