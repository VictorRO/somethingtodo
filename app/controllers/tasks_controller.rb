class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks_normal = Task.from_today.normal
    @tasks_high = Task.from_today.high
    @tasks_low = Task.from_today.low
  end

  def create
    @task = Task.new task_params
    @task.save

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  def update
    @task = Task.find params[:id]
    @task.update task_params

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  private

    def task_params
      params.require(:task).permit(:title, :priority)
    end
end
