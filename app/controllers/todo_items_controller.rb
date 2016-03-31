class TodoItemsController < ApplicationController
  def index
    @todo_item = TodoItem.new
    @todo_items = TodoItem.todo
    @done_items = TodoItem.done
  end

  def create
    @todo_item = TodoItem.new todo_item_params

    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to root_path }
        format.js {}
      end
    end
  end

  private

    def todo_item_params
      params.require(:todo_item).permit(:title)
    end
end
