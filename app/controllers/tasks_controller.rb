class TasksController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    # FIXME:リファクタリングする
    @tasks = current_user.tasks.order(sort_column + ' ' + sort_direction).search_by_name(params[:name]).search_by_description(params[:description]).search('status', params[:status]).search_by_label(params[:label], current_user).page(params[:page]).includes(:user, :labels)
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = current_user.tasks.new
  end

  def edit
    @task = current_user.tasks.find(params[:id])
    @labels = @task.labels.pluck(:name).join(",")
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    label_list = params[:label].split(",")
      
    if @task.save
      @task.save_labels(label_list, current_user)
      redirect_to tasks_path, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    
    label_list = params[:label].split(",")
    if @task.update(task_params)
      @task.save_labels(label_list, current_user)
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
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def sort_column
      Task.column_names.include?(params[:sort]) ? params[:sort] : "deadline"
    end

end
