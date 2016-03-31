require 'rails_helper'

RSpec.feature "User marks a todo item as done" do
  scenario "they see the todo item in the DONE list" do
    item = create(:todo_item)

    visit root_path

    within "#todo" do
      click_link item.title
    end

    within "#done" do
      expect(page).to have_content item.title
    end
  end
end
