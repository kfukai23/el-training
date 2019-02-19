class Task < ApplicationRecord
    validates :name, presence: true
    validates :name, length: { maximum: 30 }
    validates :status, presence: true
    validate :deadline_is_today_or_later

    has_many :label_tasks, dependent: :destroy
    has_many :labels, through: :label_tasks
    belongs_to :user

    def deadline_is_today_or_later
        if deadline.present? && deadline < Date.today
            errors.add(:deadline, 'は昨日以前の日付は設定できません')
        end
    end

    enum priority: { 低: 0, 中: 1, 高: 2 }
    # enum status:   { 未着手: 0, 着手中: 1, 完了済: 2 }

    # FIXME:リファクタリングする
    def self.search_by_name(name)
        if name == "" || name.nil?
            all
        else
            where("name like '%" + name+ "%'")
        end
    end

    def self.search_by_description(description)
        if description == "" || description.nil?
            all
        else
            where("description like '%" + description+ "%'")
        end
    end

    def self.search(column, params)
        if params == "" || params.nil?
            all
        else
            where("#{column} = ?", params)
        end
    end

    def self.search_by_label(label, current_user)
        if label == "" || label.nil?
            all
        else
            labels = current_user.labels.where(name: label).ids
            task_ids = LabelTask.where(label_id: labels).map {|t| p t.task_id }
            Task.where(id: task_ids)
        end
    end

    def save_labels(labels, current_user)
        current_labels = self.labels.pluck(:name) unless self.labels.nil?
        old_labels = current_labels - labels
        new_labels = labels - current_labels
    
        old_labels.each do |old_name|
          self.labels.delete Label.find_by(name:old_name)
          current_user.labels.find_by(name:old_name).delete if current_user != nil && current_user.labels.find_by(name:old_name).label_tasks.blank?
        end
    
        new_labels.each do |new_name|
          label_task = current_user.labels.find_or_create_by(name:new_name)
          self.labels << label_task
        end
      end
end