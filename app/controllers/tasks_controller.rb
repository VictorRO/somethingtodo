class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks_normal = current_user.tasks.from_today.normal
    @tasks_high = current_user.tasks.from_today.high
    @tasks_low = current_user.tasks.from_today.low
  end

  def create
    @task = Task.new task_params
    current_user.tasks << @task

    respond_to do |format|
      format.html { redirect_to root_url(subdomain: 'app') }
      format.js {}
    end
  end

  def update
    @task = Task.find params[:id]
    @task.update task_params

    respond_to do |format|
      format.html { redirect_to root_url(subdomain: 'app') }
      format.js {}
    end
  end

  private

    def task_params
      params.require(:task).permit(:title, :priority)
    end
end
