module ApplicationHelper

  def todo_li_class(task)
    'done' if task.done?
  end

end
