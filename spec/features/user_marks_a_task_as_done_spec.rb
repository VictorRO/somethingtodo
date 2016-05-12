require 'rails_helper'

RSpec.feature "User marks a todo item as done" do
  scenario "they see the todo item in the DONE list", :js do
    task = create(:task, done: false)

    switch_to_subdomain('app')
    visit root_path
    page.find("li#task_#{task.id} a").trigger('click')

    within('#main') do
      expect(page).to have_css "li#task_#{task.id}.done", text: task.title
    end
  end
end
