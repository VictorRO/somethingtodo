class TodoItemsController < ApplicationController
  def index
    @todo_item = TodoItem.new
    @todo_items = TodoItem.all
  end

  def create
    @todo_item = TodoItem.new todo_item_params
    if @todo_item.save
      redirect_to todo_items_path, notice: 'Item saved!'
    else
      @todo_items = TodoItem.all
      render :index
    end
  end

  private

    def todo_item_params
      params.require(:todo_item).permit(:title)
    end
end
