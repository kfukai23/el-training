class ChangeTasksStatusDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tasks, :status, default: 0
  end
end
