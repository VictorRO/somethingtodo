class FinishesController < ApplicationController
  def create
    todo_item = TodoItem.find(params[:todo_item_id])

    if todo_item.update(done: true)
      redirect_to root_path
    end
  end
end
