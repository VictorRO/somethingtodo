require 'rails_helper'

RSpec.feature "User submits a todo item" do
  scenario "they see the submited todo item in the list", :js do
    todo_title = "First thing to do"

    visit root_path
    fill_in "todo_item_title", with: todo_title
    find("[data-role=submit]").click

    expect(page).to have_content "First thing to do"
  end

  # context "the form is invalid" do
  #   scenario "they see the error message", :js do
  #     visit root_path
  #     find("[data-role=submit]").click
  #
  #     expect(page).to have_content "no pot estar en blanc"
  #   end
  # end
end
