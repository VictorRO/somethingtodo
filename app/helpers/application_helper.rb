module ApplicationHelper

  def todo_li_class(todo_item)
    'done' if todo_item.done?
  end

end
