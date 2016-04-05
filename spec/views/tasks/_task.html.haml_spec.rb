require 'rails_helper'

RSpec.describe 'tasks/_task.html.haml' do
  context 'if the task is not done' do
    it 'renders a link to mark the item done' do
      task = create(:task, done: false)

      render partial: "tasks/task.html.haml", locals: { task: task }

      expect(rendered).to have_link(task.title, href: task_finish_path(task))
    end
  end

  context 'if the task is done' do
    it 'just renders the title' do
      task = create(:task, done: true)

      render partial: "tasks/task.html.haml", locals: { task: task }

      expect(rendered).to have_content task.title
      expect(rendered).not_to have_link(task.title)
    end
  end
end
