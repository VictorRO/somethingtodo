require 'rails_helper'

RSpec.feature "user visits app's home page" do
  scenario 'they see the current tasks in three columns, inbox, starred and later' do
    starred_task = create(:task, priority: 'high')
    inbox_task = create(:task, priority: 'normal')
    later_task = create(:task, priority: 'low')
    completed_task = create(:task, completed_at: 1.day.ago)

    switch_to_subdomain('app')
    visit root_path

    within('#main') do
      expect(page).to have_content inbox_task.title
    end

    within('#starred') do
      expect(page).to have_content starred_task.title
    end

    within('#have_time') do
      expect(page).to have_content later_task.title
    end

    expect(page).not_to have_content completed_task.title
  end
end
