class Task < ApplicationRecord
    validates :name, presence: true
    validates :name, length: { maximum: 30 }
    validates :status, presence: true
    # FIXME: 「今日以降の日付であること」という制限を設ける
    validate :deadline_is_today_or_later

    def deadline_is_today_or_later
        if deadline.present? && deadline < Date.today
            errors.add(:deadline, '昨日以前の日付は締切日に設定できません')
        end
    end

end
