require 'rails_helper'

RSpec.feature 'user visits home page' do
  scenario 'they see the todo items in three columns, inbox, starred and later' do
    starred_todo = create(:todo_item, priority: 'high')
    inbox_todo = create(:todo_item, priority: 'normal')
    later_todo = create(:todo_item, priority: 'low')

    visit root_path

    within('#main') do
      expect(page).to have_content inbox_todo.title
    end

    within('#starred') do
      expect(page).to have_content starred_todo.title
    end

    within('#have_time') do
      expect(page).to have_content later_todo.title
    end
  end
end
