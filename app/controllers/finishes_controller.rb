class FinishesController < ApplicationController
  def create
    task = Task.find(params[:task_id])

    if task.update(done: true, completed_at: Time.zone.now)
      redirect_to root_path
    end
  end
end
