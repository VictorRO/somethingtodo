require 'rails_helper'

RSpec.feature "User marks a todo item as done" do
  scenario "they see the todo item in the DONE list" do
    task = create(:task)

    visit root_path

    click_link task.title

    expect(page).to have_css "li#task_#{task.id}.done", text: task.title
  end
end
