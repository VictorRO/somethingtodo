module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Something TO-DO"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def todo_li_class(task)
    'done' if task.done?
  end

  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      tag_options = { class: "alert fade in alert-#{type}", role: "alert" }

      close_button = content_tag(:button, raw("&times;"), type: "button", class: "close", "data-dismiss" => "alert")

      Array(message).each do |msg|
        text = content_tag(:div, close_button + msg, tag_options)
        flash_messages << text if msg
      end
    end

    flash_messages.join("\n").html_safe
  end
end
