class RenameTodoItemsToTasks < ActiveRecord::Migration
  def change
    rename_table :todo_items, :tasks
  end
end
