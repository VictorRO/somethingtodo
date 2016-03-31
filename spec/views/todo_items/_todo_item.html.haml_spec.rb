require 'rails_helper'

RSpec.describe 'todo_items/_todo_item.html.haml' do
  context 'if the item is not done' do
    it 'renders a link to mark the item done' do
      todo_item = create(:todo_item, done: false)

      render partial: "todo_items/todo_item.html.haml", locals: { todo_item: todo_item }

      expect(rendered).to have_link(todo_item.title, href: todo_item_finish_path(todo_item))
    end
  end

  context 'if the item is done' do
    it 'just renders the title' do
      todo_item = create(:todo_item, done: true)

      render partial: "todo_items/todo_item.html.haml", locals: { todo_item: todo_item }

      expect(rendered).to have_content todo_item.title
      expect(rendered).not_to have_link(todo_item.title)
    end
  end
end
