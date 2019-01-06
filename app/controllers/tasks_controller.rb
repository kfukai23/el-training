class TasksController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    # @tasks = Task.all.order(sort_column + ' ' + sort_direction).search(params[:search])
    @tasks = Task.all.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).includes(:user)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy!
    redirect_to tasks_path, notice: "タスク「#{task.name}」を削除しました。"
  end

private
    def task_params
      params.require(:task).permit(:name, :description, :priority, :status, :deadline)
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

    def sort_column
      Task.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

end
