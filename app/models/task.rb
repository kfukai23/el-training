class Task < ApplicationRecord
    validates :name, presence: true
    validates :name, length: { maximum: 30 }
    validates :status, presence: true
    # FIXME: 「今日以降の日付であること」という制限を設ける
    # validates :deadline, Date.today 
end
