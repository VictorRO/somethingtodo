require 'rails_helper'

RSpec.feature "User submits a task" do
  scenario "they see the submited task in the INBOX list", :js do
    task_title = "First thing to do"

    switch_to_subdomain('app')
    visit root_path
    fill_in "task_title", with: task_title
    find("form#new_task").trigger('submit')

    within 'ul#main' do
      expect(page).to have_content "First thing to do"
    end

    expect(find("#new_task").find("input[type=text]")).not_to eq task_title
  end
end
