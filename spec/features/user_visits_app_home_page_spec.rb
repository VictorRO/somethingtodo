require 'rails_helper'

RSpec.feature "user visits app's home page" do
  scenario 'they see their current tasks in three columns: inbox, starred and later' do
    user = create(:user)
    starred_task = create(:task, priority: 'high', user: user)
    inbox_task = create(:task, priority: 'normal', user: user)
    later_task = create(:task, priority: 'low', user: user)
    completed_task = create(:task, completed_at: 1.day.ago, user: user)
    not_from_user_task = create(:task)

    sign_in(user)
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
    expect(page).not_to have_content not_from_user_task.title
  end
end
