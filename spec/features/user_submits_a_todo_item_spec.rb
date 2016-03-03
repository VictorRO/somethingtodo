require 'rails_helper'

RSpec.feature "User submits a todo item" do
  scenario "they see the page for the submited todo item" do
    todo_title = "First thing to do"

    visit root_path
    fill_in "todo_item_title", with: todo_title
    click_on "Submit!"

    expect(page).to have_content "First thing to do"
  end
end
