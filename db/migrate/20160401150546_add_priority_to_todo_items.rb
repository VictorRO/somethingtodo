class AddPriorityToTodoItems < ActiveRecord::Migration
  def change
    add_column :todo_items, :priority, :string, default: 'normal'
  end
end
