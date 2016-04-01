require 'rails_helper'

RSpec.feature "User marks a todo item as done" do
  scenario "they see the todo item in the DONE list" do
    item = create(:todo_item)

    visit root_path

    click_link item.title

    expect(page).to have_css "li#todo_item_#{item.id}.done", text: item.title
  end
end
