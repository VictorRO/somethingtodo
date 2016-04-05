class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks_normal = Task.normal
    @tasks_high = Task.high
    @tasks_low = Task.low
  end

  def create
    @task = Task.new task_params

    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path }
        format.js {}
      end
    end
  end

  private

    def task_params
      params.require(:task).permit(:title)
    end
end
