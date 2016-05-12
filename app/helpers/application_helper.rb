module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Something TO-DO"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def todo_li_class(task)
    'done' if task.done?
  end

end
