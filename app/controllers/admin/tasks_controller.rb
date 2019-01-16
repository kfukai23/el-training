class Admin::TasksController < ApplicationController
  before_action :require_admin

  def index
    @tasks = Task.all.order(sort_column + ' ' + sort_direction).search(params[:search]).page(params[:page]).includes(:user)
  end

  private 

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
end
