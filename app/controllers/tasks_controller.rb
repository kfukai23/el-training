class TasksController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    # FIXME:リファクタリングする
    @tasks = current_user.tasks.order(sort_column + ' ' + sort_direction).search_by_name(params[:name]).search_by_description(params[:description]).search('status', params[:status]).search('priority', params[:priority]).page(params[:page]).includes(:user)
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = current_user.tasks.new
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    label_list = params[:label].split(",")
      
    if @task.save
      @task.save_labels(label_list)
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
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
      Task.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

end
