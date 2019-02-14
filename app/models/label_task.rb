class LabelTask < ApplicationRecord
  belongs_to :task
  belongs_to :label
  
  validates  :task_id,  presence:true
  validates  :label_id, presence:true

  # before_destroy :check_free_tag

  # def check_free_tag
  #   self.label.destroy if self.label.label_tasks.count == 1
  # end  
end
