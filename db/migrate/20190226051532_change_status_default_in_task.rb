class ChangeStatusDefaultInTask < ActiveRecord::Migration[5.2]
    def up
      change_column :tasks, :status, :string, null:false, default: "未着手"
    end
  
    def down
      change_column :tasks, :status, :string, null:false, default: 0
    end
end
