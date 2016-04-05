class FinishesController < ApplicationController
  def create
    task = Task.find(params[:task_id])

    if task.update(done: true)
      redirect_to root_path
    end
  end
end
