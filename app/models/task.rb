class Task < ApplicationRecord
    validates :name, presence: true
    validates :name, length: { maximum: 30 }
    validates :status, presence: true
    validate :deadline_is_today_or_later

    belongs_to :user

    def deadline_is_today_or_later
        if deadline.present? && deadline < Date.today
            errors.add(:deadline, 'は昨日以前の日付は設定できません')
        end
    end

    enum priority: { 低: 0, 中: 1, 高: 2 }
    # enum status:   { 未着手: 0, 着手中: 1, 完了済: 2 }

    #FIXME: 共通部分を抽象化する
    def self.search_by_name(name)
        if name == "" || name.nil?
            all
        else
            where("name like '%" + name+ "%'")
        end
    end

    def self.search(column, params)
        if params == "" || params.nil?
            all
        else
            where("#{column} = ?", params)
        end
    end
end